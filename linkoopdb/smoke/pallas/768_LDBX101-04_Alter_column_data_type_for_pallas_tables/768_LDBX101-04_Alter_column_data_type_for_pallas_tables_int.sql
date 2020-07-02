--    Description: 测试Distributed index on pallas
--    Date:         2020-07-02 
--    Author:       丁婷

set echo on

drop table T_PALLAS_ALTER_TYPE_INT_001 if exists cascade;

create table T_PALLAS_ALTER_TYPE_INT_001 (
c1 int,
c2 int,
c3 int,
c4 int,
c5 int,
c6 int,
c7 int,
c8 int,
c9 int,
c10 int,
c11 int,
c12 int,
c13 int,
c14 int,
c15 int,
c16 int,
c17 int,
c18 int,
c19 int,
c20 int,
c21 int,
c22 int
) engine pallas;

insert into T_PALLAS_ALTER_TYPE_INT_001 values (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22);


--转为smallint
alter table T_PALLAS_ALTER_TYPE_INT_001 alter column c1 set data type smallint;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_INT_001' and column_name = 'C1';

select c1 from T_PALLAS_ALTER_TYPE_INT_001;


--转为double
alter table T_PALLAS_ALTER_TYPE_INT_001 alter column c5 set data type double;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_INT_001' and column_name = 'C5';

select c5 from T_PALLAS_ALTER_TYPE_INT_001;


--转为date

alter table T_PALLAS_ALTER_TYPE_INT_001 alter column c8 set data type date;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_INT_001' and column_name = 'C8';

select c8 from T_PALLAS_ALTER_TYPE_INT_001;


--转为varchar
alter table T_PALLAS_ALTER_TYPE_INT_001 alter column c11 set data type varchar(200);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_INT_001' and column_name = 'C11';

select c11 from T_PALLAS_ALTER_TYPE_INT_001;


--转为character large object
alter table T_PALLAS_ALTER_TYPE_INT_001 alter column c20 set data type character large object(100);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_INT_001' and column_name = 'C20';

select c20 from T_PALLAS_ALTER_TYPE_INT_001;