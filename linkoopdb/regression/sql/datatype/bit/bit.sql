-- Description：bit data type
-- Date：2020-06-12
-- Author：李爱敏

set echo on
set timing on

-- BIT(n)数据类型验证
--如果表已存在，则先删除
drop table T_TYPE_BIT1 if exists;
drop table T_TYPE_BIT2 if exists;
drop table T_TYPE_BIT3 if exists;
drop table T_TYPE_BIT4 if exists;
drop table T_TYPE_BIT5 if exists;
drop table T_TYPE_BIT6 if exists;

--创建表T_TYPE_BIT1，设置位数为默认值，默认为1
create table T_TYPE_BIT1(a1 bit);

--验证插入数据的位数等于1
insert into T_TYPE_BIT1 values(b'1');
select * from T_TYPE_BIT1;

--验证插入数据的位数大于1，是否报错
insert into T_TYPE_BIT1 values(b'11');
select * from T_TYPE_BIT1;

--创建表T_TYPE_BIT2，设置位数n为0，是否报错
create table T_TYPE_BIT2(a1 bit(0));

--创建表T_TYPE_BIT3，设置位数n为1
create table T_TYPE_BIT2(a1 bit(1));
insert into T_TYPE_BIT3 values(b'1');
select * from T_TYPE_BIT3;

--创建表T_TYPE_BIT4，设置位数n为65，是否报错
create table T_TYPE_BIT4(a1 bit(65));
insert into T_TYPE_BIT4 values(b'10101010101010101010101010101010101010101010101010101010101011111');
select * from T_TYPE_BIT4;

--创建表T_TYPE_BIT5，设置位数n为64
create table T_TYPE_BIT5(a1 bit(64));
insert into T_TYPE_BIT5 values(b'1010101010101010101010101010101010101010101010101010101010101111');
select * from T_TYPE_BIT5;

--创建表T_TYPE_BIT6，设置位数n为10
create table T_TYPE_BIT6(a1 bit(10));

--验证插入数据的位数大于10，是否报错
insert into T_TYPE_BIT6 values(b'10101010101');
select * from T_TYPE_BIT6;

--验证插入数据的位数等于10
insert into T_TYPE_BIT6 values(b'1010101010');
select * from T_TYPE_BIT6;

--验证插入数据的位数小于10，左边补0
insert into T_TYPE_BIT6 values(b'10101010');
select * from T_TYPE_BIT6;

--验证插入非0,1的数字，是否报错
insert into T_TYPE_BIT6 values(b'22334455');
select * from T_TYPE_BIT6;

--验证插入0000000000
insert into T_TYPE_BIT6 values(b'0000000000');
select * from T_TYPE_BIT6;

--验证插入1111111111
insert into T_TYPE_BIT6 values(b'1111111111');
select * from T_TYPE_BIT6;

--验证插入BINARY类型
insert into T_TYPE_BIT6 values('1111111000');
select * from T_TYPE_BIT6;

-- 验证插入其他数据类型
--验证插入int类型，是否报错
insert into T_TYPE_BIT6 values(12345);
select * from T_TYPE_BIT6;

--验证插入decimal类型，是否报错
insert into T_TYPE_BIT6 values(1234.56);
select * from T_TYPE_BIT6;

--验证插入varchar类型，插入英文字母'xxxyyyZZZ'，是否报错
insert into T_TYPE_BIT6 values('xxxyyyZZZ');
select * from T_TYPE_BIT6;

--验证插入date类型，格式yyyy-mm-dd，是否报错
insert into T_TYPE_BIT6 values(to_date('2020-05-08','yyyy-mm-dd'));
select * from T_TYPE_BIT6;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss，是否报错
insert into T_TYPE_BIT6 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
select * from T_TYPE_BIT6;

--验证插入boolean类型，插入true，是否报错
insert into T_TYPE_BIT6 values(true);
select * from T_TYPE_BIT6;

--验证插入空值''
insert into T_TYPE_BIT6 values('');
select * from T_TYPE_BIT6;

--验证插入空格' '
insert into T_TYPE_BIT6 values(' ');
select * from T_TYPE_BIT6;

--验证插入null
insert into T_TYPE_BIT6 values(null);
select * from T_TYPE_BIT6;

--验证插入NULL
insert into T_TYPE_BIT6 values(NULL);
select * from T_TYPE_BIT6;


--最后删除创建的表
drop table T_TYPE_BIT1 if exists;
drop table T_TYPE_BIT2 if exists;
drop table T_TYPE_BIT3 if exists;
drop table T_TYPE_BIT4 if exists;
drop table T_TYPE_BIT5 if exists;
drop table T_TYPE_BIT6 if exists;