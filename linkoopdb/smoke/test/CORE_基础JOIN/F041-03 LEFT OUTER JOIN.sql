set echo on

-- 清空环境
drop table t_join_left IF  EXISTS;
drop table t_join_right IF  EXISTS;

-- 创建左表
create table IF NOT EXISTS t_join_left(col1 int,col2 varchar(50),col3 date,col4 double);

-- 插入数据
insert into t_join_left values (1,'zhangsan','2020-01-01',1.2);
insert into t_join_left values (2,'lisi','2020-02-01',2.2);
insert into t_join_left values (3,'wangwu','2020-03-01',3.2);
insert into t_join_left values (4,'zhaoliu','2020-04-01',4.2);
insert into t_join_left values (5,'tianqi','2020-05-01',5.2);

-- 创建右表
create table IF NOT EXISTS t_join_right(col1 int,col2 varchar(50),col3 date,col4 double);

-- 插入数据
insert into t_join_right values (1,'zhangsan','2020-01-01',1.2);
insert into t_join_right values (2,'lisi','2020-02-01',2.2);
insert into t_join_right values (3,'wangwu','2020-03-01',3.2);
insert into t_join_right values (4,'zhaoliu','2020-04-01',4.2);
insert into t_join_right values (5,'tianqi','2020-05-01',5.2);

-- 左右表inner join
select a.*,b.* from t_join_left a left outer join t_join_right b on a.col1=b.col1 order by col1;