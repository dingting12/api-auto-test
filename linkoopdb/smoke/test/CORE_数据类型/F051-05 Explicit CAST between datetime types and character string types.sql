set echo on

-- 清空环境
drop table t_timestamp_date_cast IF  EXISTS;

-- 创建包含timestamp和date类型的数据表
create table IF NOT EXISTS t_timestamp_date_cast(t timestamp,d date);

-- 插入数据
insert into t_timestamp_date_cast values ('2019-01-01 10:10:30.123456','2019-01-01');

-- timestamp类型显示转换成varchar类型
select cast(t as varchar(50)) tvar from t_timestamp_date_cast;

-- date类型显示转换成varchar类型
select cast(d as varchar(50)) dvar from t_timestamp_date_cast;