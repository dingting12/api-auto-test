--Description: doc 9.6.2 external oracle
--Date：2020-07-14
--Author：丁婷

例:创建大写表名的外部表
CREATE EXTERNAL TABLE ORACLE_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'ORACLE_EXTERNAL_TABLE_TEST','driver'
:'oracle.jdbc.driver.OracleDriver','url':'jdbc:oracle:thin:@localhost:1521
:orcl','user':'linkoopdb','password':'123456');
例:创建小写表名的外部表
CREATE EXTERNAL TABLE ORACLE_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'"oracle_external_table_test"'
,'driver':'oracle.jdbc.driver.OracleDriver','url':'jdbc:oracle:thin:@local
host:1521:orcl','user':'linkoopdb','password':'123456');
通过jdbc创建ORACLE外部表
245
例:创建大写表名的外部表
CREATE EXTERNAL TABLE ORACLE_2 BY
jdbc('table':'ORACLE_EXTERNAL_TABLE_TEST',
'driver':'oracle.jdbc.driver.OracleDriver',
'url':'jdbc:oracle:thin:@localhost:1521:orcl',
'user':'linkoopdb',
'password':'123456');
例:创建小写表名的外部表
CREATE EXTERNAL TABLE ORACLE_2 BY
jdbc('table':'"oracle_external_table_test"',
'driver':'oracle.jdbc.driver.OracleDriver',
'url':'jdbc:oracle:thin:@localhost:1521:orcl',
'user':'linkoopdb',
'password':'123456');