--    Description: 测试内置函数
--    Date:         2020-06-11
--    Author:       丁婷

-- 测试327 LDBX070-01 Spark 2.3.0 built-in functions 
drop table if exists T_Builtin_Function_001;
CREATE TABLE T_Builtin_Function_001 (
id int,
name VARCHAR(100)
);

INSERT INTO T_Builtin_Function_001 VALUES 
(1,'zs'),
(2,'ls'),
(3,'ww');

SELECT CHARACTER_LENGTH('Spark SQL '),
	   UPPER(name),
	   degrees(PI() / 2),
       cast('214748364.7' as INT),
       octet_length('!@#$%^&*()'),
       trim(both 'SL' from 'SSparkSQLS'),
       add_months(date '2016-08-31', 1),
       lower('dsdsd'),
	   coalesce(NULL, 1.0, NULL),
	   nvl2(true, ARRAY[2,2,3], null),
	   least(10, -9, 2, 4, 3),
	   datediff(date '2009-07-31', date '2009-07-30'),
       unix_timestamp(timestamp '2016-04-08 12:13:14', 'yyyy-mm-dd hh24:mi:ss'),
	   concat_ws(' ', ARRAY[date '2016-12-31',date '2016-1-30'], ARRAY['wd'])
FROM T_Builtin_Function_001 limit 1;


--432 LDBX070-02  to_char function
drop table if exists T_to_char_001;

create table T_to_char_001 (
ID INT,
NAME VARCHAR(20),
TDATE DATE,
TTIMESTAMP TIMESTAMP
);

insert into T_to_char_001 VALUES 
(3,'ww',to_date('03-08-2018','dd-mm-yyyy'),to_timestamp('03-08-2018 22:10:13','dd-mm-yyyy hh24:mi:ss')),
(4,'qq',to_date('08-2018-04','mm-yyyy-dd'),to_timestamp('08-2018-04 22:10:14','mm-yyyy-dd hh24:mi:ss'));

select to_char(tdate,'mm-dd-yyyy') from T_to_char_001 where id = 3;

drop table if exists T_to_char_001;

--528 LDBX070-03 JSON_TUPLE functon
SELECT json_tuple('{"a":1, "b":2}', 'a', 'b')  from (values(1));

--573 LDBX070-04  json_path function
select json_path(
'[
{"snumber":"13011560889", "enddate":"12321312321","codetag":"1"},
{"snumber":"18600010011", "enddate":"212212222", "codetag":"0"},
{"snumber":"13011560889", "enddate":"212212222", "codetag":"2"},
{"snumber":"13011560889", "enddate":"212212222", "codetag":"3"}]',
'$[?(@.snumber == "13011560889")].codetag') 
from (values(1,2,3)) as t;

--708 LDBX070-06 NAMED_STRUCT function

select named_struct('a', 1, 'b', 2, 'c', 3) FROM (values(1)) as t;

--727 date_fomat function
SELECT DATE_FORMAT(date '2017-12-31', 'yyyyMMdd') FROM (values(1)) as t;


--699 LDBX070-05 FROM_JSON function
select j.tsmallint, j.tint,j.tbigint,j.tdouble from (
     select from_json(json, 'tsmallint smallint,tint int,tbigint bigint,tdouble double') j FROM
                  (values('{"tsmallint":23,"tint":34344,"tbigint":43545665,"tdouble":5657.54}')) as k(json)
  );
  
--1970  LDBX070-08 GROUP_CANCAT aggregation function,2113  LDBX070-15 GROUP_TO_ARRAY aggregation function
DROP TABLE T_olap_test_001 IF EXISTS;

create table T_olap_test_001 (
id varchar(10), 
group_id varchar(10), 
column_id int, 
column_value int
);
insert into T_olap_test_001 VALUES
('a','2019-01-01', 1, 360),
('a','2019-01-01', 1, 360),
('a','2019-01-01', 2, 360),
('a','2019-01-01', 3, 373),
('b','2019-01-01', 4, 345),
('a','2019-01-02', 5, 370),
('a','2019-01-01', 6, 371),
('a','2019-01-01', 7, 381),
('b','2019-01-01', 8, 382),
('a','2019-01-01', 9, 383),
('a','2019-01-02', 10, 420),
('a','2019-01-01', 11, 430),
('a','2019-01-01', 12, 410),
('b','2019-01-01', 13, 330),
('a','2019-01-01', 14, null);

select group_id, GROUP_CONCAT(column_value order by column_value) from T_olap_test_001 group by group_id;

select group_id, GROUP_TO_ARRAY(column_value order by column_id) from T_olap_test_001 group by group_id;

DROP TABLE T_olap_test_001 IF EXISTS;

--1518 LDBX070-09 support agg udaf with where condition，1969  LDBX070-07 TRUNC number function
drop table T_AGG_TEST_001 if exists;


create table T_AGG_TEST_001(
i1 int, 
d2 double, 
d3 decimal(4,2), 
d4 date, 
t5 timestamp
);

insert into T_AGG_TEST_001 values(
 (1,1,12.76,'2008-08-22', '2008-08-08 20:08:08'),
 (2,2,23.76,'2008-08-23', '2008-08-09 20:08:08'),
 (3,3,38.76,'2008-08-24', '2008-08-10 20:08:08'),
 (4,4,42.76,'2008-08-25', '2008-08-11 20:08:08'),
 (5,5,51.76,'2008-08-26', '2008-08-12 20:08:08'),
 (6,6,69.76,'2008-08-27', '2008-08-13 20:08:08'),
 (10,null,null,'2008-08-28', '2008-08-14 20:08:08'),
 (null,10,10.76,'2008-08-28', '2008-08-14 20:08:08'),
 (10,10,19.76,'2008-08-28', '2008-08-14 20:08:08'),
 (10,10,88.76,'2008-08-28', '2008-08-14 20:08:08'),
 (10,10,16.76,'2008-08-28', '2008-08-14 20:08:08'),
 (10,10,44.76,'2008-08-28', '2008-08-14 20:08:08'),
 (10,10,54.76,'2008-08-28', '2008-08-14 20:08:08'),
 (10,10,11.76,'2008-08-28', '2008-08-14 20:08:08'));
 
 select sum_where(i1,i1 = 10) from T_AGG_TEST_001
 
 select i1, avg_where(i1,i1 IS null) from T_AGG_TEST_001 GROUP BY i1 order by i1;
 
 SELECT TRUNC(d3,2) FROM T_AGG_TEST_001 limit 1;
 
 drop table T_AGG_TEST_001 if exists;

--73 LDBX070-13 trim函数的支持和72 LDBX070-14 concat函数的完整支持
DROP TABLE t_trim_concat_001 IF EXISTS CASCADE;

CREATE TABLE t_trim_concat_001(
id int,
name varchar(200)
);

INSERT INTO t_trim_concat_001 VALUES
(1,' q az xe'),
(2,'S D B J Y '),
(3,'  z  xn  HJd UG'),
(4,' cs sds dsd');

SELECT trim(name) FROM t_trim_concat_001 ORDER BY id;

SELECT concat(id,name) FROM t_trim_concat_001 ORDER BY id;

DROP TABLE t_trim_concat_001 IF EXISTS CASCADE;

