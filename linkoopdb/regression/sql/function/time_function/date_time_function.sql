--Description:日期时间函数补充测试用例
--Date：2020-06-09
--Author：贾路遥

--建表Test_Builtin_Function_2
DROP TABLE Test_Builtin_Function_2 IF EXISTS ;
CREATE TABLE Test_Builtin_Function_2 (id int,name VARCHAR(100));
INSERT INTO Test_Builtin_Function_2 VALUES (1,' Justin Bieber '),(2,' Hailey Baldwin  '),(3,'    Selena Gomez');
INSERT INTO Test_Builtin_Function_2 VALUES(4,' q az xe'),(5,'S D B J Y '),(6,'  z  xn  HJd UG'),(7,' cs sds dsd');


--to_date()函数

SELECT to_date('2018-09-01','RRRRMMDD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','RRRR-MM-DD') FROM Test_Builtin_Function_2 limit 1 ;
SELECT to_date('2018-09-01','RRRR-DD-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-11','RRRR-DD-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-11','RRRR-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-11','RRRR-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','RRRRMM') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','RRRRDD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','MMDD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','RRRR') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','MM') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','DD') FROM Test_Builtin_Function_2 limit 1;

SELECT to_date('23-JUN-99','dd-MON-YY')FROM Test_Builtin_Function_2 LIMIT 1;

SELECT to_date('2018-09-01','YYYYMMDD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYY-MM-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYY-DD-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYY-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYY-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-11','YYYY-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYYMM') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYYDD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYY') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YY') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','DDD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYY-MM-DDD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','MM-DDD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYY-MON-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','MON') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','MONTH') FROM Test_Builtin_Function_2 limit 1;
SELECT to_date('2018-09-01','YYYY-MONTH-DD') FROM Test_Builtin_Function_2 limit 1;

SELECT to_date(to_timestamp('2018-11-22 23:12:13','YYYY-MM-DD HH24:MI:SS')) FROM Test_Builtin_Function_2 limit 1;
SELECT to_date(CURRENT_TIMESTAMP) FROM Test_Builtin_Function_2 LIMIT 1;


--TO_TIMESTAMP()函数
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','HH') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','HH12') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','SS') FROM Test_Builtin_Function_2 limit 1;

SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH:MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH12') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH12') FROM Test_Builtin_Function_2 limit 1;

SELECT  TO_TIMESTAMP('2018-11-22 13:12:13','YYYY-MM-DD HH12:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH12:MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 11:12:13','YYYY-MM-DD HH12:SS') FROM Test_Builtin_Function_2 limit 1;

SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH12:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH12:MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH12:SS') FROM Test_Builtin_Function_2 limit 1;

SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH24:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH24:MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  TO_TIMESTAMP('2018-11-22 23:12:13','YYYY-MM-DD HH24:SS') FROM Test_Builtin_Function_2 limit 1;

SELECT to_timestamp(to_date('2018-11-22','YYYY-MM-DD')) FROM Test_Builtin_Function_2 limit 1;
SELECT to_timestamp(to_date(ADD_MONTHS(timestamp '2011-01-01 21:01:33',6))) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT to_timestamp(CURRENT_DATE) FROM Test_Builtin_Function_2 LIMIT 1;


--ADD_MONTHS()函数
SELECT ADD_MONTHS(DATE '2011-01-01',6) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT ADD_MONTHS(DATE '2011-01-01',26) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT ADD_MONTHS(DATE '2011-01-01',0) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT ADD_MONTHS(timestamp '2011-01-01 00:00:00',6) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT ADD_MONTHS(timestamp '2011-01-01 00:00:00',26) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT ADD_MONTHS(timestamp '2011-01-01 00:00:00',0) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT ADD_MONTHS(timestamp '2011-01-01 21:01:33',-1) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT ADD_MONTHS(timestamp '2011-01-01 00:00:00',1.1) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT ADD_MONTHS(timestamp '2011-01-01 00:00:00',1.9) FROM Test_Builtin_Function_2 LIMIT 1;

SELECT ADD_MONTHS(timestamp '2011-01-01 00:00:00',abc) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT ADD_MONTHS(timestamp '2011-01-01 00:00:00',true) FROM Test_Builtin_Function_2 LIMIT 1;


--CURRENT_DATE函数
SELECT CURRENT_DATE FROM Test_Builtin_Function_2 LIMIT 1;


--CURRENT_TIMESTAMP()函数
SELECT CURRENT_TIMESTAMP FROM Test_Builtin_Function_2 LIMIT 1;
SELECT CURRENT_TIMESTAMP(2) FROM Test_Builtin_Function_2 LIMIT 1;


--DATE_ADD()函数
SELECT DATE_ADD(DATE '2016-07-30', 1) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT DATE_ADD(DATE '2016-04-30', 1) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT DATE_ADD(DATE '2016-05-01', -1) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT DATE_ADD(DATE '2016-04-30', 0) FROM Test_Builtin_Function_2 LIMIT 1;

SELECT DATE_ADD('2016-04-30', 21) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT DATE_ADD(timestamp '2016-04-30 12:21:22', 5) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT DATE_ADD(timestamp '2016-04-30 12:21:22', -5) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT DATE_ADD(timestamp '2016-04-30 12:21:22', 0) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT DATE_ADD('2016-04-30 12:21:22', 5) FROM Test_Builtin_Function_2 LIMIT 1;


--date_format()函数
SELECT date_format('2018-09-01','RRRRMMDD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','RRRR-MM-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','RRRR-DD-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-11','RRRR-DD-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-11','RRRR-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-11','RRRR-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','RRRRMM') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','RRRRDD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','MMDD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','RRRR') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','MM') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','DD') FROM Test_Builtin_Function_2 limit 1;

SELECT date_format('2018-09-01','YYYYMMDD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YYYY-MM-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YYYY-DD-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YYYY-MM') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YYYY-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YYYYMM') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YYYYDD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YYYY') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YY') FROM Test_Builtin_Function_2 limit 1;

SELECT date_format('2018-09-01','DDD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YYYY-MM-DDD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','MM-DDD') FROM Test_Builtin_Function_2 limit 1;

SELECT date_format('2018-09-01','YYYY-MON-DD') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','MON') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','MONTH') FROM Test_Builtin_Function_2 limit 1;
SELECT date_format('2018-09-01','YYYY-MONTH-DD') FROM Test_Builtin_Function_2 limit 1;

SELECT  date_format('2018-11-22 11:12:13','YYYY-MM-DD HH:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 11:12:13','HH') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 11:12:13','HH12') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 11:12:13','MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 11:12:13','SS') FROM Test_Builtin_Function_2 limit 1;

SELECT  date_format('2018-11-22 11:12:13','YYYY-MM-DD HH:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 11:12:13','YYYY-MM-DD HH:MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 11:12:13','YYYY-MM-DD HH:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 11:12:13','YYYY-MM-DD HH12') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 23:12:13','YYYY-MM-DD HH12') FROM Test_Builtin_Function_2 limit 1;

SELECT  date_format('2018-11-22 11:12:13','YYYY-MM-DD HH12:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 11:12:13','YYYY-MM-DD HH12:MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 11:12:13','YYYY-MM-DD HH12:SS') FROM Test_Builtin_Function_2 limit 1;

SELECT  date_format('2018-11-22 23:12:13','YYYY-MM-DD HH12:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 23:12:13','YYYY-MM-DD HH12:MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 23:12:13','YYYY-MM-DD HH12:SS') FROM Test_Builtin_Function_2 limit 1;

SELECT  date_format('2018-11-22 23:12:13','YYYY-MM-DD HH24:MI:SS') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 23:12:13','YYYY-MM-DD HH24:MI') FROM Test_Builtin_Function_2 limit 1;
SELECT  date_format('2018-11-22 23:12:13','YYYY-MM-DD HH24:SS') FROM Test_Builtin_Function_2 limit 1;


--DATE_SUB()函数
SELECT DATE_SUB('2018-11-22 23:12:13',0) FROM Test_Builtin_Function_2 limit 1;
SELECT DATE_SUB('2018-11-22 23:12:13',100) FROM Test_Builtin_Function_2 limit 1;
SELECT DATE_SUB(timestamp '2018-11-22 23:12:13',0) FROM Test_Builtin_Function_2 limit 1;
SELECT DATE_SUB('2018-11-22 23:12:13',0) FROM Test_Builtin_Function_2 limit 1;

SELECT date_sub(date '2016-07-30',1000) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT date_sub(date '2016-07-30',-1000) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT date_sub(date '2016-07-30',1.232) FROM Test_Builtin_Function_2 LIMIT 1;

SELECT DATE_SUB('2018-11-33',0) FROM Test_Builtin_Function_2 limit 1;
SELECT date_sub('2016-07-30',1000000000) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT date_sub('2016-07-30',-1000000000) FROM Test_Builtin_Function_2 LIMIT 1;

--date_trunc()函数
SELECT date_trunc('2016-01-01 21:22:23', 'RRRR') from Test_Builtin_Function_2 LIMIT 1;;
SELECT date_trunc('2016-11-01 21:22:23', 'YYYY-MM-DD HH24:MI:SS') from Test_Builtin_Function_2 LIMIT 1;
SELECT date_trunc('2016-11-01 21:22:23', 'YYYY-MM-DD') from Test_Builtin_Function_2 LIMIT 1;
SELECT date_trunc('2016-11-01 21:22:23', 'HH24:MI:SS') from Test_Builtin_Function_2 LIMIT 1;


--datediff()函数
SELECT datediff('2016-11-01 21:22:23', '2016-11-23') from Test_Builtin_Function_2 LIMIT 1;
SELECT datediff('2018-11-01 21:22:23', '2016-11-23') from Test_Builtin_Function_2 LIMIT 1;
SELECT datediff('2016-11-01 21:22:23', '2016-11-01 21:25:23') from Test_Builtin_Function_2 LIMIT 1;
--日期格式错误
SELECT datediff('2016-11-01 21:22:23', '2016-11-331 21:25:23') from Test_Builtin_Function_2 LIMIT 1;


--day()函数
SELECT day('2016-11-01 21:22:23') from Test_Builtin_Function_2 LIMIT 1;
SELECT day('2016-11-29') from Test_Builtin_Function_2 LIMIT 1;


--DAYOFMONTH()函数
SELECT DAYOFMONTH('2016-11-29') from Test_Builtin_Function_2 LIMIT 1;
SELECT DAYOFMONTH('2016-11-29 00:00:00') from Test_Builtin_Function_2 LIMIT 1;
SELECT DAYOFMONTH(timestamp '2016-11-29 00:00:00') from Test_Builtin_Function_2 LIMIT 1;


--from_unixtime()函数
SELECT from_unixtime(0, 'yyyy-mm-dd hh24:mi:ss') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT from_unixtime(192, 'yyyy-mm-dd hh24:mi:ss') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT from_unixtime(1995-11-23, 'yyyy-mm-dd hh24:mi:ss') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT from_unixtime(1995-11-23, 'yyyy-mm-dd') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT from_unixtime(1995-11-23, 'yyyymmdd') FROM Test_Builtin_Function_2 LIMIT 1;


--from_utc_timestamp()函数
SELECT from_utc_timestamp('2016-08-31 12:23:31', 'PST') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT from_utc_timestamp('2016-08-31 12:23:31', 'PRC') FROM Test_Builtin_Function_2 LIMIT 1;
select from_utc_timestamp('1970-01-01 00:00:00','PRC') FROM Test_Builtin_Function_2 LIMIT 1;
select from_utc_timestamp('1970-01-01 00:00:00','PST') FROM Test_Builtin_Function_2 LIMIT 1;
select from_utc_timestamp('1970-01-01 00:00:00','CST') FROM Test_Builtin_Function_2 LIMIT 1;
select from_utc_timestamp('1970-01-01 00:00:00','EST') FROM Test_Builtin_Function_2 LIMIT 1;
select from_utc_timestamp('1970-01-01 00:00:00','DST') FROM Test_Builtin_Function_2 LIMIT 1;


--hour()函数
SELECT hour('2009-07-30 00:23:00') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT hour(timestamp '2009-07-30 00:23:00') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT hour(timestamp '2009-07-30 24:23:00') FROM Test_Builtin_Function_2 LIMIT 1;


--last_day()函数
SELECT last_day(date '2009-01-12') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT last_day(timestamp '2009-01-12') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT last_day('2008-02-22') FROM Test_Builtin_Function_2 LIMIT 1;


--minute()函数
SELECT minute(timestamp '2009-07-30 12:58:59') FROM Test_Builtin_Function_2 LIMIT 1;

SELECT minute( '2009-07-30') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT minute(timestamp '2009-07-30 12:68:59') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT minute( '2009-07-30 12:58:59') FROM Test_Builtin_Function_2 LIMIT 1;


--MONTH()函数
SELECT MONTH(timestamp '2009-07-30 12:28:59') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT MONTH(date '2009-07-30') FROM Test_Builtin_Function_2 LIMIT 1;

SELECT MONTH(date '2009-07-30 12:28:59') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT MONTH('2009-07-30 12:28:59') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT MONTH('2009-07-30') FROM Test_Builtin_Function_2 LIMIT 1;


--months_BETWEEN()函数
SELECT months_BETWEEN(DATE '1997-02-28',DATE '1996-02-28') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT months_BETWEEN(timestamp '1997-02-28 11:11:11' ,DATE '1996-02-28') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT months_BETWEEN(timestamp '1997-02-28 11:11:11',timestamp '1997-02-28 11:11:10') FROM Test_Builtin_Function_2 LIMIT 1;

SELECT months_BETWEEN('1997-02-28', '1996-02-28') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT months_BETWEEN('1997-02-28 11:11:11','1997-02-28 11:11:10') FROM Test_Builtin_Function_2 LIMIT 1;


--NEXT_DAY()函数
SELECT NEXT_DAY(DATE '2020-06-08', 'TU') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT NEXT_DAY(DATE '2020-06-08', 'TU') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT NEXT_DAY(DATE '2020-06-08', 'SUNDAY') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT NEXT_DAY(DATE '2020-06-08', 'SUNDAY') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT NEXT_DAY(DATE '2020-06-08', 'monday') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT NEXT_DAY(DATE '2020-06-08', 'wednesday') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT NEXT_DAY(DATE '2020-06-08', 'thursday') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT NEXT_DAY(DATE '2020-06-08', 'saturday') FROM Test_Builtin_Function_2 LIMIT 1;


--second()函数
SELECT second('2009-07-30 12:58:59') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT second(date '2009-07-30') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT second(timestamp '2009-07-30 12:58:44') FROM Test_Builtin_Function_2 LIMIT 1;


--trunc()函数
SELECT trunc(date '2009-02-12', 'yyyy') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT trunc(date '2009-02-12', 'yy') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT trunc(date '2009-02-12', 'mon') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT trunc(date '2009-02-12', 'month') FROM Test_Builtin_Function_2 LIMIT 1;

SELECT trunc(timestamp '2009-02-12 01:02:03', 'yyyy') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT trunc(timestamp '2009-02-12 01:02:03', 'yy') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT trunc(timestamp '2009-02-12 01:02:03', 'mon') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT trunc(timestamp '2009-02-12 01:02:03', 'month') FROM Test_Builtin_Function_2 LIMIT 1;

SELECT trunc(date '2009-02-12', 'day') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT trunc(timestamp '2009-02-12 00:02:33', 'day') FROM Test_Builtin_Function_2 LIMIT 1;


--unix_timestamp()函数
SELECT unix_timestamp(date '2019-02-22') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT unix_timestamp(date '2019-02-22','yyyymmdd') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT unix_timestamp(date '2019-02-22','rrrrmmdd') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT unix_timestamp(timestamp '2019-02-03 21:22:11') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT unix_timestamp(0) FROM Test_Builtin_Function_2 LIMIT 1;
SELECT unix_timestamp('2018-09-01') FROM Test_Builtin_Function_2 LIMIT 1;


--weekofyear()函数
SELECT weekofyear('2008-02-20 00:00:21') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT weekofyear(timestamp '2008-02-20 00:00:21') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT weekofyear('2008-02-20') FROM Test_Builtin_Function_2 LIMIT 1;

SELECT weekofyear(date '2008-02-20 00:00:21') FROM Test_Builtin_Function_2 LIMIT 1;


--year()函数
SELECT year(date '2009-07-30') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT year(timestamp '2019-07-30 12:28:29') FROM Test_Builtin_Function_2 LIMIT 1;

SELECT year('2009-07-30 12:21:11') FROM Test_Builtin_Function_2 LIMIT 1;
SELECT year('2009-07-30') FROM Test_Builtin_Function_2 LIMIT 1;

