-- 清空环境
drop table t_timestamp IF  EXISTS;
drop table t_timestamp_0 IF  EXISTS;
drop table t_timestamp_3 IF  EXISTS;
drop table t_timestamp_6 IF  EXISTS;

-- 创建包含timestamp 类型的表
create table IF NOT EXISTS t_timestamp(t timestamp);

-- 插入数据
insert into t_timestamp values ('2019-01-01 10:10:30.123456');

-- 查询结果
select * from t_timestamp;

-- 创建包含timestamp 类型的表
create table IF NOT EXISTS t_timestamp_0(t timestamp(0));

-- 插入数据
insert into t_timestamp_0 values ('2019-01-01 10:10:30.123456');

-- 查询结果
select * from t_timestamp_0;

-- 创建包含timestamp 类型的表
create table IF NOT EXISTS t_timestamp_3(t timestamp(3));

-- 插入数据
insert into t_timestamp_3 values ('2019-01-01 10:10:30.123456');

-- 查询结果
select * from t_timestamp_3;

-- 创建包含timestamp 类型的表
create table IF NOT EXISTS t_timestamp_6(t timestamp(6));

-- 插入数据
insert into t_timestamp_6 values ('2019-01-01 10:10:30.123456');

-- 查询结果
select * from t_timestamp_6;

-- 使用DATE_FORMAT函数按指定格式输出
SELECT DATE_FORMAT(timestamp '2017-12-31 20:22:13', 'yyyy-MM-dd') FROM t_timestamp;