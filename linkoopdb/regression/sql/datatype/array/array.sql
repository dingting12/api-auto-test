-- Description：array data type
-- Date：2020-06-16
-- Author：李爱敏

set echo on
set timing on

--如果表已存在，则先删除
drop table T_TYPE_ARRAY1 if exists;
drop table T_TYPE_ARRAY2 if exists;
drop table T_TYPE_ARRAY3 if exists;
drop table T_TYPE_ARRAY4 if exists;
drop table T_TYPE_ARRAY5 if exists;
drop table T_TYPE_ARRAY6 if exists;
drop table T_TYPE_ARRAY7 if exists;
drop table T_TYPE_ARRAY8 if exists;
drop table T_TYPE_ARRAY9 if exists;

--创建表T_TYPE_ARRAY1，验证整型数组
create table T_TYPE_ARRAY1 (a1 int array,a2 smallint array,a3 bigint array);
insert into T_TYPE_ARRAY1 values (array[111,2222,3333,4444],array[1,2,3],array[123456,789012,1234567890]);
select * from T_TYPE_ARRAY1;

--创建表T_TYPE_ARRAY2，验证浮点型数组
create table T_TYPE_ARRAY2 (a1 real array,a2 double array,a3 float array,a4 decimal(4,1) array,a5 numeric(5,2) array);
insert into T_TYPE_ARRAY2 values (array[111.1,2222.2,3333.3,4444.4],array[11.11,22.22,33.33],array[111.111,222.222,333.333],array[111.1,222.2,333.3],array[111.11,222.22,333.33]);
select * from T_TYPE_ARRAY2;

--创建表T_TYPE_ARRAY3，验证字符型数组
create table T_TYPE_ARRAY3 (a1 char(10) array,a2 varchar(20) array);
insert into T_TYPE_ARRAY3 values (array['111.11','abc','中国'],array['222.11','abcdef','我爱中国']);
select * from T_TYPE_ARRAY3;

--创建表T_TYPE_ARRAY4，验证日期型数组
create table T_TYPE_ARRAY4 (a1 date array,a2 timestamp array);
insert into T_TYPE_ARRAY4 values (array['2020-06-11','2020-06-12','2020-06-13'],array['2020-06-11 11:20:30','2020-06-12 11:20:31']);
select * from T_TYPE_ARRAY4;

--创建表T_TYPE_ARRAY5，验证二进制型数组
create table T_TYPE_ARRAY5 (a1 bit(5) array,a2 binary(5) array,a3 varbinary(5) array);
insert into T_TYPE_ARRAY5 values (array[b'10101',b'11111',b'10111'],array['aaaaa','bbbbb'],array['ccccc','ddddd']);
select * from T_TYPE_ARRAY5;

--创建表T_TYPE_ARRAY6，验证布尔型数组
create table T_TYPE_ARRAY6 (a1 boolean array);
insert into T_TYPE_ARRAY6 values (array[True,False,True]);
select * from T_TYPE_ARRAY6;

--创建表T_TYPE_ARRAY7，验证不同数据类型组合数组
create table T_TYPE_ARRAY7 (a1 int array,a2 decimal(5,2) array,a3 varchar(20) array,a4 date array,a5 timestamp array,a6 bit(5) array,a7 varbinary(5) array, a8 boolean array);
insert into T_TYPE_ARRAY7 values (array[1,2,3],array[11.11,22.22],array['123','abc','我爱中国'],array['2010-04-10','2010-11-12'],array['2010-09-11 09:10:12','2020-03-21 18:21:33'],array[b'11111',b'10101'],array['aaaaa','bbbbb'],array[True,False]);
select * from T_TYPE_ARRAY7;

--验证查询数组中的某个元素及下标越界是否报错
--查询数组长度
select size(a1) from T_TYPE_ARRAY7;

--查询数组第一个元素
select a1[0] from T_TYPE_ARRAY7;

--查询数组最后一个元素
select a1[2] from T_TYPE_ARRAY7;

--查询数组长度+1个元素，是否报错
select a1[3] from T_TYPE_ARRAY7;

--验证不支持的数据类型，是否报错
create table T_TYPE_ARRAY8 (a1 blob(100) array);
create table T_TYPE_ARRAY9 (a1 clob(100) array);

--验证多维嵌套数组，是否报错
create table T_TYPE_ARRAY8 (a1 smallint[3][3] array);

--最后删除创建的表
drop table T_TYPE_ARRAY1 if exists;
drop table T_TYPE_ARRAY2 if exists;
drop table T_TYPE_ARRAY3 if exists;
drop table T_TYPE_ARRAY4 if exists;
drop table T_TYPE_ARRAY5 if exists;
drop table T_TYPE_ARRAY6 if exists;
drop table T_TYPE_ARRAY7 if exists;
drop table T_TYPE_ARRAY8 if exists;
drop table T_TYPE_ARRAY9 if exists;