#!/bin/bash
LDB_CLIENT=/home/ldbp62/linkoopdb/linkoopdb_current/bin/ldb-client.sh
LDB_SERVER=node71:9115
LDB_USER=admin
LDB_PASS=123456

function timediff()
{
    start_time=$1
    end_time=$2

    start_s=${start_time%.*}
    start_nanos=${start_time#*.}
    end_s=${end_time%.*}
    end_nanos=${end_time#*.}

    # end_nanos > start_nanos?
    # Another way, the time part may start with 0, which means
    # it will be regarded as oct format, use "10#" to ensure
    # calculateing with decimal
    if [ "$end_nanos" -lt "$start_nanos" ];then
        end_s=$(( 10#$end_s - 1 ))
        end_nanos=$(( 10#$end_nanos + 10**9 ))
    fi
    time=$(( 10#$end_s - 10#$start_s )).`printf "%03d\n" $(( (10#$end_nanos - 10#$start_nanos)/10**6 ))`

    echo $time
}

# clean old logs
rm -f -r *log
rm -f prepare.sql
rm -f sqldiff.rpt
rm -f hdfs.rpt
rm -f sqlstat.rpt

# compare current sql with origin sql
for file in $(ls ldb_template/query*tpl)
do
  script=$(basename $file)
  diff -aru tpcds_template/$script ldb_template/$script > /dev/null
  if [ $? -ne 0 ]; then
     echo $script:执行SQL和标准SQL的区别 >> sqldiff.rpt
     diff -aru tpcds_template/$script ldb_template/$script >> sqldiff.rpt
     echo "" >> sqldiff.rpt
  fi
done

# run data load
TPC_DATA_URL=hdfs:\\/\\/node73:8020\\/dev\\/tpcds\\/tpcds-1g-parquet
echo "检查生成后的TPC-DS目录总大小。使用 hadoop fs -du -s -h 命令" >> hdfs.rpt
hadoop fs -du -s -h ${TPC_DATA_URL//\\/} >> hdfs.rpt
echo "检查生成后的 TPC-DS 子目录大小。使用 hadoop fs -du -h 命令" >> hdfs.rpt
hadoop fs -du -h ${TPC_DATA_URL//\\/} >> hdfs.rpt

#  replace prepare.sql
echo "sed 's/\${tpcds_data_url}/$TPC_DATA_URL/g' prepare.tbl > prepare.sql"|sh
script=prepare.sql
echo "Begin process $script ...."
log_file=$(basename $script .sql).log 
starttime=`date +%s`
$LDB_CLIENT $LDB_SERVER $LDB_USER $LDB_PASS >$log_file 2>&1 <<EOF
\i $PWD/$script
\q
EOF
endtime=`date +%s`
echo "End process "$script "Time Cost:" $(timediff $starttime $endtime)"ms"

# run test script
for script in $(ls query*sql)
do
    log_file=$(basename $script .sql).log 
    echo "Begin process $script ...."
    starttime=`date +%s`
$LDB_CLIENT $LDB_SERVER $LDB_USER $LDB_PASS >$log_file 2>&1 <<EOF
\i $PWD/$script
\q
EOF
    endtime=`date +%s`
    echo "tail -n 8 $log_file"|sh >> sqlstat.rpt
    echo "" >> sqlstat.rpt
    echo "End process "$script "Time Cost:" $(timediff $starttime $endtime)"ms" >> sqlstat.rpt
    echo "" >> sqlstat.rpt
done

echo "###   ##  #   # #### "
echo "#  # #  # ##  # #    "
echo "#  # #  # ##  # #    "
echo "#  # #  # # # # ###  "
echo "#  # #  # #  ## #    "
echo "#  # #  # #  ## #    "
echo "###   ##  #   # #### "
