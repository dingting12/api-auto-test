--Description：timestamp data type
--Date：2020-05-22
--Author：李爱敏

-- timestamp数据类型验证
--删除表
drop table T_TYPE_TIMESTAMP if exists;
drop table T_TYPE_TIMESTAMP1 if exists;
drop table T_TYPE_TIMESTAMP2 if exists;
drop table T_TYPE_TIMESTAMP3 if exists;
drop table T_TYPE_TIMESTAMP4 if exists;

--创建T_TYPE_TIMESTAMP表
create table T_TYPE_TIMESTAMP(
a1 timestamp
);

--验证timestamp的最小值0001:01:01 00:00:00
insert into T_TYPE_TIMESTAMP values(to_timestamp('0001-01-01 00:00:00.000000','yyyy-mm-dd hh24:mi:ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最小值-0.000001s，是否报错
insert into T_TYPE_TIMESTAMP values(to_timestamp('-0001-12-31 23:59:61.999999','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最大值9999-12-31 23:59:61.999999，闰秒
insert into T_TYPE_TIMESTAMP values(to_timestamp('9999-12-31 23:59:61.999999','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最大值+0.000001s，是否报错
insert into T_TYPE_TIMESTAMP values(to_timestamp('10000-01-01 00:00:00.000000','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最大值9999-12-31 23:59:59
insert into T_TYPE_TIMESTAMP values(to_timestamp('9999-12-31 23:59:59','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最大值+1s，是否报错
insert into T_TYPE_TIMESTAMP values(to_timestamp('10000-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证闰年2月份最后一天日期
insert into T_TYPE_TIMESTAMP values(to_timestamp('2001-02-29 10:30:30','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证平年2月份最后一天日期
insert into T_TYPE_TIMESTAMP values(to_timestamp('2001-02-28 10:30:30','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--大于28号时是否报错
insert into T_TYPE_TIMESTAMP values(to_timestamp('2001-02-29 10:30:30','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--年，月，日，时，分，秒超出范围
--月份超出范围
insert into T_TYPE_TIMESTAMP values(to_timestamp('1988-13-01 12:22:11','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--日期超出范围
insert into T_TYPE_TIMESTAMP values(to_timestamp('1988-12-35 12:33:23','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--小时超出范围
insert into T_TYPE_TIMESTAMP values(to_timestamp('1997-12-26 26:03:05','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--分钟超出范围
insert into T_TYPE_TIMESTAMP values(to_timestamp('1997-12-26 23:76:02','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--秒超出范围
insert into T_TYPE_TIMESTAMP values(to_timestamp('1997-12-26 23:16:88','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式
--验证timestamp的格式：24小时制，yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08 05:03:01','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-2-8 5:3:1','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp格式：12小时制，yyyy-mm-dd hh12:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08 05:03:01','yyyy-mm-dd hh12:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--上午
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08 05:03:01','yyyy-mm-dd hh12:mi:ss am'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--下午
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08 05:03:01','yyyy-mm-dd hh12:mi:ss pm'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：yy-mm-dd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('94-01-01 05:03:11','yy-mm-dd hh24:mi:ss')); --年份用yy表示时，自动补齐为1994
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：yyyymmdd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('19940208 13:34:51','yyyymmdd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：yyyy/mm/dd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994/02/18 15:13:31','yyyy/mm/dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--年，月，日，时，分，秒缺失
--缺失年份
insert into T_TYPE_TIMESTAMP values(to_timestamp('11-26 05:03:01','mm-dd hh24:mi:ss')); --缺失年份时默认为1970
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺失月份
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-18 15:13:31','yyyy-dd hh24:mi:ss'));  --缺失月份时默认是1月
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺失日期
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02 15:13:31','yyyy-mm hh24:mi:ss')); --缺失日期时默认是1日
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺失小时
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-01 13:31','yyyy-mm-dd mi:ss')); --缺失小时时默认是0点
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺失分钟
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-01 10:30','yyyy-mm-dd hh24:ss')); --缺失分钟时默认是0分
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺失秒
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-01 10:50','yyyy-mm-dd hh24:mi')); --缺失秒时默认是0秒
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;


--带小数秒
--默认小数秒timestamp
create table T_TYPE_TIMESTAMP1 (a1 timestamp);--默认6位小数秒

--精度范围内
insert into T_TYPE_TIMESTAMP1 values(to_timestamp('2019-07-19 10:23:23.776666','yyyy-mm-dd hh24:mi:ss.ffffff'));
--查询表T_TYPE_TIMESTAMP1
select * from T_TYPE_TIMESTAMP1;

--超出精度，截断
insert into T_TYPE_TIMESTAMP1 values(to_timestamp('2019-07-19 10:23:23.776666888888','yyyy-mm-dd hh24:mi:ss.ffffff'));
--查询表T_TYPE_TIMESTAMP1
select * from T_TYPE_TIMESTAMP1;

--0位小数秒timestamp(0)
create table T_TYPE_TIMESTAMP2 (a1 timestamp(0));

--精度范围内
insert into T_TYPE_TIMESTAMP2 values(to_timestamp('2019-07-19 10:23:10','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP2
select * from T_TYPE_TIMESTAMP2;

--超出精度，截断
insert into T_TYPE_TIMESTAMP2 values(to_timestamp('2019-07-19 10:23:20.8','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP2
select * from T_TYPE_TIMESTAMP2;

--3位小数秒timestamp(3)
create table T_TYPE_TIMESTAMP3 (a1 timestamp(3));

--精度范围内
insert into T_TYPE_TIMESTAMP3 values(to_timestamp('2019-07-19 10:23:23.333','yyyy-mm-dd hh24:mi:ss.fff'));
--查询表T_TYPE_TIMESTAMP3
select * from T_TYPE_TIMESTAMP3;

--超出精度，截断
insert into T_TYPE_TIMESTAMP3 values(to_timestamp('2019-07-19 10:23:23.3334','yyyy-mm-dd hh24:mi:ss.fff'));
--查询表T_TYPE_TIMESTAMP3
select * from T_TYPE_TIMESTAMP3;

--6位小数秒timestamp(6)
create table T_TYPE_TIMESTAMP4 (a1 timestamp(6));

--精度范围内
insert into T_TYPE_TIMESTAMP4 values(to_timestamp('2019-07-19 10:23:23.333666','yyyy-mm-dd hh24:mi:ss.ffffff'));
--查询表T_TYPE_TIMESTAMP4
select * from T_TYPE_TIMESTAMP4;

--超出精度，截断
insert into T_TYPE_TIMESTAMP4 values(to_timestamp('2019-07-19 10:23:23.3336667','yyyy-mm-dd hh24:mi:ss.ffffff'));
--查询表T_TYPE_TIMESTAMP4
select * from T_TYPE_TIMESTAMP4;

--插入不同数据类型
--验证插入int类型
insert into T_TYPE_TIMESTAMP values(20100208);
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入double类型
insert into T_TYPE_TIMESTAMP values(138.92);
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入varchar类型，插入数字'20100111'
insert into T_TYPE_TIMESTAMP values('20100111');
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入varchar类型，插入英文字母'AAAbcd'
insert into T_TYPE_TIMESTAMP values('AAAbcd');
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入varchar类型，插入汉字'北京'
insert into T_TYPE_TIMESTAMP values('北京');
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入date类型，格式yyyy-mm-dd
insert into T_TYPE_TIMESTAMP values(to_date('2020-05-08','yyyy-mm-dd'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入空值''                                                   
insert into T_TYPE_TIMESTAMP values('');     
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入空格' '                                                   
insert into T_TYPE_TIMESTAMP values(' ');     
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入null                                                    
insert into T_TYPE_TIMESTAMP values(null);  
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;  

--验证插入NULL                                                   
insert into T_TYPE_TIMESTAMP values(NULL);  
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入0000-00-00 00:00:00.000000
insert into T_TYPE_TIMESTAMP values(to_timestamp('0000-00-00 00:00:00.000000','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;


