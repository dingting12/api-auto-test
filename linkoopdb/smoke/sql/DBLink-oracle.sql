--    Description: 测试DBlink中的oracle数据库
--    Date:         2020-06-11
--    Author:       丁婷

drop database link ORACLE_LINK_001 if exists cascade;

create database link ORACLE_LINK_001 connect to 'testlink1' 
identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

drop table ORACLE_LINK_001.T_DBLink_ORACLE_001 if exists cascade;

create table ORACLE_LINK_001.T_DBLink_ORACLE_001 (
tint INT,
tchar char(20),
tvarchar varchar(20),
tdecimal decimal(5,3),
tfloat float(2),
tdate date,
ttimestamp timestamp,
tclob Clob,
tBlob Blob
);

insert into ORACLE_LINK_001.T_DBLink_ORACLE_001 values 
(1,'tchar1','tvarchar',12.345,45.678,date '2018-03-09',timestamp '2018-03-29 20:21:22','44444','1001000110010111011001101100110111110000010101111101111111001011011001100100'),
(2,'tchar2','tvarchar',12.345,45.678,date '2018-03-09',timestamp '2018-03-29 20:21:22','44444','1001000110010111011001101100110111110000010101111101111111001011011001100100'),
(3,'tchar3','tvarchar',12.345,45.678,date '2018-03-09',timestamp '2018-03-29 20:21:22','44444','1001000110010111011001101100110111110000010101111101111111001011011001100100'),
(4,'tchar4','tvarchar',12.345,45.678,date '2018-03-09',timestamp '2018-03-29 20:21:22','44444','1001000110010111011001101100110111110000010101111101111111001011011001100100');

--测试增加字段
alter table ORACLE_LINK_001.T_DBLink_ORACLE_001 add column c4 int;

select data_type from information_schema.columns where table_schema = 'ORACLE_LINK_001' and table_name = 'T_DBLINK_ORACLE_001' and column_name = 'C4';

--测试删除字段
alter table ORACLE_LINK_001.T_DBLink_ORACLE_001 drop column c4;

select count(*) from information_schema.columns where table_schema = 'ORACLE_LINK_001' and table_name = 'T_DBLINK_ORACLE_001';

--测试更新某一字段
UPDATE ORACLE_LINK_001.T_DBLink_ORACLE_001 SET tfloat=123.111 where tint>1;

--删除某一行数据
delete from ORACLE_LINK_001.T_DBLink_ORACLE_001 where tint > 2;

--使用聚合函数查询数据行数
select count(*) from  ORACLE_LINK_001.T_DBLink_ORACLE_001;

--查询数据
select tchar,tdecimal,tdate from ORACLE_LINK_001.T_DBLink_ORACLE_001 order by tINT;



--加载其他用户的表
drop table ORACLE_LINK_001.T_DBLink_ORACLE_001 if exists cascade;

drop database link ORACLE_LINK_001 if exists cascade;

create database link ORACLE_LINK_001 connect to 'testlink1' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' properties('otherUsers':'testlink2');

SELECT * FROM ORACLE_LINK_001.TBLLINK3;

drop database link ORACLE_LINK_001 if exists cascade;