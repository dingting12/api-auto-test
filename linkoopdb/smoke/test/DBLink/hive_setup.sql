set echo on

connect hive/hive@jdbc:hive2:tcp://192.168.1.73:10000/default

drop table if exists t_datatype_hive;

create table t_datatype_hive(
tint 	int
);