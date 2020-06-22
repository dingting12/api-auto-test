set echo on

drop table t_tab IF  EXISTS;

create table IF NOT EXISTS t_tab(col1 int,col2 varchar(50),col3 date,col4 double);

insert into t_tab values (1,'zhangsan','2020-01-01',1.2);


select * from t_tab;