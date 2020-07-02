--    Description: 测试Distributed index on pallas
--    Date:         2020-07-02 
--    Author:       丁婷

set echo on

drop table T_PALLAS_ALTER_TYPE_VARCHAR_001 if exists cascade;

create table T_PALLAS_ALTER_TYPE_VARCHAR_001 (
c1 varchar(20),
c2 varchar(20),
c3 varchar(20),
c4 varchar(20),
c5 varchar(20),
c6 varchar(20),
c7 varchar(20),
c8 varchar(20),
c9 varchar(20),
c10 varchar(20),
c11 varchar(20),
c12 varchar(20),
c13 varchar(20),
c14 varchar(20),
c15 varchar(20),
c16 varchar(20),
c17 varchar(20),
c18 varchar(20),
c19 varchar(20),
c20 varchar(20),
c21 varchar(20),
c22 varchar(20)
)engine pallas;

insert into T_PALLAS_ALTER_TYPE_VARCHAR_001 values ('q1','q2','q3','q4','q5','q6','q7','q8','q9','q10','q11','q12','q13','q14','q15','q16','q17','q18','q19','q20','q21','q22');


--转为smallint
alter table T_PALLAS_ALTER_TYPE_VARCHAR_001 alter column c1 set data type smallint;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_VARCHAR_001' and column_name = 'C1';

select c1 from T_PALLAS_ALTER_TYPE_VARCHAR_001;


--转为double
alter table T_PALLAS_ALTER_TYPE_VARCHAR_001 alter column c5 set data type double;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_VARCHAR_001' and column_name = 'C5';

select c5 from T_PALLAS_ALTER_TYPE_VARCHAR_001;


--转为date

alter table T_PALLAS_ALTER_TYPE_VARCHAR_001 alter column c8 set data type date;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_VARCHAR_001' and column_name = 'C8';

select c8 from T_PALLAS_ALTER_TYPE_VARCHAR_001;


--转为char
alter table T_PALLAS_ALTER_TYPE_VARCHAR_001 alter column c11 set data type char(200);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_VARCHAR_001' and column_name = 'C11';

select c11 from T_PALLAS_ALTER_TYPE_VARCHAR_001;


--转为character large object
alter table T_PALLAS_ALTER_TYPE_VARCHAR_001 alter column c20 set data type character large object(100);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_VARCHAR_001' and column_name = 'C20';

select c20 from T_PALLAS_ALTER_TYPE_VARCHAR_001;