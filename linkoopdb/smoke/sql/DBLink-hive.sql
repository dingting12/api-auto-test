--    Description: 测试DBlink中的hive
--    Date:         2020-06-11
--    Author:       丁婷
set echo on

drop database link HIVE_LINK_001 if exists cascade;

create database link HIVE_LINK_001  connect to 'hive' identified by 'hive' using 'hive' PROPERTIES ('database':'default');

drop table HIVE_LINK_001.T_DBLink_HIVE_001 if exists cascade;

create table HIVE_LINK_001.T_DBLink_HIVE_001 (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

--测试插入数据
insert into HIVE_LINK_001.T_DBLink_HIVE_001 values 
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10),
(7566,'JONES','MANAGER',7839,'1981-4-2',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-9-28',1150,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-5-1',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-6-9',2450,NULL,10),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,0,30);

--测试增加字段
alter table HIVE_LINK_001.T_DBLink_HIVE_001 add column c4 int;

select data_type from information_schema.columns where table_schema = 'HIVE_LINK_001' and table_name = 'T_DBLINK_HIVE_001' and column_name = 'C4';

--测试删除字段
alter table HIVE_LINK_001.T_DBLink_HIVE_001 drop column c4;

select count(*) from information_schema.columns where table_schema = 'HIVE_LINK_001' and table_name = 'T_DBLINK_HIVE_001';

--测试更新某一字段
UPDATE HIVE_LINK_001.T_DBLink_HIVE_001 SET SAL=9010 where EMPNO=7782;

--删除某一行数据
delete from HIVE_LINK_001.T_DBLink_HIVE_001 where EMPNO > 7782;

--使用聚合函数查询数据行数
select count(*) from HIVE_LINK_001.T_DBLink_HIVE_001;

drop table HIVE_LINK_001.T_DBLink_HIVE_001 if exists cascade;

drop database link HIVE_LINK_001 if exists cascade;