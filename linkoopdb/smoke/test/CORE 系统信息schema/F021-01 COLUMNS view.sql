drop table t_column IF  EXISTS;

create table IF NOT EXISTS t_column(col1 int,col2 varchar(50),col3 date,col4 double);

insert into t_column values (1,'zhangsan','2020-01-01',1.2);

insert into t_column values (2,'lisi','2020-02-01',2.2);

insert into t_column values (3,'wangwu','2020-03-01',3.2);

insert into t_column values (4,'zhaoliu','2020-04-01',4.2);

insert into t_column values (5,'tianqi','2020-05-01',5.2);

select * from t_column order by col1;