--    Description: 测试Distributed index on pallas
--    Date:         2020-07-02 
--    Author:       丁婷

set echo on

drop table T_PALLAS_ALTER_TYPE_BINARY_001 if exists cascade;

create table T_PALLAS_ALTER_TYPE_BINARY_001 (
c1 binary(100),
c2 binary(100),
c3 binary(100),
c4 binary(100),
c5 binary(100),
c6 binary(100),
c7 binary(100),
c8 binary(100),
c9 binary(100),
c10 binary(100),
c11 binary(100),
c12 binary(100),
c13 binary(100),
c14 binary(100),
c15 binary(100),
c16 binary(100),
c17 binary(100),
c18 binary(100),
c19 binary(100),
c20 binary(100),
c21 binary(100),
c22 binary(100)
)engine pallas;

insert into TEST_ALTERDATATYPE_T14 values ('0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890','0x1234567890');


--转为smallint
alter table T_PALLAS_ALTER_TYPE_BINARY_001 alter column c1 set data type smallint;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_BINARY_001' and column_name = 'C1';

select c1 from T_PALLAS_ALTER_TYPE_BINARY_001;


--转为double
alter table T_PALLAS_ALTER_TYPE_BINARY_001 alter column c5 set data type double;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_BINARY_001' and column_name = 'C5';

select c5 from T_PALLAS_ALTER_TYPE_BINARY_001;


--转为date

alter table T_PALLAS_ALTER_TYPE_BINARY_001 alter column c8 set data type date;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_BINARY_001' and column_name = 'C8';

select c8 from T_PALLAS_ALTER_TYPE_BINARY_001;


--转为varchar
alter table T_PALLAS_ALTER_TYPE_BINARY_001 alter column c11 set data type varchar(200);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_BINARY_001' and column_name = 'C11';

select c11 from T_PALLAS_ALTER_TYPE_BINARY_001;


--转为character large object
alter table T_PALLAS_ALTER_TYPE_BINARY_001 alter column c20 set data type character large object(100);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_BINARY_001' and column_name = 'C20';

select c20 from T_PALLAS_ALTER_TYPE_BINARY_001;