--Description：日期类型测试用例
--date：2020-05-07
--author：李爱敏

--timestamp:时间戳类型，范围：0001-01-01 00:00:00/9999-12-31 23:59:59
drop table T_TYPE_TIMESTAMP if exists;
create table T_TYPE_TIMESTAMP (birth timestamp);

--临界值
--timestamp的最小值
insert into T_TYPE_TIMESTAMP values(to_timestamp('0001-01-01 00:00:00.000000','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--timestamp的最小值-0.000001s
insert into T_TYPE_TIMESTAMP values(to_timestamp('-0001-12-31 23:59:61.999999','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--timestamp的最大值
insert into T_TYPE_TIMESTAMP values(to_timestamp('9999-12-31 23:59:61.999999','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--timestamp的最大值+0.000001s
insert into T_TYPE_TIMESTAMP values(to_timestamp('10000-01-01 00:00:00.000000','yyyy-mm-dd hh24:mi:ss'));  --null
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;


--格式
--timestamp的格式：yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08 05:03:01','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-2-8 5:3:1','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--timestamp的格式：yyyymmdd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('19940208 13:34:51','yyyymmdd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--timestamp的格式：yyyy/mm/dd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994/02/18 15:13:31','yyyy/mm/dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

insert into T_TYPE_TIMESTAMP values(to_timestamp('1994/2/8 5:3:3','yyyy/mm/dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--timestamp的格式：yy-mm-dd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('84-01-01 05:03:11','yy-mm-dd hh24:mi:ss')); --年份用yy表示时，自动补齐1984
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--timestamp的格式：yyyy-mm-dd
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08','yyyy-mm-dd'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--日期为0000-00-00 00:00:00
insert into T_TYPE_TIMESTAMP values(to_timestamp('0000-00-00 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--日期为''
insert into T_TYPE_TIMESTAMP values('');
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--日期为null
insert into T_TYPE_TIMESTAMP values('null');
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;


--年，月，日，时，分，秒超出范围
--小于timestamp的最小值
insert into T_TYPE_TIMESTAMP values(to_timestamp('-50-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--大于timestamp的最大值
insert into T_TYPE_TIMESTAMP values(to_timestamp('10086-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--月份超出范围
insert into T_TYPE_TIMESTAMP values(to_timestamp('1967-13-01 12:22:11','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--日期超出范围
insert into T_TYPE_TIMESTAMP values(to_timestamp('1967-12-35 12:33:23','yyyy-mm-dd hh24:mi:ss'));
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

--年，月，日，时，分，秒缺失
--缺少年份
insert into T_TYPE_TIMESTAMP values(to_timestamp('11-26 05:03:01','mm-dd hh24:mi:ss')); --缺少年时默认为1970
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺少月份
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-18 15:13:31','yyyy-dd hh24:mi:ss'));  --缺少月份时默认是1月
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺少日期
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02 15:13:31','yyyy-mm hh24:mi:ss')); --缺少日期时默认是1日
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺少小时
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-01 13:31','yyyy-mm-dd mi:ss')); --缺少小时时默认是0点
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺少分钟
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-01 10:30','yyyy-mm-dd hh24:ss')); --缺少分时默认是0分
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--缺少秒
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-01 10:50','yyyy-mm-dd hh24:mi')); --缺少秒时默认是0秒
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--带小数秒
--默认小数秒T_TYPE_TIMESTAMP
drop table T_TYPE_TIMESTAMP if exists;
create table T_TYPE_TIMESTAMP (birth T_TYPE_TIMESTAMP);--默认6位小数秒
insert into T_TYPE_TIMESTAMP values(to_timestamp('2019-7-19 10:23:23.776666888888','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--0位小数秒T_TYPE_TIMESTAMP(0)
drop table T_TYPE_TIMESTAMP if exists;
create table T_TYPE_TIMESTAMP (birth T_TYPE_TIMESTAMP(0));
insert into T_TYPE_TIMESTAMP values(to_timestamp('2019-7-19 10:23:23','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

insert into T_TYPE_TIMESTAMP values(to_timestamp('2019-7-19 10:23:23.2','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--3位小数秒T_TYPE_TIMESTAMP(3)
drop table T_TYPE_TIMESTAMP if exists;
create table T_TYPE_TIMESTAMP (birth T_TYPE_TIMESTAMP(3));
insert into T_TYPE_TIMESTAMP values(to_timestamp('2019-7-19 10:23:23.333','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

insert into T_TYPE_TIMESTAMP values(to_timestamp('2019-7-19 10:23:23.3334','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--6位小数秒T_TYPE_TIMESTAMP(6)
drop table T_TYPE_TIMESTAMP if exists;
create table T_TYPE_TIMESTAMP (birth T_TYPE_TIMESTAMP(6));
insert into T_TYPE_TIMESTAMP values(to_timestamp('2019-7-19 10:23:23.333666','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

insert into T_TYPE_TIMESTAMP values(to_timestamp('2019-7-19 10:23:23.3336667','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--9位小数秒T_TYPE_TIMESTAMP(9)
drop table T_TYPE_TIMESTAMP if exists;
create table T_TYPE_TIMESTAMP (birth T_TYPE_TIMESTAMP(9));
insert into T_TYPE_TIMESTAMP values(to_timestamp('2019-7-19 10:23:23.333666999','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

insert into T_TYPE_TIMESTAMP values(to_timestamp('2019-7-19 10:23:23.3336669991','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--时区（暂不支持）
--create table timezone_test(t0 timestamp,t1 timestamp with time zone,t2 timestamp with local time zone);






--date:日期类型，默认格式:yyyy-mm-dd  范围 0001-01-01/9999-12-31
drop table T_TYPE_DATE if exists;
create table T_TYPE_DATE (birth date);

--临界值
--date的最小值
insert into T_TYPE_DATE values(to_date('0001-01-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--date的最小值-1
insert into T_TYPE_DATE values(to_date('-0001-12-31','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--date的最大值
insert into T_TYPE_DATE values(to_date('9999-12-31','yyyy-mm-dd');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--date的最大值+1
insert into T_TYPE_DATE values(to_date('10000-01-01','yyyy-mm-dd');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;


--格式
--date的格式：yyyy-mm-dd
insert into T_TYPE_DATE values(to_date('1994-02-08','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

insert into T_TYPE_DATE values(to_date('1994-2-8','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--date的格式：yyyymmdd
insert into T_TYPE_DATE values(to_date('19940208','yyyymmdd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--date的格式：yyyy/mm/dd
insert into T_TYPE_DATE values(to_date('1994/02/18','yyyy/mm/dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

insert into T_TYPE_DATE values(to_date('1994/2/8','yyyy/mm/dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--date的格式：yy-mm-dd
insert into T_TYPE_DATE values(to_timestamp('84-01-01','yy-mm-dd')); --年份用yy表示时，自动补齐为1984
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--date的格式：yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_DATE values(to_date('1994-02-08 05:03:01','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--日期为0000-00-00
insert into T_TYPE_DATE values(to_date('0000-00-00','yyyy-mm-dd');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--日期为''
insert into T_TYPE_DATE values('');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--日期为null
insert into T_TYPE_DATE values('null');
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--年，月，日超出范围
--小于date的最小值
insert into T_TYPE_DATE values(to_date('-50-01-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--大于date的最大值
insert into T_TYPE_DATE values(to_date('199999-01-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--月份超出范围
insert into T_TYPE_DATE values(to_date('1967-13-01','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--日期超出范围
insert into T_TYPE_DATE values(to_date('1967-12-35','yyyy-mm-dd'));
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--年，月，日缺失
--缺少年份
insert into T_TYPE_DATE values(to_timestamp('11-26','mm-dd')); --缺少年份时默认为1970
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--缺失月份
insert into T_TYPE_DATE values(to_timestamp('1994-18','yyyy-dd'));  --缺少月份时默认是1月
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;

--缺失日期
insert into T_TYPE_DATE values(to_timestamp('1994-02','yyyy-mm')); --缺少日时默认是1日
--查询表T_TYPE_DATE
select * from T_TYPE_DATE;