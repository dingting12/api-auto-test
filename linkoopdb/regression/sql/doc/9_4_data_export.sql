--Description: doc 9.4 data export
--Date：2020-07-14
--Author：丁婷

--9.4.2. 导出到HDFS
drop table T_data_export_001 if exists;
drop table T_data_export_002 if exists;

CREATE TABLE T_data_export_001 (
ID INT, 
NAME VARCHAR(10)
) ;

insert into T_data_export_001 values 
(1,'zhangsan'),
(2,'lisi');

select * from T_data_export_001 order by id;

CREATE EXTERNAL TABLE T_data_export_002 (
ID INT, 
NAME VARCHAR(10)
) 
LOCATION('hdfs:///user/testdb73/external_file/doc/csv_test') FORMAT 'csv' (DELIMITER ',');

delete from T_data_export_002;


INSERT INTO T_data_export_002 SELECT * FROM T_data_export_001;

select * from T_data_export_002 order by id;



--9.4.3. 导出到其他数据库

DROP DATABASE LINK ORACLE_LINK_EXPORT_001 if exists cascade;



CREATE DATABASE LINK ORACLE_LINK_EXPORT_001 CONNECT TO 'testlink1' IDENTIFIED BY
'123456' USING 'jdbc:oracle:thin:@192.168.1.72:1521:xe' properties
('maxActive':'5');

DROP table ORACLE_LINK_EXPORT_001.T_DATA_EXPORT_001 if exists;

CREATE TABLE ORACLE_LINK_EXPORT_001.T_DATA_EXPORT_001(ID INT,NAME VARCHAR(20));

INSERT INTO ORACLE_LINK_EXPORT_001.T_DATA_EXPORT_001 SELECT * FROM T_data_export_001;

select * from ORACLE_LINK_EXPORT_001.T_DATA_EXPORT_001 order by id;