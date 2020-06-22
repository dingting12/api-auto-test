set echo on
-- 清空环境
drop table t_timestamp_date IF  EXISTS;

-- 创建包含timestamp和date类型的数据表
create table IF NOT EXISTS t_timestamp_date(t timestamp,d date);

-- 插入数据
insert into t_timestamp_date values ('2019-01-01 10:10:30.123456','2019-01-01');

-- 查询表数据
select * from t_timestamp_date;

-- 使用timestamp类型过滤数据
select * from t_timestamp_date where t<'2020-01-01 10:10:10';

-- 使用date类型过滤数据
select * from  t_timestamp_date where d<'2020-01-01';

-- 使用date和timestamp类型过滤数据
select * from t_timestamp_date where t<'2020-01-01 10:10:10' and d<'2020-01-01';