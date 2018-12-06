

#需要输入用户名，如$USER_NAME $1
#需要输入linkoop包名 $2
#变量值根据情况修改

#user_name
USER_NAME=$1
#spark_version
SPARK_VERSION=spark-2.4.0
#zklist
zklist="node1:2181,node2:2181,node3:2181"
#hdp_version
hdp_version=2.6.5.0-292
#java_home
java_home=/usr/java/jdk1.8.0_60
#node 主机名
node=node9
#solr_port
solr_port=8983


#create_user
USER_COUNT=`cat /etc/passwd | grep ^$USER_NAME: -c`
if [ $USER_COUNT -ne 1 ]
 then
 useradd $USER_NAME
 echo "123456" | passwd $USER_NAME --stdin
 else
 echo '用户已存在.'
fi
usermod -a -G hdfs $USER_NAME

#mkdir
mkdir -p /home/$USER_NAME/linkoopdb/logs
mkdir -p /home/$USER_NAME/linkoopdb/others
mkdir -p /home/$USER_NAME/linkoopdb/others/solr-5.3.2/datasets

#download tar
cd /home/$USER_NAME/linkoopdb
wget http://192.168.1.133:12345/dist/linkoopdb/1.2.0/latest.tar.gz

cd /home/$USER_NAME/linkoopdb/others
wget http://192.168.1.133:12345/tools/solr-5.3.2.tgz

wget http://192.168.1.133:12345/dist/spark/2.4.0/2018-12-04/spark-2.4.0-bin-datapps-dev.tar.gz

wget http://192.168.1.133:12345/tools/kafka_2.10-0.10.0.1.tgz

chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/linkoopdb

sleep 4


cd /home/$USER_NAME/linkoopdb
dirname=`tar -tzf $2 | head -1 | cut -f1 -d"/"`
tar -zxvf $2

sleep 20s

#建立linkoopdb链接
cd /home/$USER_NAME/linkoopdb
ln -s $dirname linkoopdb_current

#安装solr
cd /home/$USER_NAME/linkoopdb/others

tar -zxvf solr-5.3.2.tgz

sleep 20s

ln -s /home/$USER_NAME/linkoopdb/linkoopdb_current/ldb-server/repository/* /home/$USER_NAME/linkoopdb/others/solr-5.3.2/server/solr/configsets




#安装spark
cd /home/$USER_NAME/linkoopdb/others
tar -zxvf $SPARK_VERSION-bin-datapps-dev.tar.gz

sleep 20s

#创建spark依赖的LinkoopDB jar包链接。
ln -s /home/$USER_NAME/linkoopdb/linkoopdb_current/ldb-worker/lib/* /home/$USER_NAME/linkoopdb/others/$SPARK_VERSION-bin-datapps-dev/jars
sudo -u hdfs hadoop fs -mkdir -p /$node/linkoopdb/$USER_NAME/$SPARK_VERSION
sudo -u hdfs hadoop fs -chown -R $USER_NAME:hdfs /$node/linkoopdb/$USER_NAME/$SPARK_VERSION
su - $USER_NAME -c "hadoop fs -put /home/$USER_NAME/linkoopdb/others/$SPARK_VERSION-bin-datapps-dev/jars /$node/linkoopdb/$USER_NAME/$SPARK_VERSION"
sleep 30

#配置spark配置文件
cd /home/$USER_NAME/linkoopdb/others/$SPARK_VERSION-bin-datapps-dev/conf/
cp spark-defaults.conf.template spark-defaults.conf
echo "spark.driver.extraJavaOptions -Dhdp.version=$hdp_version
spark.yarn.am.extraJavaOptions -Dhdp.version=$hdp_version
spark.hadoop.yarn.timeline-service.enabled=false
spark.yarn.jars=hdfs:///$node/linkoopdb/$USER_NAME/$SPARK_VERSION/jars/*.jar" >> spark-defaults.conf

cd /home/$USER_NAME/linkoopdb/others/$SPARK_VERSION-bin-datapps-dev/conf/
cp spark-env.sh.template spark-env.sh
echo "HADOOP_CONF_DIR=/etc/hadoop/conf
SPARK_MASTER_WEBUI_PORT=9090
export SPARK_CLASSPATH=/usr/hdp/current/tez-client:/usr/hdp/current/tez-client/lib:/usr/hdp/current/hive-client/lib:
export JAVA_HOME=$java_home" >> spark-env.sh

#安装kafka
cd /home/$USER_NAME/linkoopdb/others
tar -zxvf kafka_2.10-0.10.0.1.tgz

sleep 20s

cd /home/$USER_NAME/linkoopdb/others/kafka_2.10-0.10.0.1/config
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

chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/linkoopdb
#启动solr
cd /home/$USER_NAME/linkoopdb/others/solr-5.3.2
su - $USER_NAME -c "/home/$USER_NAME/linkoopdb/others/solr-5.3.2/bin/solr start -p $solr_port -a \"-Dsolr.data.dir=/home/$USER_NAME/linkoopdb/others/solr-5.3.2/datasets\""

#启动kafka
cd /home/$USER_NAME/linkoopdb/others/kafka_2.10-0.10.0.1/
su - $USER_NAME -c "nohup /home/$USER_NAME/linkoopdb/others/kafka_2.10-0.10.0.1/bin/kafka-server-start.sh config/server.properties &"

#创建topic
cd /home/$USER_NAME/linkoopdb/others/kafka_2.10-0.10.0.1/
su - $USER_NAME -c "/home/$USER_NAME/linkoopdb/others/kafka_2.10-0.10.0.1/bin/kafka-topics.sh -create --zookeeper ${zklist}/linkoopdb/kafka --replication-factor 1 --partitions 1 --topic linkoopdb.logkeeper"
su - $USER_NAME -c "/home/$USER_NAME/linkoopdb/others/kafka_2.10-0.10.0.1/bin/kafka-topics.sh -create --zookeeper ${zklist}/linkoopdb/kafka --replication-factor 1 --partitions 1 --topic linkoopdb.task.group.monitor"





















