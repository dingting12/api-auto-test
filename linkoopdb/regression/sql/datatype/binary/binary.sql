-- Description：binary data type
-- Date：2020-06-12
-- Author：李爱敏

set echo on
set timing on

--BINARY(n)数据类型，字节长度为n，n的最大值为64000
--如果表已存在，则先删除
drop table T_TYPE_BINARY1 if exists;
drop table T_TYPE_BINARY2 if exists;
drop table T_TYPE_BINARY3 if exists;

--创建表T_TYPE_BINARY1，设置长度大于64000，是否报错
create table T_TYPE_BINARY1 (a1 binary(64001));
insert into T_TYPE_BINARY1 values('AaBbFfEeDd0099');
select * from T_TYPE_BINARY1;

--创建表T_TYPE_BINARY2，设置长度为64000
create table T_TYPE_BINARY2 (a1 binary(64000));
insert into T_TYPE_BINARY2 values('AaBbFfEeDd0099');
select * from T_TYPE_BINARY2;

--创建表T_TYPE_BINARY3，设置长度为10
create table T_TYPE_BINARY3 (a1 binary(10));

--验证插入数据的字节数大于10，是否报错
insert into T_TYPE_BINARY3 values('AaFfEe00991');
select * from T_TYPE_BINARY3;

--验证插入数据的字节数等于10
insert into T_TYPE_BINARY3 values('AaFfEe0099');
select * from T_TYPE_BINARY3;

--验证插入数据的字节数小于10，右边用0补齐
insert into T_TYPE_BINARY3 values('AaFfEe009');
select * from T_TYPE_BINARY3;

--验证插入的字符不在a-f，A-F之间，是否报错
insert into T_TYPE_BINARY3 values('GgHhZzQQ');
select * from T_TYPE_BINARY3;

--验证插入数据的字节数为0，右边用0补齐
insert into T_TYPE_BINARY3 values('');
select * from T_TYPE_BINARY3;

--验证插入BIT类型
insert into T_TYPE_BINARY3 values(b'1010111101');
select * from T_TYPE_BINARY3;


-- 验证插入其他数据类型
--验证插入int类型，是否报错
insert into T_TYPE_BINARY3 values(12345);
select * from T_TYPE_BINARY3;

--验证插入decimal类型，是否报错
insert into T_TYPE_BINARY3 values(1234.56);
select * from T_TYPE_BINARY3;

--验证插入varchar类型，插入英文字母'xxxyyyZZZW'，是否报错
insert into T_TYPE_BINARY3 values('xxxyyyZZZW');
select * from T_TYPE_BINARY3;

--验证插入date类型，格式yyyy-mm-dd，是否报错
insert into T_TYPE_BINARY3 values(to_date('2020-05-08','yyyy-mm-dd'));
select * from T_TYPE_BINARY3;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss，是否报错
insert into T_TYPE_BINARY3 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
select * from T_TYPE_BINARY3;

--验证插入boolean类型，插入true，是否报错
insert into T_TYPE_BINARY3 values(true);
select * from T_TYPE_BINARY3;

--验证插入空值''
insert into T_TYPE_BINARY3 values('');
select * from T_TYPE_BINARY3;

--验证插入空格' '
insert into T_TYPE_BINARY3 values(' ');
select * from T_TYPE_BINARY3;

--验证插入null
insert into T_TYPE_BINARY3 values(null);
select * from T_TYPE_BINARY3;

--验证插入NULL
insert into T_TYPE_BINARY3 values(NULL);
select * from T_TYPE_BINARY3;


--最后删除创建的表
drop table T_TYPE_BINARY1 if exists;
drop table T_TYPE_BINARY2 if exists;
drop table T_TYPE_BINARY3 if exists;





