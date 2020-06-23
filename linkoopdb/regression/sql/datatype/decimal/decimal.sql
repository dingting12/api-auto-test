--Description：decimal data type
--Date：2020-05-22
--Author：李爱敏

set echo on
set timing on

-- decimal数据类型验证
--如果表已存在，则先删除
drop table T_TYPE_DECIMAL1 if exists;
drop table T_TYPE_DECIMAL2 if exists;
drop table T_TYPE_DECIMAL3 if exists;
drop table T_TYPE_DECIMAL4 if exists;
drop table T_TYPE_DECIMAL5 if exists;
drop table T_TYPE_DECIMAL6 if exists;
drop table T_TYPE_DECIMAL7 if exists;


--验证DECIMAL(n,m)
--创建表T_TYPE_DECIMAL1
create table T_TYPE_DECIMAL1(
a1 decimal(5,2)
);

--根据n的值进行判断，当1=<n<=38时
--判断m的值，当0=<m<=n时
--整数部分的长度>n-m，是否报错
insert into T_TYPE_DECIMAL1 values(1234.67);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--当整数部分的长度<=n-m时：
--小数部分的长度>m时，精确到小数点右边m位，m位向右的数字四舍五入
insert into T_TYPE_DECIMAL1 values(1.56798);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--小数部分的长度=m时，保持原值不变，小数点后保持m位
insert into T_TYPE_DECIMAL1 values(1.67);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--小数部分的长度<m时，小数点后不足m位的在末尾补零，补足m位
insert into T_TYPE_DECIMAL1 values(123.6);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--m>n时
--创建表T_TYPE_DECIMAL2，是否报错
create table T_TYPE_DECIMAL2(
a1 decimal(4,5)
);

--m<0时
--创建表T_TYPE_DECIMAL3，是否报错
create table T_TYPE_DECIMAL3(
a1 decimal(5,-2)
);

--当n<1时
--创建表T_TYPE_DECIMAL4，是否报错
create table T_TYPE_DECIMAL4(
a1 decimal(0,2)
);

--当n>38时
--创建表T_TYPE_DECIMAL5，是否报错
create table T_TYPE_DECIMAL5(
a1 decimal(39,2)
);

--验证DECIMAL(n)，默认为DECIMAL(n,0)
--创建表T_TYPE_DECIMAL6
create table T_TYPE_DECIMAL6(
a1 decimal(6)
);

--整数部分的长度>6，是否报错
insert into T_TYPE_DECIMAL6 values(1234567.9876);
--查询表T_TYPE_DECIMAL6
select * from T_TYPE_DECIMAL6;

--整数部分的长度<=6，精确到整数位，小数部分四舍五入
insert into T_TYPE_DECIMAL6 values(1234.9876);
--查询表T_TYPE_DECIMAL6
select * from T_TYPE_DECIMAL6;


--验证DECIMAL，默认为DECIMAL(5,0)
--创建表T_TYPE_DECIMAL7
create table T_TYPE_DECIMAL7(
a1 decimal
);

--整数部分长度>5，是否报错
insert into T_TYPE_DECIMAL7 values(123456.78);
--查询表T_TYPE_DECIMAL7
select * from T_TYPE_DECIMAL7;

--整数部分长度<=5，小数部分四舍五入
insert into T_TYPE_DECIMAL7 values(1234.78);
--查询表T_TYPE_DECIMAL7
select * from T_TYPE_DECIMAL7;

--插入不同数据类型
--验证插入int类型
insert into T_TYPE_DECIMAL1 values(214);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入varchar类型，插入数字'123.45'
insert into T_TYPE_DECIMAL1 values('123.45');
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_DECIMAL1 values('AAAbcd');
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_DECIMAL1 values('北京');
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_DECIMAL1 values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入timestamp类型，格式yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_DECIMAL1 values(TO_TIMESTAMP('2020-05-08 12:19:01', 'yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入boolean类型，插入true                                                       
insert into T_TYPE_DECIMAL1 values(true);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入boolean类型，插入false
insert into T_TYPE_DECIMAL1 values(false);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入空值''                                                   
insert into T_TYPE_DECIMAL1 values('');
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入空格' '                                                   
insert into T_TYPE_DECIMAL1 values(' ');
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入null                                                    
insert into T_TYPE_DECIMAL1 values(null);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;

--验证插入NULL                                                   
insert into T_TYPE_DECIMAL1 values(NULL);
--查询表T_TYPE_DECIMAL1
select * from T_TYPE_DECIMAL1;



--最后删除创建的表
drop table T_TYPE_DECIMAL1 if exists;
drop table T_TYPE_DECIMAL2 if exists;
drop table T_TYPE_DECIMAL3 if exists;
drop table T_TYPE_DECIMAL4 if exists;
drop table T_TYPE_DECIMAL5 if exists;
drop table T_TYPE_DECIMAL6 if exists;
drop table T_TYPE_DECIMAL7 if exists;