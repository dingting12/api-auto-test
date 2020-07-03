--Description: 测试Secondary index
--Date:         2020-07-03
--Author:       丁婷

set echo on

--pallas表无主键
drop table T_SECONDARY_INDEX_PALLAS_001 if exists CASCADE;

create table T_SECONDARY_INDEX_PALLAS_001(a int, b varchar(100)) engine pallas;

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_SECONDARY_INDEX_PALLAS_001'
group by index_name order by index_name ASC;

alter table T_SECONDARY_INDEX_PALLAS_001 add constraint c1 unique(a, b);

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_SECONDARY_INDEX_PALLAS_001'
group by index_name order by index_name ASC;

alter table T_SECONDARY_INDEX_PALLAS_001 add column c double;

create index idx001 on T_SECONDARY_INDEX_PALLAS_001(b, c);

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_SECONDARY_INDEX_PALLAS_001' 
group by index_name order by index_name ASC;

alter index idx001 rename to idx0001;

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_SECONDARY_INDEX_PALLAS_001' 
group by index_name order by index_name ASC;

select table_name, index_name, column_name, ordinal_position
from  INFORMATION_SCHEMA.SYSTEM_INDEXINFO where index_name = 'IDX0001' 
order by ordinal_position ASC;

drop index idx0001;

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_SECONDARY_INDEX_PALLAS_001'  
group by index_name order by index_name ASC;


--pallas表有主键
drop table T_SECONDARY_INDEX_PALLAS_002 if exists CASCADE;

create table T_SECONDARY_INDEX_PALLAS_002(
a int, 
b varchar(100), 
c double unique, 
d varchar(100),
primary key(d), 
constraint c1 unique(a, b)
) engine pallas;

select * from (select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_SECONDARY_INDEX_PALLAS_002' 
group by index_name order by index_name asc) order by c2;

create index idx002 on T_SECONDARY_INDEX_PALLAS_002(a, d);

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_SECONDARY_INDEX_PALLAS_002' 
group by index_name order by index_name asc;



--给pallas加主键
drop table T_SECONDARY_INDEX_PALLAS_003 if exists CASCADE;

create table T_SECONDARY_INDEX_PALLAS_003(a int, b varchar(100)) engine pallas;

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_SECONDARY_INDEX_PALLAS_003' 
group by index_name order by index_name asc;

alter table T_SECONDARY_INDEX_PALLAS_003 add column c varchar(100) primary KEY;

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_SECONDARY_INDEX_PALLAS_003' 
group by index_name order by index_name asc;