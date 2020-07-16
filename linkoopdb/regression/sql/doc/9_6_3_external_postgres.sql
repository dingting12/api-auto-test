--Description: doc 9.6.3 external postgres
--Date：2020-07-14
--Author：丁婷

drop table POSTGRES_1 if exists;
drop table POSTGRES_2 if exists;


CREATE EXTERNAL TABLE POSTGRES_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'POSTGRES_EXTERNAL_TABLE_TEST'
,'driver':'org.postgresql.Driver','url':'jdbc:postgresql://192.168.1.72:5432/postgres','user':'postgres','password':'123456');

select * from POSTGRES_1 order by COLUMN1;

drop table POSTGRES_1 if exists;

CREATE EXTERNAL TABLE POSTGRES_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'JDBC' PROPERTIES ('table':'postgres_external_table_test1'
,'driver':'org.postgresql.Driver','url':'jdbc:postgresql://192.168.1.72:5432/postgres','user':'postgres','password':'123456');

select * from POSTGRES_1 order by COLUMN1;

drop table POSTGRES_2 if exists;

CREATE EXTERNAL TABLE POSTGRES_2 BY
jdbc('table':'POSTGRES_EXTERNAL_TABLE_TEST',
'driver':'org.postgresql.Driver',
'url':'jdbc:postgresql://192.168.1.72:5432/postgres',
'user':'postgres',
'password':'123456',
'caseSensitive':'true');

select * from POSTGRES_2 ;

drop table POSTGRES_2 if exists;

CREATE EXTERNAL TABLE POSTGRES_2 BY
jdbc('table':'postgres_external_table_test1',
'driver':'org.postgresql.Driver',
'url':'jdbc:postgresql://192.168.1.72:5432/postgres',
'user':'postgres',
'password':'123456');

select * from POSTGRES_2 order by COLUMN1;