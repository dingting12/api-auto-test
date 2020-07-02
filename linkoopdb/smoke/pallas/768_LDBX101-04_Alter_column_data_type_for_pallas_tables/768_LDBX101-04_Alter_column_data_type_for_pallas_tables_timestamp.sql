--    Description: 测试Distributed index on pallas
--    Date:         2020-07-02 
--    Author:       丁婷

set echo on

drop table T_PALLAS_ALTER_TYPE_TIMESTAMP_001 if exists cascade;

create table T_PALLAS_ALTER_TYPE_TIMESTAMP_001 (
c1 timestamp,
c2 timestamp,
c3 timestamp,
c4 timestamp,
c5 timestamp,
c6 timestamp,
c7 timestamp,
c8 timestamp,
c9 timestamp,
c10 timestamp,
c11 timestamp,
c12 timestamp,
c13 timestamp,
c14 timestamp,
c15 timestamp,
c16 timestamp,
c17 timestamp,
c18 timestamp,
c19 timestamp,
c20 timestamp,
c21 timestamp,
c22 timestamp
)engine pallas;

insert into T_PALLAS_ALTER_TYPE_TIMESTAMP_001 values ('2018-08-01 10:11:01','2018-08-02 10:11:02','2018-08-03 10:11:03','2018-08-04 10:11:04','2018-08-05 10:11:05','2018-08-06 10:11:06','2018-08-07 10:11:07','2018-08-08 10:11:08','2018-08-09 10:11:09',timestamp '2018-08-10 10:11:10',timestamp '2018-08-11 10:11:11','2018-08-12 10:11:12','2018-08-13 10:11:13','2018-08-14 10:11:14','2018-08-15 10:11:15','2018-08-16 10:11:16',timestamp '2018-08-17 10:11:17',timestamp '2018-08-18 10:11:18',timestamp '2018-08-19 10:11:19','2018-08-20 10:11:20','2018-08-21 10:11:21','2018-08-22 10:11:22');


--转为smallint
alter table T_PALLAS_ALTER_TYPE_TIMESTAMP_001 alter column c1 set data type smallint;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_TIMESTAMP_001' and column_name = 'C1';

select c1 from T_PALLAS_ALTER_TYPE_TIMESTAMP_001;


--转为double
alter table T_PALLAS_ALTER_TYPE_TIMESTAMP_001 alter column c5 set data type double;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_TIMESTAMP_001' and column_name = 'C5';

select c5 from T_PALLAS_ALTER_TYPE_TIMESTAMP_001;


--转为date

alter table T_PALLAS_ALTER_TYPE_TIMESTAMP_001 alter column c8 set data type date;

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_TIMESTAMP_001' and column_name = 'C8';

select c8 from T_PALLAS_ALTER_TYPE_TIMESTAMP_001;


--转为varchar
alter table T_PALLAS_ALTER_TYPE_TIMESTAMP_001 alter column c11 set data type varchar(200);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_TIMESTAMP_001' and column_name = 'C11';

select c11 from T_PALLAS_ALTER_TYPE_TIMESTAMP_001;


--转为character large object
alter table T_PALLAS_ALTER_TYPE_TIMESTAMP_001 alter column c20 set data type character large object(100);

select data_type from information_schema.columns where table_name = 'T_PALLAS_ALTER_TYPE_TIMESTAMP_001' and column_name = 'C20';

select c20 from T_PALLAS_ALTER_TYPE_TIMESTAMP_001;