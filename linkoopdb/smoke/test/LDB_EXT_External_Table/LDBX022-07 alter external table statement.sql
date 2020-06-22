set echo on

drop table t_alter_parquet  IF  EXISTS;


CREATE EXTERNAL TABLE t_alter_parquet BY PARQUET('location':'hdfs://node73:8020/node74/stream74/linkoopdb/data/parquet');

select * from t_alter_parquet order by id;

ALTER TABLE PUBLIC.t_alter_parquet AS ("I_ITEM_SK" INTEGER , "I_ITEM_ID" VARCHAR(32768) , "I_CURRENT_PRICE" VARCHAR(32768)) LOCATION ('hdfs://node73:8020/node74/stream74/linkoopdb/data/parquet1') FORMAT 'parquet';

select * from t_alter_parquet order by I_ITEM_SK;