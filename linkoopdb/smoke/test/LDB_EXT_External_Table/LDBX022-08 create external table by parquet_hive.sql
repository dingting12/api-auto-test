drop table t_external_parquet  IF  EXISTS;

drop table t_external_hive  IF  EXISTS;

drop table t_external_mysql  IF  EXISTS;

CREATE EXTERNAL TABLE t_external_parquet BY PARQUET('location':'hdfs://node73:8020/node74/stream74/linkoopdb/data/parquet');

select * from t_external_parquet order by id;

CREATE EXTERNAL TABLE t_external_hive BY HIVE('table':'studio_test.TEST_TAB');

select * from t_external_hive order by id;

CREATE EXTERNAL TABLE t_external_mysql BY
jdbc('table':'EMP',
'driver':'com.mysql.jdbc.Driver',
'url':'jdbc:mysql://192.168.1.72:3306/studio_test',
'user':'test',
'password':'123456');

select * from t_external_mysql order by empno;