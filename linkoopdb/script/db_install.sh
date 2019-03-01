#!/bin/bash
workdir=$(cd $(dirname $0); pwd)
source $workdir/install.properties
#check if user is root  
if [ $(id -u) != "0" ];then  
   echo "Error: You must be root to run this script"	  
   exit 1  
fi

#add_user
USER_COUNT=`cat /etc/passwd | grep ^$USER_NAME: -c`
if [ $USER_COUNT -ne 1 ]
 then
 useradd $USER_NAME
 echo "123456" | passwd $USER_NAME --stdin
 echo "user $USER_NAME add sucessfully!"
 else
 echo "$USER_NAME is exsits."
fi
usermod -a -G hdfs $USER_NAME

#mkdir
mkdir -p $db_home/logs
mkdir -p $db_home/others/solr-5.3.2/datasets


echo "开始安装linkoopdb及其他组件。。。"
cd $db_home/others
cp $solr_loc $spark_loc $kafka_loc $flink_loc $pallas_loc ./

#db安装
function db_install {
    dirname=`tar -tzf $db_loc | head -1 | cut -f1 -d"/"`
    tar -zxvf $db_loc -C $db_home
	sleep 5s
    #建立linkoopdb链接
    cd $db_home
    ln -s $dirname linkoopdb_current
	#修改db配置文件

    # 1.ldb-env.sh
sed -i "s/\${linkoop.feature}/ldb/g" $db_home/linkoopdb_current/conf/ldb-env.sh 
sed -i "s?hdfs:\/\/node1\/node4\/linkoopdb\/litianqi\/dist?hdfs:\/\/$LINKOOPDB_BASE?g" $db_home/linkoopdb_current/conf/ldb-env.sh
sed -i "s?\/home\/litianqi\/linkoopdb\/others\/spark-2.3.1-bin-datapps-dev?$db_home\/others\/$SPARK_VERSION-bin-datapps-dev?g" $db_home/linkoopdb_current/conf/ldb-env.sh
#sed -i "s/litianqi/linkoopdb/g" $db_home/linkoopdb_current/conf/ldb-env
sed -i "s/spark-1.2.0/spark-2.0.0/g" $db_home/linkoopdb_current/conf/ldb-env.sh
sed -i "s?hdfs:\/\/node4\/linkoopdb\/litianqi\/spark-2.3.1\/jars\/\*.jar?hdfs:\/\/$LINKOOPDB_BASE\/$USER_NAME\/$SPARK_VERSION\/jars\/\*.jar?g" $db_home/linkoopdb_current/conf/ldb-env.sh
sed -i "s/node4:8984/$node:$solr_port/g" $db_home/linkoopdb_current/conf/ldb-env.sh 
sed -i "s?litianqi?$USER_NAME?g" $db_home/linkoopdb_current/conf/ldb-env.sh
    # 2.ldb.properties
sed -i "s/worker.queue=linkoopdb/worker.queue=default/g" $db_home/linkoopdb_current/conf/ldb.properties
sed -i "s/localhost/$node/g" $db_home/linkoopdb_current/conf/ldb.properties

    # 3.ldb-env-client.sh
sed -i "s?\/home\/wangd\/software\/jdk1.8.0_172?$JAVA_HOME?g" $db_home/linkoopdb_current/conf/ldb-env-client.sh

}


function kafka_install {
    cd $db_home/others
    kafka_dirname=`tar -tzf $kafka_loc | head -1 | cut -f1 -d"/"`
    tar -zxvf $kafka_loc -C $db_home/others
	
	cd $db_home/others/$kafka_dirname/config
    mv server.properties server.properties_bak
    cat > server.properties << EOF
broker.id=0
listeners=PLAINTEXT://:9092
port=29092
host.name=$node
advertised.host.name=$node
advertised.port=29093
num.network.threads=3
num.io.threads=8
socket.send.buffer.bytes=102400
socket.receive.buffer.bytes=102400
socket.request.max.bytes=104857600
log.dirs=/tmp/kafka-logs
num.partitions=1
num.recovery.threads.per.data.dir=1
log.retention.hours=48
log.segment.bytes=1073741824
log.retention.check.interval.ms=300000
zookeeper.connect=${zklist}/linkoopdb/kafka
zookeeper.connection.timeout.ms=6000
delete.topic.enable=true
EOF
    cd -
}


function spark_install {
    spark_dirname=`tar -tzf $spark_loc | head -1 | cut -f1 -d"/"`
	tar -zxvf $spark_loc -C $db_home/others
	#创建spark依赖的LinkoopDB jar包链接。
    ln -s $db_home/linkoopdb_current/ldb-worker/lib/* $db_home/others/$SPARK_VERSION-bin-datapps-dev/jars
    sudo -u hdfs hadoop fs -mkdir -p $LINKOOPDB_BASE/$USER_NAME/$SPARK_VERSION
    sudo -u hdfs hadoop fs -chown -R $USER_NAME:hdfs $LINKOOPDB_BASE
    su - $USER_NAME -c "hadoop fs -put $db_home/others/$SPARK_VERSION-bin-datapps-dev/jars $LINKOOPDB_BASE/$USER_NAME/$SPARK_VERSION"
    sleep 30

    #配置spark配置文件
    cd $db_home/others/$spark_dirname/conf/
    cp spark-defaults.conf.template spark-defaults.conf
    echo "spark.driver.extraJavaOptions -Dhdp.version=$hdp_version
    spark.yarn.am.extraJavaOptions -Dhdp.version=$hdp_version
    spark.hadoop.yarn.timeline-service.enabled=false
    spark.yarn.jars=hdfs://$LINKOOPDB_BASE/$USER_NAME/$SPARK_VERSION/jars/*.jar" >> spark-defaults.conf

    cd $db_home/others/$SPARK_VERSION-bin-datapps-dev/conf/
    cp spark-env.sh.template spark-env.sh
    echo "HADOOP_CONF_DIR=/etc/hadoop/conf
    SPARK_MASTER_WEBUI_PORT=9090
    export SPARK_CLASSPATH=/usr/hdp/current/tez-client:/usr/hdp/current/tez-client/lib:/usr/hdp/current/hive-client/lib:
    export JAVA_HOME=$java_home" >> spark-env.sh

}


function install_solr {
    solr_dirname=`tar -tzf $solr_loc | head -1 | cut -f1 -d"/"`
    mkdir -p $db_home/others/solr-5.3.2/datasets
    tar -zxvf $solr_loc -C $db_home/others
    ln -s $db_home/linkoopdb_current/ldb-server/repository/* $db_home/others/$solr_dirname/server/solr/configsets
}






chown -R $USER_NAME:$USER_NAME $db_home 

sleep 4


cd $db_home
echo "开始安装linkoopDB."
dirname=`tar -tzf $db_loc | head -1 | cut -f1 -d"/"`
if [ -d "./$dirname" ];then
   #echo "当前linkoopDB版本已经存在。"
   #exit 1
   read -n1 -p "当前linkoopDB版本已经存在,确定重新安装么[y/n]?" answer
   case $answer in   
 Y | y)  
       echo  
       rm -f linkoopdb_current
       rm -rf$dirname
       db_install 
       echo "安装linkoopDB成功....";;
 N | n)  
       echo   
       echo "忽略重新安装linkoopDB...."  
       exit 10 ;;  
   *)  
       echo   
       echo "请输入正确的参数....."   
       exit 11 ;;  
 esac
else
   echo "开始安装linkoopDB..."
   db_install
fi




#安装solr
echo "开始安装solr。"
cd $db_home/others
solr_dirname=`tar -tzf $solr_loc | head -1 | cut -f1 -d"/"`

if [ -d "./$solr_dirname" ];then
rm -rf $solr_dirname
install_solr
else
install_solr
fi
echo "solr安装成功。"
sleep 20s




#安装flink
echo "开始安装flink。"
cd $db_home/others
flink_dirname=`tar -tzf $flink_loc | head -1 | cut -f1 -d"/"`
if [ -d "./$flink_dirname" ];then
rm -rf $flink_dirname
tar -zxvf $flink_loc -C $db_home/others
else
tar -zxvf $flink_loc -C $db_home/others
fi

#echo "flink安装成功。"

安装pallas
cd $db_home/others
tar -zxvf $pallas_loc

#安装spark
echo "开始安装spark。"
spark_dirname=`tar -tzf $spark_loc | head -1 | cut -f1 -d"/"`
cd $db_home/others
if [ -d "./$spark_dirname" ];then
rm -rf $spark_dirname
spark_install
else
spark_install
fi

echo "spark安装成功。"

sleep 5s

#安装kafka
echo "开始安装kafka。"
cd $db_home/others
kafka_dirname=`tar -tzf $kafka_loc | head -1 | cut -f1 -d"/"`
if [ -d "./$kafka_dirname" ];then
rm -rf $kafka_dirname
kafka_install
else
kafka_install
fi
echo "kafka安装成功。"
sleep 20s


echo "开始启动服务。。。"

chown -R $USER_NAME:$USER_NAME $db_home
chown -R $USER_NAME:$USER_NAME /tmp/kafka-logs

#启动solr

cd $db_home/others/solr-5.3.2
su - $USER_NAME -c "$db_home/others/solr-5.3.2/bin/solr start -p $solr_port -a \"-Dsolr.data.dir=$db_home/others/solr-5.3.2/datasets\""
echo "solr启动成功。"
#启动kafka
cd $db_home/others/kafka_2.10-0.10.0.1/
su - $USER_NAME -c "nohup $db_home/others/kafka_2.10-0.10.0.1/bin/kafka-server-start.sh $db_home/others/kafka_2.10-0.10.0.1/config/server.properties &"
echo "kafka启动成功。"
#创建topic
cd $db_home/others/kafka_2.10-0.10.0.1/
su - $USER_NAME -c "$db_home/others/kafka_2.10-0.10.0.1/bin/kafka-topics.sh -create --zookeeper ${zklist}/linkoopdb/kafka --replication-factor 1 --partitions 1 --topic linkoopdb.logkeeper"
su - $USER_NAME -c "$db_home/others/kafka_2.10-0.10.0.1/bin/kafka-topics.sh -create --zookeeper ${zklist}/linkoopdb/kafka --replication-factor 1 --partitions 1 --topic linkoopdb.task.group.monitor"



# 启动linkoopdb
cd $db_home/linkoopdb_current
su - $USER_NAME -c "$db_home/linkoopdb_current/	bin/ldb-server.sh start"
echo "linkoopdb启动成功。"


echo "安装完成"
