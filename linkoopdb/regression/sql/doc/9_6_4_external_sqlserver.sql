--Description: doc 9.6.4 external sqlserver
--Date：2020-07-14
--Author：丁婷

drop table SQLSERVER_1 if exists;

CREATE EXTERNAL TABLE SQLSERVER_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'SQLSERVER_TEST_001'
,'driver':'com.microsoft.sqlserver.jdbc.SQLServerDriver','url':'jdbc:sqlserver://192.168.1.72;Database=sen',
'user':'sa','password':'LinkoopDB123'
);

select * from SQLSERVER_1 order by COLUMN1;






drop table SQLSERVER_1 if exists;


CREATE EXTERNAL TABLE SQLSERVER_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'"sqlserver_test_002"'
,'driver':'com.microsoft.sqlserver.jdbc.SQLServerDriver',
'url':'jdbc:sqlserver://192.168.1.72;Database=sen',
'user':'sa','password':'LinkoopDB123','
caseSensitive':'true');

select * from SQLSERVER_1 order by COLUMN1;





drop table SQLSERVER_2 if exists;

CREATE EXTERNAL TABLE SQLSERVER_2 BY
jdbc('table':'SQLSERVER_TEST_001',
'driver':'com.microsoft.sqlserver.jdbc.SQLServerDriver',
'url':'jdbc:sqlserver://192.168.1.72;Database=sen',
'user':'sa',
'password':'LinkoopDB123');

select * from SQLSERVER_2 order by COLUMN1;

drop table SQLSERVER_2 if exists;
CREATE EXTERNAL TABLE SQLSERVER_2 BY
jdbc('table':'"sqlserver_test_002"',
'driver':'com.microsoft.sqlserver.jdbc.SQLServerDriver',
'url':'jdbc:sqlserver://192.168.1.72;Database=sen',
'user':'sa',
'password':'LinkoopDB123',
'caseSensitive':'true');

select * from SQLSERVER_2 order by COLUMN1;