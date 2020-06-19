-- 清空环境
drop table t_date IF  EXISTS;

-- 创建包含时间列的表
create table IF NOT EXISTS t_date (id int,name varchar(20),c3 date);

-- 插入数据
insert into t_date values (
(1,'a','2018-08-01'),
(2,'b','2018-08-02'),
(3,'c','2018-08-03'),
(4,'d','2018-08-04'),
(5,'e','2018-08-05'),
(6,'f','2018-08-06'),
(7,'g','2018-08-07'),
(8,'h','2018-08-08'),
(9,'i','2018-08-09'));

-- 查询结果
select * from t_date order by id;

-- 使用时间函数输出年份
select * from (select date_format(c3,'YYYY') d from t_date) order by d;

-- 使用时间函数输出日
select * from (select date_format(c3,'DD') d from t_date) order by d;
