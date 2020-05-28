--Description：timestamp data type
--Date：2020-05-22
--Author：李爱敏

-- timestamp数据类型验证
--删除表
drop table T_TYPE_TIMESTAMP if exists;

--创建T_TYPE_TIMESTAMP表
create table T_TYPE_TIMESTAMP(
a1 timestamp
);

--验证timestamp的最小值0001:01:01 00:00:00
insert into T_TYPE_TIMESTAMP values(to_timestamp('0001-01-01 00:00:00.000000','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最小值-0.000001s，是否报错
insert into T_TYPE_TIMESTAMP values(to_timestamp('-0001-12-31 23:59:61.999999','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最大值9999-12-31 23:59:61.999999
insert into T_TYPE_TIMESTAMP values(to_timestamp('9999-12-31 23:59:61.999999','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的最大值+0.000001s，是否报错
insert into T_TYPE_TIMESTAMP values(to_timestamp('10000-01-01 00:00:00.000000','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：yyyy-mm-dd hh24:mi:ss
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08 05:03:01','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：yyyy-mm-dd hh24:mi:ss.ff
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994-02-08 05:03:01.88877','yyyy-mm-dd hh24:mi:ss.ff'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：YYYYMMDD HH24:MI:SS
insert into T_TYPE_TIMESTAMP values(to_timestamp('19940208 13:34:51','yyyymmdd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证timestamp的格式：YYYY/MM/DD HH24:MI:SS
insert into T_TYPE_TIMESTAMP values(to_timestamp('1994/02/18 15:13:31','yyyy/mm/dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的年份
insert into T_TYPE_TIMESTAMP values(to_timestamp('-50-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的月份
insert into T_TYPE_TIMESTAMP values(to_timestamp('1967-13-01 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的日期
insert into T_TYPE_TIMESTAMP values(to_timestamp('1967-12-35 00:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的小时
insert into T_TYPE_TIMESTAMP values(to_timestamp('1997-12-26 26:00:00','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的分钟
insert into T_TYPE_TIMESTAMP values(to_timestamp('1997-12-26 23:76:01','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证无效的秒数
insert into T_TYPE_TIMESTAMP values(to_timestamp('1997-12-26 23:16:88','yyyy-mm-dd hh24:mi:ss'));
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入int类型
insert into T_TYPE_TIMESTAMP values(2147483);
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入double类型
insert into T_TYPE_TIMESTAMP values(138.92);
--查询表T_TYPE_TIMESTAMP
select * from T_TYPE_TIMESTAMP;

--验证插入varchar类型，插入数字'12345'
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