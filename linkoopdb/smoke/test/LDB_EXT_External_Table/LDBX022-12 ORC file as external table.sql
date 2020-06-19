drop table t_external_ORC  IF  EXISTS;

CREATE EXTERNAL TABLE t_external_ORC BY ORC('location':'hdfs:///node74/stream74/linkoopdb/data/users.orc');

select * from t_external_ORC order by name;