--Description：numeric data type
--Date：2020-05-22
--Author：李爱敏

-- numeric数据类型验证
--删除表
drop table T_TYPE_NUMERIC1 if exists;
drop table T_TYPE_NUMERIC2 if exists;
drop table T_TYPE_NUMERIC3 if exists;
drop table T_TYPE_NUMERIC4 if exists;
drop table T_TYPE_NUMERIC5 if exists;
drop table T_TYPE_NUMERIC6 if exists;
drop table T_TYPE_NUMERIC7 if exists;
drop table T_TYPE_NUMERIC8 if exists;
drop table T_TYPE_NUMERIC9 if exists;

--创建表T_TYPE_NUMERIC1
create table T_TYPE_NUMERIC1(
a1 numeric(5,3)
);

--验证插入int类型
insert into T_TYPE_NUMERIC1 values(2147483);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入varchar类型，插入数字'12345'
insert into T_TYPE_NUMERIC1 values('1234');
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_NUMERIC1 values('AAAbcd');
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_NUMERIC1 values('北京');
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_NUMERIC1 values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_NUMERIC1 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_NUMERIC1 values(true);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入boolean类型，插入false
insert into T_TYPE_NUMERIC1 values(false);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入空值''                                                   
insert into T_TYPE_NUMERIC1 values('');     
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入空格' '                                                   
insert into T_TYPE_NUMERIC1 values(' ');
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入null                                                    
insert into T_TYPE_NUMERIC1 values(null);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--验证插入NULL                                                   
insert into T_TYPE_NUMERIC1 values(NULL);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;


-- 验证NUMERIC(n,m)
--1=<n<=38时
--0=<m<=n
--当整数部分的长度>n-m时，是否报错
insert into T_TYPE_NUMERIC1 values(123.67);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--整数部分的长度<=n-m
--当小数部分的长度>m时，精确到小数点右边m位，m位向右的数字四舍五入
insert into T_TYPE_NUMERIC1 values(1.6798);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--小数部分的长度=m时，保持原值不变，小数点后保持m位
insert into T_TYPE_NUMERIC1 values(12345.123);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--小数部分的长度<m ，小数点后不足m位的在末尾补零，补足m位
insert into T_TYPE_NUMERIC1 values(1234.98);
--查询表T_TYPE_NUMERIC1
select * from T_TYPE_NUMERIC1;

--m>n时
--创建表T_TYPE_NUMERIC2，是否报错
create table T_TYPE_NUMERIC2(
a1 numeric(4,5)
);

--m<0时
--创建表T_TYPE_NUMERIC3，是否报错
create table T_TYPE_NUMERIC3(
a1 numeric(5,-2)
);

--n<1时
--创建表T_TYPE_NUMERIC4，是否报错
create table T_TYPE_NUMERIC4(
a1 numeric(0,2)
);

--n>38时
--创建表T_TYPE_NUMERIC5，是否报错
create table T_TYPE_NUMERIC5(
a1 numeric(39,2)
);


-- 验证NUMERIC(n)，默认为NUMERIC(n,0)
--创建表T_TYPE_DECIMAL6
create table T_TYPE_NUMERIC6(
a1 numeric(6)
);

--整数部分的长度>n，是否报错
insert into T_TYPE_NUMERIC6 values(1234567.9876);
--查询表T_TYPE_NUMERIC6
select * from T_TYPE_NUMERIC6;

--整数部分的长度 <=n，精确到整数位，小数部分四舍五入
insert into T_TYPE_NUMERIC6 values(1234.9876);
--查询表T_TYPE_NUMERIC6
select * from T_TYPE_NUMERIC6;


-- 验证NUMERIC，默认为NUMERIC(5,0)
--创建表T_TYPE_NUMERIC7
create table T_TYPE_NUMERIC7(
a1 numeric
);

--整数部分的长度 >5，是否报错
insert into T_TYPE_NUMERIC7 values(123456.78);
--查询表T_TYPE_NUMERIC7
select * from T_TYPE_NUMERIC7;

--整数部分的长度<=5，小数部分四舍五入
insert into T_TYPE_NUMERIC7 values(12345.78);
--查询表T_TYPE_NUMERIC7
select * from T_TYPE_NUMERIC7;


--验证NUMERIC(*,m)
--创建表T_TYPE_NUMERIC8
create table T_TYPE_NUMERIC8(
a1 numeric(*,m)
);


--验证NUMERIC(*)
--创建表T_TYPE_NUMERIC9
create table T_TYPE_NUMERIC9(
a1 numeric(*)
);