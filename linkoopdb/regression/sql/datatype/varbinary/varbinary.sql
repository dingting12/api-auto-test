-- Description：varbinary data type
-- Date：2020-06-12
-- Author：李爱敏

set echo on
set timing on

--验证VARBINARY(n)数据类型，字节长度为n+1，n的最大值为64000
--如果表已存在，则先删除
drop table T_TYPE_VARBINARY1 if exists;
drop table T_TYPE_VARBINARY2 if exists;
drop table T_TYPE_VARBINARY3 if exists;

--创建表T_TYPE_VARBINARY1，设置长度大于64000，是否报错
create table T_TYPE_VARBINARY1 (a1 varbinary(64001));
insert into T_TYPE_VARBINARY1 values('AaFf0099bb');
select * from T_TYPE_VARBINARY1;

--创建表T_TYPE_VARBINARY1，设置长度为64000
create table T_TYPE_VARBINARY2 (a1 varbinary(64000));
insert into T_TYPE_VARBINARY2 values('AaFf0099bb');
select * from T_TYPE_VARBINARY2;

--创建表T_TYPE_VARBINARY3，设置长度为10
create table T_TYPE_VARBINARY3 (a1 varbinary(10));

--验证插入数据的字节数大于10，是否报错
insert into T_TYPE_VARBINARY3 values('AaFf0099bbC');
select * from T_TYPE_VARBINARY3;

--验证插入数据的字节数等于10
insert into T_TYPE_VARBINARY3 values('AaFf0099bb');
select * from T_TYPE_VARBINARY3;
select bit_length(a1)  from T_TYPE_VARBINARY3;

--验证插入数据的字节数小于10
insert into T_TYPE_VARBINARY3 values('AaFf0099b');
select * from T_TYPE_VARBINARY3;

--验证插入的字符不在a-f，A-F之间，是否报错
insert into T_TYPE_VARBINARY3 values('GgHhZzQQ');
select * from T_TYPE_VARBINARY3;

--验证插入数据的字节数为0
insert into T_TYPE_VARBINARY3 values('');
select * from T_TYPE_VARBINARY3;

--验证插入BIT类型
insert into T_TYPE_VARBINARY3 values(b'1010101110');
select * from T_TYPE_VARBINARY3;

-- 验证插入其他数据类型
--验证插入int类型，是否报错
insert into T_TYPE_VARBINARY3 values(12345);
select * from T_TYPE_VARBINARY3;

--验证插入decimal类型，是否报错
insert into T_TYPE_VARBINARY3 values(1234.56);
select * from T_TYPE_VARBINARY3;

--验证插入varchar类型，插入英文字母'xxxyyyZZZww'，是否报错
insert into T_TYPE_VARBINARY3 values('xxxyyyZZww');
select * from T_TYPE_VARBINARY3;

--验证插入date类型，格式yyyy-mm-dd，是否报错
insert into T_TYPE_VARBINARY3 values(to_date('2020-05-08','yyyy-mm-dd'));
select * from T_TYPE_VARBINARY3;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss，是否报错
insert into T_TYPE_VARBINARY3 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
select * from T_TYPE_VARBINARY3;

--验证插入boolean类型，插入true，是否报错
insert into T_TYPE_VARBINARY3 values(true);
select * from T_TYPE_VARBINARY3;

--验证插入空值''
insert into T_TYPE_VARBINARY3 values('');
select * from T_TYPE_VARBINARY3;

--验证插入空格' '
insert into T_TYPE_VARBINARY3 values(' ');
select * from T_TYPE_VARBINARY3;

--验证插入null
insert into T_TYPE_VARBINARY3 values(null);
select * from T_TYPE_VARBINARY3;

--验证插入NULL
insert into T_TYPE_VARBINARY3 values(NULL);
select * from T_TYPE_VARBINARY3;


--最后删除创建的表
drop table T_TYPE_VARBINARY1 if exists;
drop table T_TYPE_VARBINARY2 if exists;
drop table T_TYPE_VARBINARY3 if exists;