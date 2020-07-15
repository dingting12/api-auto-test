--Description: doc 9.6.5 external mysql
--Date：2020-07-14
--Author：丁婷

CREATE EXTERNAL TABLE MYSQL_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'MYSQL_EXTERNAL_TABLE_TEST','driver'
:'com.mysql.jdbc.Driver','url':'jdbc:mysql://localhost:3306/test','user':'
linkoopdb','password':'123456');
例:创建小写表名的外部表
CREATE EXTERNAL TABLE MYSQL_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'mysql_external_table_test','driver'
:'com.mysql.jdbc.Driver','url':'jdbc:mysql://localhost:3306/test','user':'
linkoopdb','password':'123456','caseSensitive':'true');
通过jdbc创建MYSQL外部表。
248
例:创建大写表名的外部表
CREATE EXTERNAL TABLE MYSQL_2 BY
jdbc('table':'MYSQL_EXTERNAL_TABLE_TEST',
'driver':'com.mysql.jdbc.Driver',
'url':'jdbc:mysql://localhost:3306/test',
'user':'linkoopdb',
'password':'123456');
例:创建小写表名的外部表
CREATE EXTERNAL TABLE MYSQL_2 BY
jdbc('table':'mysql_external_table_test',
'driver':'com.mysql.jdbc.Driver',
'url':'jdbc:mysql://localhost:3306/test',
'user':'linkoopdb',
'password':'123456',
'caseSensitive':'true');