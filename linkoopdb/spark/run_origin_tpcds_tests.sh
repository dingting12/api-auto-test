#!/bin/bash -il
if [ $# -ne 6 ];then
    echo "this script need three para."
    echo "1.spark home"
    echo "2.jar path"
    echo "3.tpcds data directory in HDFS;"
    echo "4.output file directory"
    echo "5.true or false; collect stats"
    echo "6.tpcds all sql or someone.   all: all sql will run;q16:only run tpcds q16 query"
    exit 1
fi

nohup $1/bin/spark-submit --class com.datapps.hgw.tpcs.TpcdsTests \
--master yarn \
--deploy-mode client \
--queue default \
--driver-memory 24G \
--executor-memory 20G \
--executor-cores 6 \
--num-executors 12 \
$2 $3 $4/result.xml $5 $6