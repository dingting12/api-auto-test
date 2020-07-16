--Description: doc 9.6.6 external TD
--Date：2020-07-14
--Author：丁婷

drop table t_teradata_1 if exists;

CREATE EXTERNAL TABLE t_teradata_1 BY
jdbc('table':'T_TD_TEST_001',
  'driver':'com.teradata.jdbc.TeraDriver',
  'url':'jdbc:teradata://192.168.1.136/CLIENT_CHARSET=cp936,TMODE=TERA,CHARSET=ASCII,LOB_SUPPORT=ON,COLUMN_NAME = ON,MAYBENULL = ON,database=testdblinkbase',
  'user':'testdblink',
  'password':'testdblink'
);

select * from t_teradata_1