--    Description: 测试DBlink中的sqlserver数据库
--    Date:         2020-06-11
--    Author:       丁婷
set echo on

drop database link SQLSERVER_LINK_001 if exists cascade;

create database link SQLSERVER_LINK_001  connect to 'sa' identified by 'LinkoopDB123' using 'jdbc:sqlserver://192.168.1.72;Database=insen' properties ('schema':'dbo','caseSensitive':'true');

drop table SQLSERVER_LINK_001.T_DBLink_SQLSERVER_001 if exists cascade;

create table SQLSERVER_LINK_001.T_DBLink_SQLSERVER_001 (
c1 int, 
c2 int,
c3 int
);

--测试插入数据
insert into SQLSERVER_LINK_001.T_DBLink_SQLSERVER_001 values 
(45123,31241,90239),
(45124,31241,90239),
(45125,31241,90239);

--测试增加字段
alter table SQLSERVER_LINK_001.T_DBLink_SQLSERVER_001 add column c4 int;

select data_type from information_schema.columns where table_schema = 'SQLSERVER_LINK_001' and table_name = 'T_DBLINK_SQLSERVER_001' and column_name = 'C4';

--测试删除字段
alter table SQLSERVER_LINK_001.T_DBLink_SQLSERVER_001 drop column c4;

select count(*) from information_schema.columns where table_schema = 'SQLSERVER_LINK_001' and table_name = 'T_DBLINK_SQLSERVER_001';

--测试更新某一字段
UPDATE SQLSERVER_LINK_001.T_DBLink_SQLSERVER_001 SET c2=123 where c1=45124;

--删除某一行数据
delete from SQLSERVER_LINK_001.T_DBLink_SQLSERVER_001 where c1 > 45124;

--使用聚合函数查询数据行数
select count(*) from SQLSERVER_LINK_001.T_DBLink_SQLSERVER_001;

drop table SQLSERVER_LINK_001.T_DBLink_SQLSERVER_001 if exists cascade;

drop database link SQLSERVER_LINK_001 if exists cascade;