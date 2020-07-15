--Description: doc 9.6.6 external TD
--Date：2020-07-14
--Author：丁婷

CREATE EXTERNAL TABLE t_teradata_1 BY
jdbc('table':'Teradata_t1',
  'driver':'com.teradata.jdbc.TeraDriver',
  'url'
:'jdbc:teradata://192.168.1.134/CLIENT_CHARSET=cp936,TMODE=TERA,CHARSET=AS
CII,LOB_SUPPORT=ON,COLUMN_NAME = ON,MAYBENULL =
ON,database=testdblinkbase',
  'user':'testdblink',
  'password':'testdblink'
);