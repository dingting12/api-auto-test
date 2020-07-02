--    Description: 测试Bulk load on pallas
--    Date:         2020-07-02
--    Author:       丁婷

set echo on
drop table T_PALLAS_LOAD_001 if exists;
drop table T_PALLAS_LOAD_002 if exists;
drop table T_PALLAS_LOAD_003 if exists;
drop table T_PALLAS_LOAD_004 if exists;

CREATE TABLE T_PALLAS_LOAD_001(
id int PRIMARY KEY,
name varchar(200),
sal bigint,
birthday timestamp
)engine pallas;

CREATE TABLE T_PALLAS_LOAD_002(
id int PRIMARY KEY,
name varchar(200),
sal bigint,
birthday timestamp
)engine pallas;


CREATE TABLE T_PALLAS_LOAD_003(
id int,
name varchar(200),
sal bigint,
birthday timestamp
);

CREATE TABLE T_PALLAS_LOAD_004(
id int,
name varchar(200),
sal bigint,
birthday timestamp
);

insert into T_PALLAS_LOAD_001 values
(1,'zhangsan1',8901,'1980-12-09 19:01:04'),
(2,'zhangsan2',8201,'1981-12-09 19:01:04'),
(3,'zhangsan3',8301,'1982-12-09 19:01:04'),
(4,'zhangsan4',8401,'1983-12-09 19:01:04'),
(5,'zhangsan5',8501,'1984-12-09 19:01:04'),
(6,'zhangsan6',8971,'1985-12-09 19:01:04'),
(7,'zhangsan7',9901,'1986-12-09 19:01:04'),
(8,'zhangsan8',7901,'1987-12-09 19:01:04'),
(9,'zhangsan9',6941,'1988-12-09 19:01:04'),
(10,'zhangsan10',9951,'1989-12-09 19:01:04'),
(11,'zhangsan11',5901,'1983-12-09 19:01:04'),
(12,'zhangsan12',7901,'1982-12-09 19:01:04'),
(13,'zhangsan13',4901,'1986-12-09 19:01:04'),
(14,'zhangsan14',6901,'1982-12-09 19:01:04'),
(15,'zhangsan15',5901,'1986-12-09 19:01:04');

insert into T_PALLAS_LOAD_003 values
(1,'wangsi1',8901,'1980-12-09 19:01:04'),
(2,'wangsi2',8201,'1981-12-09 19:01:04'),
(3,'wangsi3',8301,'1982-12-09 19:01:04'),
(4,'wangsi4',8401,'1983-12-09 19:01:04'),
(5,'wangsi5',8501,'1984-12-09 19:01:04'),
(6,'wangsi6',8971,'1985-12-09 19:01:04'),
(7,'wangsi7',9901,'1986-12-09 19:01:04'),
(8,'wangsi8',7901,'1987-12-09 19:01:04'),
(9,'wangsi9',6941,'1988-12-09 19:01:04'),
(10,'wangsi10',9951,'1989-12-09 19:01:04'),
(11,'wangsi11',5901,'1983-12-09 19:01:04'),
(12,'wangsi12',7901,'1982-12-09 19:01:04'),
(13,'wangsi13',4901,'1986-12-09 19:01:04'),
(14,'wangsi14',6901,'1982-12-09 19:01:04'),
(15,'wangsi15',5901,'1986-12-09 19:01:04');


--源表为hdfs，目标表为pallas
delete from T_PALLAS_LOAD_002;

load INTO T_PALLAS_LOAD_002 SELECT * FROM T_PALLAS_LOAD_003;

select * from T_PALLAS_LOAD_002 order by id;


--源表为pallas，目标表为pallas
delete from T_PALLAS_LOAD_002;

select * from T_PALLAS_LOAD_002 order by id;

load INTO T_PALLAS_LOAD_002 SELECT * FROM T_PALLAS_LOAD_001;

select * from T_PALLAS_LOAD_002 order by id;

--源表为hdfs，目标表为hdfs
delete from T_PALLAS_LOAD_004;

select * from T_PALLAS_LOAD_004 order by id;

load INTO T_PALLAS_LOAD_004 SELECT * FROM T_PALLAS_LOAD_003;

select * from T_PALLAS_LOAD_004 order by id;

--源表为pallas，目标表为hdfs
delete from T_PALLAS_LOAD_004;

select * from T_PALLAS_LOAD_004 order by id;

load INTO T_PALLAS_LOAD_004 SELECT * FROM T_PALLAS_LOAD_001;

select * from T_PALLAS_LOAD_004 order by id;

