--Description: doc 9.6.2 external oracle
--Date：2020-07-14
--Author：丁婷

drop table ORACLE_1 if exists;

CREATE EXTERNAL TABLE ORACLE_1 (
ID INT,
NAME VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'T_DATA_EXPORT_002',
'driver':'oracle.jdbc.driver.OracleDriver','url':'jdbc:oracle:thin:@192.168.1.72:1521:xe','user':'testlink1','password':'123456');

select * from ORACLE_1 order by ID;

drop table ORACLE_1 if exists;

CREATE EXTERNAL TABLE ORACLE_1 (
ID INT,
NAME VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'"t_data_oracle_001"'
,'driver':'oracle.jdbc.driver.OracleDriver','url':'jdbc:oracle:thin:@192.168.1.72:1521:xe','user':'testlink1','password':'123456');

select * from ORACLE_1 order by ID;

drop table ORACLE_2 if exists;

CREATE EXTERNAL TABLE ORACLE_2 BY
jdbc('table':'T_DATA_EXPORT_002',
'driver':'oracle.jdbc.driver.OracleDriver',
'url':'jdbc:oracle:thin:@192.168.1.72:1521:xe',
'user':'testlink1',
'password':'123456');

select * from ORACLE_2 order by ID;

drop table ORACLE_2 if exists;

CREATE EXTERNAL TABLE ORACLE_2 BY
jdbc('table':'"t_data_oracle_001"',
'driver':'oracle.jdbc.driver.OracleDriver',
'url':'jdbc:oracle:thin:@192.168.1.72:1521:xe',
'user':'testlink1',
'password':'123456');

select * from ORACLE_2 order by ID;