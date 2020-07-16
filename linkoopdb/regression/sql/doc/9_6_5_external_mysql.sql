--Description: doc 9.6.5 external mysql
--Date：2020-07-14
--Author：丁婷

drop table MYSQL_1 if exists;
CREATE EXTERNAL TABLE MYSQL_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'MYSQL_TEST_001','driver':'com.mysql.jdbc.Driver',
'url':'jdbc:mysql://192.168.1.72:3306/test','user':'test','password':'123456');

select * from MYSQL_1 order by COLUMN1;

drop table MYSQL_1 if exists;

CREATE EXTERNAL TABLE MYSQL_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'mysql_test_002','driver':'com.mysql.jdbc.Driver',
'url':'jdbc:mysql://192.168.1.72:3306/test','user':'test','password':'123456','caseSensitive':'true');

select * from MYSQL_1 order by COLUMN1;



drop table MYSQL_2 if exists;
CREATE EXTERNAL TABLE MYSQL_2 BY
jdbc('table':'MYSQL_TEST_001',
'driver':'com.mysql.jdbc.Driver',
'url':'jdbc:mysql://192.168.1.72:3306/test',
'user':'test',
'password':'123456');

select * from MYSQL_2 order by COLUMN1;


drop table MYSQL_2 if exists;
CREATE EXTERNAL TABLE MYSQL_2 BY
jdbc('table':'mysql_test_002',
'driver':'com.mysql.jdbc.Driver',
'url':'jdbc:mysql://192.168.1.72:3306/test',
'user':'test',
'password':'123456',
'caseSensitive':'true');

select * from MYSQL_2 order by COLUMN1;