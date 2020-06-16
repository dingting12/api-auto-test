--Description:字符串函数补充测试用例
--Date：2020-06-09
--Author：贾路遥

set echo on
set timing on

--建表Test_Builtin_2
DROP TABLE Test_Builtin_2 IF EXISTS ;
CREATE TABLE Test_Builtin_2 (id int,name VARCHAR(100));
INSERT INTO Test_Builtin_2 VALUES (1,' Justin Bieber '),(2,' Hailey Baldwin  '),(3,'    Selena Gomez');
INSERT INTO Test_Builtin_2 VALUES(4,' q az xe'),(5,'S D B J Y '),(6,'  z  xn  HJd UG'),(7,' cs sds dsd');


--CHARACTER_LENGTH()函数

SELECT CHARACTER_LENGTH('  ') FROM Test_Builtin_2 limit 1;
SELECT CHARACTER_LENGTH(name) FROM Test_Builtin_2 order by id;

--异常测试
SELECT CHARACTER_LENGTH(timestamp '2019-02-11 09:22:23') FROM Test_Builtin_2 limit 1;
SELECT CHARACTER_LENGTH( ) FROM Test_Builtin_2 limit 1;
SELECT CHARACTER_LENGTH() FROM Test_Builtin_2 limit 1;
SELECT CHARACTER_LENGTH(abc) FROM Test_Builtin_2 limit 1;

--函数嵌套使用
SELECT CHARACTER_LENGTH(trim(both from name)) FROM Test_Builtin_2 order by id;
SELECT CHARACTER_LENGTH(trim(substring(' l i n ko o p d b ', 5))) FROM Test_Builtin_2 limit 1;

--TRIM()函数
--TRIM (BOTH FROM <expression>)
SELECT trim(BOTH 'qw' FROM 'qww') FROM Test_Builtin_2 limit 1;
SELECT trim(BOTH 'q' FROM 'qww') FROM Test_Builtin_2 limit 1;
SELECT trim(BOTH 'qwq' FROM 'qwwww') FROM Test_Builtin_2 limit 1;
SELECT trim(both from name) FROM Test_Builtin_2 ORDER BY id;
SELECT trim(both from '  ') FROM Test_Builtin_2 limit 1;
SELECT trim(BOTH 'a' FROM 'abc a b') FROM Test_Builtin_2 limit 1;

SELECT trim(name) FROM Test_Builtin_2 ORDER BY id;
SELECT trim('  ') FROM Test_Builtin_2 limit 1;

SELECT trim(TRAILING FROM name) FROM Test_Builtin_2 ORDER BY id;
SELECT trim(TRAILING FROM '  ') FROM Test_Builtin_2 limit 1;
SELECT trim(TRAILING FROM 12 3 ) FROM Test_Builtin_2 limit 1;

SELECT trim(LEADING FROM name) FROM Test_Builtin_2 ORDER BY id;
SELECT trim(LEADING FROM '  ') FROM Test_Builtin_2 limit 1;
SELECT trim(LEADING FROM 12 3 ) FROM Test_Builtin_2 limit 1;

SELECT trim('a' FROM 'abc a ba') FROM Test_Builtin_2 limit 1;
SELECT trim('SL' FROM 'SLINKOOPDBL') FROM Test_Builtin_2 limit 1;
SELECT trim('SL' FROM 'SINKOOPDBL') FROM Test_Builtin_2 limit 1;
--异常测试
SELECT trim(12 3 ) FROM Test_Builtin_2 limit 1;
SELECT trim(both from 12 3 ) FROM Test_Builtin_2 limit 1;
SELECT trim('a' 'b') FROM Test_Builtin_2 limit 1;
SELECT trim('a' 'abc a ba') FROM Test_Builtin_2 limit 1;
SELECT trim('a' ,'abc a b') FROM Test_Builtin_2 limit 1;


--对日期的格式化处理
--to_date()函数

SELECT to_date('2018-09-01','YYYY-MM-DD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYY-DD-MM') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYY-MM') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYY-DD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-11','YYYY-DD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYY') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YY') FROM Test_Builtin_2 limit 1;


--英文月份
SELECT to_date('23-JUN-99','dd-MON-YY')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('99-JUN-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('23-JUN-03','dd-MON-YY')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('99-JUN-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-FEB-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-MAR-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-APR-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-MAY-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-Aug-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-JAN-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-July-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-Sep-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-Oct-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-nov-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-dec-23','YY-MON-DD')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('13-dec-23','dd-MON-yy')FROM Test_Builtin_2 LIMIT 1;
SELECT to_date('2018-nov-01','YYYY-MONTH-DD') FROM Test_Builtin_2 limit 1;

--NULL
SELECT to_date('20180901','MMDD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','MM') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','DD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','MMDD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYYMMDD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYYMM') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYYDD') FROM Test_Builtin_2 limit 1;
SELECT to_date('20180901','YYYYMM') FROM Test_Builtin_2 limit 1;
SELECT to_date('20180901','YYYYDD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','DDD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYY-MM-DDD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','MM-DDD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYY-MON-DD') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','MON') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','MONTH') FROM Test_Builtin_2 limit 1;
SELECT to_date('2018-09-01','YYYY-MONTH-DD') FROM Test_Builtin_2 limit 1;


--函数嵌套使用
SELECT to_date(to_timestamp('2018-11-22 23:12:13','YYYY-MM-DD HH24:MI:SS')) FROM Test_Builtin_2 limit 1;
SELECT to_date(CURRENT_TIMESTAMP) FROM Test_Builtin_2 LIMIT 1;


--TO_TIMESTAMP()函数
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH:MI:SS') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH:MI') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH:SS') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH12') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH12:MI') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH12:SS') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH24:MI:SS') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH24:MI') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH24:SS') FROM Test_Builtin_2 limit 1;

--NULL
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','HH') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','HH12') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','MI') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','SS') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH12') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 13:12:13','YYYY-MM-DD HH12:MI:SS') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH12:MI:SS') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH12:MI') FROM Test_Builtin_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH12:SS') FROM Test_Builtin_2 limit 1;

--函数嵌套使用
SELECT to_timestamp(to_date('2018-11-22','YYYY-MM-DD')) FROM Test_Builtin_2 limit 1;
SELECT to_timestamp(to_date(ADD_MONTHS(timestamp '2011-01-01 21:01:33',6))) FROM Test_Builtin_2 LIMIT 1;
SELECT to_timestamp(CURRENT_DATE) FROM Test_Builtin_2 LIMIT 1;


--substring()函数
SELECT substring('linkoopdb', 5) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', 100) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', -100) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', 0) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', -1) FROM Test_Builtin_2 limit 1;
SELECT substring(' l i n ko o p d b ', 5) FROM Test_Builtin_2 limit 1;

SELECT substring('linkoopdb', 100,100) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', 1,2) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', -100,-100) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', 0,0) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', -1,-2) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', 5,3) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', 5,0) FROM Test_Builtin_2 limit 1;
SELECT substring('linkoopdb', 5,100) FROM Test_Builtin_2 limit 1;
