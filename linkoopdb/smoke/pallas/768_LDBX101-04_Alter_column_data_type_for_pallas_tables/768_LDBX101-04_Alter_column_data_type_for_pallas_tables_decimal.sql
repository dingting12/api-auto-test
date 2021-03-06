--    Description: 测试Distributed index on pallas
--    Date:         2020-07-02 
--    Author:       丁婷

set echo on

drop table T_PALLAS_ALTER_TYPE_DECIMAL_001 if exists cascade;

create table T_PALLAS_ALTER_TYPE_DECIMAL_001 (
c1 decimal(10,2),
c2 decimal(10,2),
c3 decimal(10,2),
c4 decimal(10,2),
c5 decimal(10,2),
c6 decimal(10,2),
c7 decimal(10,2),
c8 decimal(10,2),
c9 decimal(10,2),
c10 decimal(10,2),
c11 decimal(10,2),
c12 decimal(10,2),
c13 decimal(10,2),
c14 decimal(10,2),
c15 decimal(10,2),
c16 decimal(10,2),
c17 decimal(10,2),
c18 decimal(10,2),
c19 decimal(10,2),
c20 decimal(10,2),
c21 decimal(10,2),
c22 decimal(10,2)
)engine pallas;

insert into T_PALLAS_ALTER_TYPE_DECIMAL_001 values (1.1,2.2,3.3,4.4,5.5,6.6,7.7,8.8,9.9,10.10,11.11,12.12,13.13,14.14,15.15,16.16,17.17,18.18,19.19,20.20,21.21,22.22);


--转为smallint
alter table T_PALLAS_ALTER_TYPE_DECIMAL_001 alter column c1 set data type smallint;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_DECIMAL_001' and column_name = 'C1';

select c1 from T_PALLAS_ALTER_TYPE_DECIMAL_001;


--转为double
alter table T_PALLAS_ALTER_TYPE_DECIMAL_001 alter column c5 set data type double;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_DECIMAL_001' and column_name = 'C5';

select c5 from T_PALLAS_ALTER_TYPE_DECIMAL_001;


--转为date

alter table T_PALLAS_ALTER_TYPE_DECIMAL_001 alter column c8 set data type date;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_DECIMAL_001' and column_name = 'C8';

select c8 from T_PALLAS_ALTER_TYPE_DECIMAL_001;


--转为varchar
alter table T_PALLAS_ALTER_TYPE_DECIMAL_001 alter column c11 set data type varchar(200);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_DECIMAL_001' and column_name = 'C11';

select c11 from T_PALLAS_ALTER_TYPE_DECIMAL_001;


--转为character large object
alter table T_PALLAS_ALTER_TYPE_DECIMAL_001 alter column c20 set data type character large object(100);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_DECIMAL_001' and column_name = 'C20';

select c20 from T_PALLAS_ALTER_TYPE_DECIMAL_001;