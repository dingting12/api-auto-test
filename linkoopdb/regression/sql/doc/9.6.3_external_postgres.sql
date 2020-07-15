--Description: doc 9.6.3 external postgres
--Date：2020-07-14
--Author：丁婷

例:创建大写表名的外部表
CREATE EXTERNAL TABLE POSTGRES_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'"POSTGRES_EXTERNAL_TABLE_TEST"'
,'driver':'org.postgresql.Driver','url':'jdbc:postgresql://localhost:5432/
postgres','user':'postgres','password':'linkoopdb');
例:创建小写表名的外部表
CREATE EXTERNAL TABLE POSTGRES_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'postgres_external_table_test'
,'driver':'org.postgresql.Driver','url':'jdbc:postgresql://localhost:5432/
postgres','user':'postgres','password':'linkoopdb');
通过jdbc创建POSTGRES外部表
246
例:创建大写表名的外部表
CREATE EXTERNAL TABLE POSTGRES_2 BY
jdbc('table':'"POSTGRES_EXTERNAL_TABLE_TEST"',
'driver':'org.postgresql.Driver',
'url':'jdbc:postgresql://localhost:5432/postgres',
'user':'postgres',
'password':'linkoopdb'),
('caseSensitive:'true');
例:创建小写表名的外部表
CREATE EXTERNAL TABLE POSTGRES_2 BY
jdbc('table':'postgres_external_table_test',
'driver':'org.postgresql.Driver',
'url':'jdbc:postgresql://localhost:5432/postgres',
'user':'postgres',
'password':'linkoopdb');