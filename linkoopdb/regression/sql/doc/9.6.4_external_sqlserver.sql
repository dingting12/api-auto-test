--Description: doc 9.6.4 external sqlserver
--Date：2020-07-14
--Author：丁婷

例:创建大写表名的外部表
CREATE EXTERNAL TABLE SQLSERVER_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'SQLSERVER_EXTERNAL_TABLE_TEST'
,'driver':'com.microsoft.sqlserver.jdbc.SQLServerDriver','url':'jdbc:sqlse
rver://localhost;Database=testdb','user':'linkoopdb','password':'123456');
例:创建小写表名的外部表
CREATE EXTERNAL TABLE SQLSERVER_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'"sqlserver_external_table_test"'
,'driver':'com.microsoft.sqlserver.jdbc.SQLServerDriver','url':'jdbc:sqlse
rver://localhost;Database=testdb','user':'linkoopdb','password':'123456','
caseSensitive':'true');
通过jdbc创建SQLSERVER外部表
247
例:创建大写表名的外部表
CREATE EXTERNAL TABLE SQLSERVER_2 BY
jdbc('table':'SQLSERVER_EXTERNAL_TABLE_TEST',
'driver':'com.microsoft.sqlserver.jdbc.SQLServerDriver',
'url':'jdbc:sqlserver://localhost;Database=testdb',
'user':'linkoopdb',
'password':'123456');
例:创建小写表名的外部表
CREATE EXTERNAL TABLE SQLSERVER_2 BY
jdbc('table':'"sqlserver_external_table_test"',
'driver':'com.microsoft.sqlserver.jdbc.SQLServerDriver',
'url':'jdbc:sqlserver://localhost;Database=testdb',
'user':'linkoopdb',
'password':'123456',
'caseSensitive':'true');