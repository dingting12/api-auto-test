--    Description: 测试DBlink中的mysql数据库
--    Date:         2020-06-11
--    Author:       丁婷
drop database link MYSQL_LINK_001 if exists cascade;

create database link MYSQL_LINK_001 connect to 'test' identified by '123456' using 'jdbc:mysql://192.168.1.72:3307/ldb_test';

drop table MYSQL_LINK_001.T_DBLink_MYSQL_001 if exists cascade;

create table MYSQL_LINK_001.T_DBLink_MYSQL_001 (
tsmallint smallint,
tint int,
tbigint bigint,
treal real,
tfloat float,
tdecimal decimal(4,2),
tnumeric numeric(4,2),
tdate date,
tdatetime timestamp,
tchar char(200),
tvarchar varchar(200),
tbinary binary(100),
tvarbinary varbinary(100)
);

--测试插入数据
insert into MYSQL_LINK_001.T_DBLink_MYSQL_001 values 
(1,1,98642456,1,1,1,1,'2018-01-01','2018-02-02 10:11:12','qq','ss','0x1234567890','0x3654879871'),
(2,56789,98642256,1,1,1,1,'2018-01-01','2018-02-02 10:11:12','qq','ss','0x1234567890','0x3654879871'),
(3,34689,98642356,1,1,1,1,'2018-01-01','2018-02-02 10:11:12','qq','ss','0x1234567890','0x3654879871');

--测试增加字段
alter table MYSQL_LINK_001.T_DBLink_MYSQL_001 add column c4 int;

select data_type from information_schema.columns where table_schema = 'MYSQL_LINK_001' and table_name = 'T_DBLINK_MYSQL_001' and column_name = 'C4';

--测试删除字段
alter table MYSQL_LINK_001.T_DBLink_MYSQL_001 drop column c4;

select count(*) from information_schema.columns where table_schema = 'MYSQL_LINK_001' and table_name = 'T_DBLINK_MYSQL_001';

--测试更新某一字段
UPDATE MYSQL_LINK_001.T_DBLink_MYSQL_001 SET tfloat=123.111 where tint>1;

--删除某一行数据
delete from MYSQL_LINK_001.T_DBLink_MYSQL_001 where tsmallint > 2;

--使用聚合函数查询数据行数
select count(*) from MYSQL_LINK_001.T_DBLink_MYSQL_001;

drop table MYSQL_LINK_001.T_DBLink_MYSQL_001 if exists cascade;

drop database link MYSQL_LINK_001 if exists cascade;