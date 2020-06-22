--Description:OLAP函数补充测试用例
--Date：2020-06-22
--Author：贾路遥

set echo on
set timing on

--数据准备
DROP TABLE Test_Window_Fun_4 IF EXISTS;
create table Test_Window_Fun_4 (com varchar(20),depname varchar(100), empno int, salary double);

insert into Test_Window_Fun_4 values(
 ('BAIDU','develop' , 11 , 5200),
 ('BAIDU','develop' , 7 , 4200),
 ('BAIDU','develop' , 9 , 4500),
 ('ALI','develop' , 8 , 6000),
 ('ALI','develop' , 10 , 5200),
 ('ALI','personnel' , 5 , 3500),
 ('GOOGLE','personnel' , 2 , 3900),
 ('GOOGLE','sales' , 3 , 4800),
 ('GOOGLE','sales' , 1 , 5000),
 ('BAIDU','sales' , 4 , 4800),
 ('ALI','sales' , 4 , NULL)
);

--排序函数
--rank()
SELECT 
    rank() OVER(PARTITION BY depname ORDER BY salary ),
	depname,salary
FROM Test_Window_Fun_4 ;

--报错，oracle支持
SELECT 
	com,
	depname,
	rank() OVER(PARTITION BY depname ORDER BY salary DESC NULLS LAST) AS c1,
	salary
FROM Test_Window_Fun_4;

--报错，oracle支持
SELECT 
	com,
	depname,
	rank() OVER(PARTITION BY depname ORDER BY salary DESC NULLS FIRST ) AS c1,
	salary
FROM Test_Window_Fun_4 ORDER BY c1;

--rank,order by
SELECT 
  depname, 
  empno, 
  salary, 
  rank() OVER (PARTITION BY depname ORDER BY salary DESC) c1 
FROM Test_Window_Fun_4 
order by depname, empno, salary,c1;

--异常测试
--ROWS between unbounded preceding and current row
SELECT 
	com,
	depname,
	rank() OVER(PARTITION BY depname ORDER BY salary DESC ROWS between unbounded preceding and current row )
FROM Test_Window_Fun_4;

--ROWS between unbounded preceding and UNBOUNDED FOLLOWING,rank()
SELECT 
	com,
	depname,
	rank() OVER(PARTITION BY depname,com ORDER BY salary DESC ROWS between unbounded preceding and UNBOUNDED FOLLOWING  )
FROM Test_Window_Fun_4;


--DENSE_RANK()
SELECT  
	depname, 
	empno, 
	salary,
	dense_rank() OVER (PARTITION BY depname order by empno) c1 
FROM Test_Window_Fun_4 
order by depname, empno, salary,c1;

SELECT 
    DENSE_RANK() OVER(PARTITION BY depname ORDER BY salary ),
	depname,salary
FROM Test_Window_Fun_4 ;


--row_number()
SELECT 
  depname, 
  row_number()
FROM Test_Window_Fun_4;

--函数row_number,partition,order
SELECT 
	depname,
	row_number() OVER (PARTITION BY depname order by empno) c1 
FROM Test_Window_Fun_4 
order by depname,c1;


--lag(),lead()
--offset为1，default为0
SELECT 
	depname,salary,
	lag(salary,1,0) OVER (PARTITION BY depname ORDER BY salary),
	lead(salary,1,0) OVER (PARTITION BY depname ORDER BY salary)
FROM Test_Window_Fun_4;

--offset为1，default为null
SELECT 
	depname,salary,
	lag(salary,1) OVER (PARTITION BY depname ORDER BY salary),
	lead(salary,1) OVER (PARTITION BY depname ORDER BY salary)
FROM Test_Window_Fun_4;

--offset为0，default为null
SELECT 
	depname,salary,
	lag(salary,0) OVER (PARTITION BY depname ORDER BY salary),
	lead(salary,0) OVER (PARTITION BY depname ORDER BY salary)
FROM Test_Window_Fun_4;

--offset为-1，default为null
SELECT 
	depname,salary,
	lag(salary,-1) OVER (PARTITION BY depname ORDER BY salary),
	lead(salary,-1) OVER (PARTITION BY depname ORDER BY salary)
FROM Test_Window_Fun_4;

--嵌套使用
SELECT depname,salary,empno,lastsal,salary-lastsal AS addsal FROM 
(SELECT 
	depname,salary,
	empno,
	lead(salary,1) OVER (PARTITION BY depname ORDER BY salary) AS lastsal
FROM Test_Window_Fun_4) ORDER BY empno;

--异常测试
--null,oracle报错
SELECT 
	depname,salary,
	lag(salary,12,'lag') OVER (PARTITION BY depname ORDER BY salary),
	lead(salary,12,'lead') OVER (PARTITION BY depname ORDER BY salary)
FROM Test_Window_Fun_4;


--FIRST_VALUE()，LAST_VALUE()
--FIRST_VALUE()
SELECT 
	depname,empno,
	SUM(salary), 
	FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(salary) DESC) 
FROM Test_Window_Fun_4 
GROUP BY depname,empno 
ORDER BY depname,empno;

--LAST_VALUE()
select 
  depname,empno,salary, LAST_VALUE(empno) OVER (partition by depname order by salary desc) as highest_sal_name 
from Test_Window_Fun_4 order by depname,empno;

--FIRST_VALUE(SUM(salary))
SELECT 
	depname,  SUM(salary), FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(salary)) 
FROM Test_Window_Fun_4  GROUP BY depname ORDER BY depname;

--FIRST_VALUE()
SELECT 
	depname,
	empno, 
	SUM(salary),
	FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(salary) ) 
FROM Test_Window_Fun_4 
GROUP BY depname,empno 
ORDER BY depname,empno;

--FIRST_VALUE(),LAST_VALUE()
select 
  depname,empno,salary,
  SUM(salary) AS sums,
  FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(salary) ) AS c1 ,
  LAST_VALUE(empno) OVER (partition by depname order by nvl(salary,0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_sal_name 
from Test_Window_Fun_4 GROUP BY depname,empno,salary order by depname,salary;


--VAR_POP(),VAR_SAMP()
select 
  VAR_POP(salary) OVER (PARTITION BY depname) AS c2,
  VAR_SAMP(salary) OVER (PARTITION BY depname) AS c3
from Test_Window_Fun_4 WHERE depname='develop';


--CUME_DIST()
SELECT 
	depname, 
	CUME_DIST() OVER (PARTITION BY depname order by empno) c1 
FROM Test_Window_Fun_4 
order by depname,c1;

--CUME_DIST()
SELECT 
  empno,
  CUME_DIST() OVER (PARTITION BY depname order by nvl(salary,0) ) 
FROM Test_Window_Fun_4 
ORDER BY empno;


--NTILE
SELECT 
	depname,
	NTILE(4) OVER (PARTITION BY depname order by empno) c1 
FROM Test_Window_Fun_4 
order by depname,c1;

--NTILE()不支持参数为表达式
select 
  depname,empno,NVL(salary,0),
  NTILE(3.1415) OVER (PARTITION BY depname order by nvl(salary,0)) AS c3,
from Test_Window_Fun_4  order by depname,salary;

--NTILE(3)
select 
depname,empno,NVL(salary,0),
NTILE(3) OVER (PARTITION BY depname order by nvl(salary,0)) AS c3
from Test_Window_Fun_4  order by depname,salary;

--NTILE(0)
select 
depname,empno,NVL(salary,0),
NTILE(0) OVER (PARTITION BY depname order by salary) AS c3
from Test_Window_Fun_4  order by depname,salary;

--NTILE(10000)
select 
  depname,empno,NVL(salary,0),
  NTILE(10000) OVER (PARTITION BY depname order by salary) AS c3
from Test_Window_Fun_4  order by depname,salary;


--组合OLAP函数
--FIRST_VALUE(),LAST_VALUE(),VAR_POP(),VAR_SAMP()
select 
  depname,empno,NVL(salary,0),
  SUM(NVL(salary,0)) AS sums,
  FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(salary) ) AS c1 ,
  LAST_VALUE(empno) OVER (partition by depname order by nvl(salary,0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_sal_name,
  VAR_POP(salary) OVER (PARTITION BY depname) AS c2,
  VAR_SAMP(salary) OVER (PARTITION BY depname) AS c3
from Test_Window_Fun_4 GROUP BY depname,empno,salary order by depname,salary;

--FIRST_VALUE(),LAST_VALUE(),VAR_POP(),VAR_SAMP()
select 
  depname,empno,NVL(salary,0),
  SUM(NVL(salary,0)) AS sums,
  FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(NVL(salary,0)) ) AS c1 ,
  LAST_VALUE(empno) OVER (partition by depname order by nvl(salary,0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_sal_name,
  VAR_POP(salary) OVER (PARTITION BY depname) AS c2,
  VAR_SAMP(salary) OVER (PARTITION BY depname) AS c3
from Test_Window_Fun_4 GROUP BY depname,empno,salary order by depname,salary;

--FIRST_VALUE(),LAST_VALUE(),VAR_POP(),VAR_SAMP(),STDDEV_POP(),STDDEV_SAMP()
select 
depname,empno,NVL(salary,0),
SUM(NVL(salary,0)) AS sums,
FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(NVL(salary,0)) ) AS c1 ,
LAST_VALUE(empno) OVER (partition by depname order by nvl(salary,0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_sal_name,
VAR_POP(salary) OVER (PARTITION BY depname) AS c2,
VAR_SAMP(salary) OVER (PARTITION BY depname) AS c3,
STDDEV_POP(salary) OVER (PARTITION BY depname) AS c4,
STDDEV_SAMP(salary) OVER (PARTITION BY depname) AS c5
from Test_Window_Fun_4 GROUP BY depname,empno,salary order by depname,salary;

--FIRST_VALUE(),LAST_VALUE(),VAR_POP(),VAR_SAMP(),STDDEV_POP(),STDDEV_SAMP()
select 
depname,empno,NVL(salary,0),
SUM(NVL(salary,0)) AS sums,
FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(NVL(salary,0))) AS c1 ,
LAST_VALUE(empno) OVER (partition by depname order by nvl(salary,0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_sal_name,
VAR_POP(salary) OVER (PARTITION BY depname) AS c2,
VAR_SAMP(salary) OVER (PARTITION BY depname) AS c3,
STDDEV_POP(salary) OVER (PARTITION BY depname) AS c4,
STDDEV_SAMP(salary) OVER (PARTITION BY depname) AS c5
from (SELECT * FROM Test_Window_Fun_4 WHERE depname='develop') GROUP BY depname,empno,salary order by depname,salary;

--FIRST_VALUE(),LAST_VALUE(),CUME_DIST(),STDDEV_POP(),STDDEV_SAMP()
select 
depname,empno,NVL(salary,0),
SUM(NVL(salary,0)) AS sums,
FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(NVL(salary,0))) AS c1 ,
LAST_VALUE(empno) OVER (partition by depname order by nvl(salary,0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_sal_name,
CUME_DIST() OVER (PARTITION BY depname order by nvl(salary,0) ) AS c2,
STDDEV_POP(salary) OVER (PARTITION BY depname) AS c4,
STDDEV_SAMP(salary) OVER (PARTITION BY depname) AS c5
from (SELECT * FROM Test_Window_Fun_4 WHERE depname='develop') GROUP BY depname,empno,salary order by depname,salary;

--FIRST_VALUE(),LAST_VALUE(),CUME_DIST(),STDDEV_POP(),STDDEV_SAMP()
select 
depname,empno,NVL(salary,0),
SUM(NVL(salary,0)) AS sums,
FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(NVL(salary,0))) AS c1 ,
LAST_VALUE(empno) OVER (partition by depname order by nvl(salary,0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_sal_name,
CUME_DIST() OVER (PARTITION BY depname order by nvl(salary,0) ) AS c2,
STDDEV_POP(salary) OVER (PARTITION BY depname) AS c4,
STDDEV_SAMP(salary) OVER (PARTITION BY depname) AS c5
from Test_Window_Fun_4 GROUP BY depname,empno,salary order by depname,salary;

--FIRST_VALUE(),LAST_VALUE(),CUME_DIST()
select 
depname,empno,NVL(salary,0),
SUM(NVL(salary,0)) AS sums,
LAST_VALUE(empno) OVER (partition by depname order by nvl(salary,0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_sal_name,
FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(NVL(salary,0))),
CUME_DIST() OVER (PARTITION BY depname order by nvl(salary,0) ) AS c2
from Test_Window_Fun_4 GROUP BY depname,empno,salary order by depname,salary;

--FIRST_VALUE(),LAST_VALUE(),NTILE(),STDDEV_POP(),STDDEV_SAMP()
select 
depname,empno,NVL(salary,0),
SUM(NVL(salary,0)) AS sums,
FIRST_VALUE(SUM(salary)) OVER (PARTITION BY depname ORDER BY SUM(NVL(salary,0))) AS c1 ,
LAST_VALUE(empno) OVER (partition by depname order by nvl(salary,0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as highest_sal_name,
NTILE(3) OVER (PARTITION BY depname order by nvl(salary,0)) AS c3,
STDDEV_POP(salary) OVER (PARTITION BY depname) AS c4,
STDDEV_SAMP(salary) OVER (PARTITION BY depname) AS c5
from (SELECT * FROM Test_Window_Fun_4 WHERE depname='develop') GROUP BY depname,empno,salary order by depname,salary;


--线性回归函数
--数据准备
DROP TABLE regr_test IF EXISTS ;
CREATE TABLE regr_test (sals INT, ENAME VARCHAR(20), JOB VARCHAR(20), MGR INT, HIREDATE DATE, SAL INT, DEPTNO INT);

INSERT INTO regr_test VALUES (34,'SMTH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),28,30); 
INSERT INTO regr_test VALUES (66,'SMTH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),99,20); 
INSERT INTO regr_test VALUES (12,'MITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),5,20); 
INSERT INTO regr_test VALUES (964,'MITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,30); 
INSERT INTO regr_test VALUES (964,'JAKE','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),310,10); 
INSERT INTO regr_test VALUES (964,'TOM','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),58900,60);
INSERT INTO regr_test VALUES (9064,'BOB','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,60);

--REGR_SLOPE
SELECT 
  DEPTNO, REGR_SLOPE(sals,sal) slope1, REGR_SLOPE(sals,sals) slope2    
FROM regr_test    
GROUP BY DEPTNO   
ORDER BY DEPTNO DESC;

--REGR_SLOPE
SELECT
  DEPTNO, 
  REGR_SLOPE(sals,sal) OVER (PARTITION BY DEPTNO,ENAME ORDER BY sals ) slope1, 
  REGR_SLOPE(sals,sals) OVER (PARTITION BY DEPTNO ORDER BY sal ) slope2,
  REGR_SLOPE(null,sals) OVER (PARTITION BY DEPTNO ORDER BY sal ) slope3,
   REGR_SLOPE(sal,null) OVER (PARTITION BY DEPTNO ORDER BY sal ) slope4
FROM regr_test    
ORDER BY DEPTNO DESC;

--REGR_SLOPE
SELECT
  DEPTNO, 
  REGR_SLOPE(sals,sal) OVER (PARTITION BY DEPTNO,ENAME ORDER BY sals ) slope1, 
  REGR_SLOPE(sals,sals) OVER (PARTITION BY DEPTNO ORDER BY sal ) slope2
FROM regr_test    
ORDER BY DEPTNO DESC;

--REGR_SLOPE
SELECT
  DEPTNO, 
  REGR_SLOPE(sals,sal) OVER (PARTITION BY DEPTNO ORDER BY sals ) slope1, 
  REGR_SLOPE(sals,sals) OVER (PARTITION BY DEPTNO ORDER BY sal ) slope2
FROM regr_test    
ORDER BY DEPTNO DESC;

--REGR_SLOPE
SELECT
  DEPTNO, 
  REGR_SLOPE( sal, ( YEAR( NOW() ) - YEAR( HIREDATE ) ) )over(PARTITION BY DEPTNO)
FROM regr_test    
ORDER BY DEPTNO DESC;

--REGR_SXX()
SELECT
  DEPTNO, 
  REGR_SXX(sal,( YEAR( NOW() ) - YEAR( HIREDATE ) ) )over(PARTITION BY DEPTNO) REGR_SXX1, 
  REGR_SXX(( YEAR( NOW() ) - YEAR( HIREDATE )), sal )over(PARTITION BY DEPTNO) REGR_SXX2
  FROM regr_test    
ORDER BY DEPTNO DESC;

--所有线性函数
SELECT
  DEPTNO, 
  REGR_SLOPE(sals,sal) OVER (PARTITION BY DEPTNO ) slope1, 
  REGR_SLOPE(sals,sals) OVER (PARTITION BY DEPTNO ) slope2,
   REGR_SLOPE(null,sals) OVER (PARTITION BY DEPTNO ) slope3,
  REGR_INTERCEPT(sal,sals) OVER (PARTITION BY DEPTNO) AS intercept1, 
  REGR_INTERCEPT(sal,sal) OVER (PARTITION BY DEPTNO) AS intercept2,
  REGR_INTERCEPT(sal,null) OVER (PARTITION BY DEPTNO) AS intercept3,
  REGR_COUNT(sals,sal) OVER (PARTITION BY DEPTNO) AS REGR_COUNT1, 
  REGR_COUNT(sals,sals) OVER (PARTITION BY DEPTNO) AS REGR_COUNT2,
  REGR_COUNT(null,null) OVER (PARTITION BY DEPTNO) AS REGR_COUNT3,
  REGR_R2(sals,sal) over(PARTITION BY DEPTNO) REGR_1,
  REGR_R2(sals,sals)over(PARTITION BY DEPTNO) REGR_2,
  REGR_R2(null,sals)over(PARTITION BY DEPTNO) REGR_3,
  REGR_AVGX(( YEAR( NOW() ) - YEAR( HIREDATE ) ) ,sal)over(PARTITION BY DEPTNO) REGR_AVGX1,
  REGR_AVGX(sal,( YEAR( NOW() ) - YEAR( HIREDATE ) ) )over(PARTITION BY DEPTNO) REGR_AVGX2,
  REGR_AVGX(sals,sals)over(PARTITION BY DEPTNO) REGR_AVGX3,
  REGR_AVGY(( YEAR( NOW() ) - YEAR( HIREDATE ) ) ,sal) over(PARTITION BY DEPTNO) REGR_AVGY1,
  REGR_AVGY(sal,( YEAR( NOW() ) - YEAR( HIREDATE ) ) ) over(PARTITION BY DEPTNO) REGR_AVGY2,
  REGR_AVGY(sal,sal)over(PARTITION BY DEPTNO) REGR_AVGY3 ,
  REGR_SXX(sal,( YEAR( NOW() ) - YEAR( HIREDATE ) ) )over(PARTITION BY DEPTNO) REGR_SXX1, 
  REGR_SXX(( YEAR( NOW() ) - YEAR( HIREDATE )), sal )over(PARTITION BY DEPTNO) REGR_SXX2,
  REGR_SXX(sal,sal)over(PARTITION BY DEPTNO) REGR_SXX3,
  REGR_SXY(( YEAR( NOW() ) - YEAR( HIREDATE ) ) ,sal)over(PARTITION BY DEPTNO) REGR_SXY1, 
  REGR_SXY(sal,( YEAR( NOW() ) - YEAR( HIREDATE ) ) )over(PARTITION BY DEPTNO) REGR_SXY2, 
  REGR_SXY(sal,sal)over(PARTITION BY DEPTNO) REGR_SXY3,
  REGR_SYY(sal,sal)over(PARTITION BY DEPTNO) REGR_SYY1, 
  REGR_SYY(sals,sal)over(PARTITION BY DEPTNO) REGR_SYY2,
  REGR_SYY(sals,( YEAR( NOW() ) - YEAR( HIREDATE ) ))over(PARTITION BY DEPTNO) REGR_SYY3,
  REGR_SYY(( YEAR( NOW() ) - YEAR( HIREDATE ) ),sal)over(PARTITION BY DEPTNO) REGR_SYY4
FROM regr_test    
ORDER BY DEPTNO DESC;