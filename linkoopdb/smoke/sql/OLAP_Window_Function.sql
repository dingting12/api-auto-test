--    Description: 测试olap window function
--    Date:         2020-06-16
--    Author:       丁婷

-- 74 LDBX070-12 window函数row_number()
DROP TABLE T_ROW_NUMBER_001 IF EXISTS CASCADE;

CREATE TABLE T_ROW_NUMBER_001 (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

INSERT INTO T_ROW_NUMBER_001 VALUES 
(7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30),
(7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1260,500,30),
(7566,'JONES','MANAGER',7839,TO_DATE('1981-4-2','yyyy-mm-dd'),2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,TO_DATE('1981-9-28','yyyy-mm-dd'),1250,1400,30),
(7698,'BLAKE','MANAGER',7839,TO_DATE('1981-5-1','yyyy-mm-dd'),2850,NULL,30),
(7782,'CLARK','MANAGER',7839,TO_DATE('1981-6-9','yyyy-mm-dd'),2450,NULL,10),
(7839,'KING','PRESIDENT',NULL,TO_DATE('1981-11-17','yyyy-mm-dd'),5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,TO_DATE('1981-9-8','yyyy-mm-dd'),1500,0,30),
(7900,'JAMES','CLERK',7698,TO_DATE('1981-12-3','yyyy-mm-dd'),950,NULL,30),
(7902,'FORD','ANALYST',7566,TO_DATE('1981-12-3','yyyy-mm-dd'),3000,NULL,20),
(7934,'MILLER','CLERK',7782,TO_DATE('1982-1-23','yyyy-mm-dd'),1300,NULL,10);

SELECT DEPTNO, SAL,ROW_NUMBER() OVER(PARTITION BY empno ORDER BY comm DESC) RW FROM T_ROW_NUMBER_001 order by DEPTNO,SAL;



--测试298 T610 Window Functions 
drop table T_Window_Functions_001 if exists cascade;

create table T_Window_Functions_001 (
depname varchar(100), 
empno int, 
salary double
);

insert into T_Window_Functions_001 values
('develop' , 11 , 5200),
('develop' , 7 , 4200),
('develop' , 9 , 4500),
('develop' , 8 , 6000),
('develop' , 10 , 5200),
('personnel' , 5 , 3500),
('personnel' , 2 , 3900),
('sales' , 3 , 4800),
('sales' , 1 , 5000),
('sales' , 4 , 4800);
 
SELECT depname, empno, salary, 
      AVG(salary) OVER (PARTITION BY depname ) AS c1,
	SUM(salary) OVER (PARTITION BY depname ) AS c2,
	MIN(salary) OVER (PARTITION BY depname ) AS c3,
	MAX(salary) OVER (PARTITION BY depname ) AS c4
FROM T_Window_Functions_001
ORDER BY depname, empno, salary, c1, c2, c3, c4;

 
SELECT  depname, empno, salary, 
dense_rank() OVER (PARTITION BY depname order by empno) c1 
FROM T_Window_Functions_001 
order by depname, empno, salary,c1;
 
SELECT depname, CUME_DIST() OVER (PARTITION BY depname order by empno) c1 
FROM T_Window_Functions_001 
order by depname,c1;
 
SELECT depname, PERCENT_RANK() OVER (PARTITION BY depname order by empno) c1 
FROM T_Window_Functions_001 
order by depname,c1;
 
 SELECT depname, NTILE(4) OVER (PARTITION BY depname order by empno) c1 
 FROM T_Window_Functions_001 
 order by depname,c1;
 
 SELECT depname, empno, salary, rank() OVER (PARTITION BY depname ORDER BY salary DESC) c1 
 FROM T_Window_Functions_001 
 order by depname, empno, salary,c1;
 

--测试304 T614 NTILE function
SELECT depname, NTILE(4) OVER (PARTITION BY depname order by empno) c1 
FROM T_Window_Functions_001 
order by depname,c1;

SELECT deptno,ename||' '||job e_name,sal,
NTILE(4) OVER (PARTITION BY deptno ORDER BY sal DESC) AS quartile
FROM T_ROW_NUMBER_001 order by deptno,e_name,quartile,sal,quartile;

--测试305 T615 LEAD and LAG functions
 DROP TABLE T_Window_Functions_002 IF EXISTS  CASCADE;
 
CREATE TABLE if not exists T_Window_Functions_002(
      name varchar(50),
      grade INT,
      mark NUMERIC(4,1),
      sort INT
 );

INSERT INTO T_Window_Functions_002 VALUES
('a1',1,90,1),
('b1',1,82,2),
('c1',1,60,3),
('d1',1,15,4),
('a2',2,86,1),
('b2',2,65,2),
('c2',2,45,3),
('a3',3,95,1),
('b3',3,78,2),
('c3',3,45,3);

SELECT name,grade,mark,
LEAD(mark,2) OVER(PARTITION BY GRADE ORDER BY mark) LAST_mark 
FROM T_Window_Functions_002
ORDER BY GRADE,MARK;

SELECT name,grade,mark,
LAG(mark,2) OVER(PARTITION BY GRADE ORDER BY mark) LAST_mark 
FROM T_Window_Functions_002
ORDER BY GRADE,MARK;
									  
--测试306 T616 Null treatment option for LEAD and LAG functions
 DROP TABLE T_Window_Functions_003 IF EXISTS CASCADE;
 
CREATE TABLE  if not exists T_Window_Functions_003(
      name varchar(50),
      grade INT,
      mark NUMERIC(4,1),
      sort INT
);
 
INSERT INTO T_Window_Functions_003 VALUES
('a1',1,null,1),
('b1',1,null,2),
('c1',1,60,3),
('d1',1,15,4),
('a2',2,86,1),
('b2',2,65,2),
('c2',2,45,3),
('a3',3,95,1),
('b3',3,78,2),
('c3',3,45,3);

SELECT name,grade,mark,
LEAD(mark,2) OVER(PARTITION BY GRADE ORDER BY name,mark) LAST_mark 
FROM T_Window_Functions_003
ORDER BY GRADE,MARK;

SELECT name,grade,mark,
LAG(mark,2) OVER(PARTITION BY GRADE ORDER BY name,mark) LAST_mark 
FROM T_Window_Functions_003
ORDER BY GRADE,MARK;

--655 T611 Elementary OLAP operations
SELECT name,grade,mark,avg(sort) 
  OVER (PARTITION BY grade) as avg_sort
  FROM T_Window_Functions_002
  ORDER BY mark,name,grade;
  
--656 T612 Advanced OLAP operations
SELECT name, grade, mark, 
dense_rank() OVER (PARTITION BY grade order by mark DESC) as dr 
FROM T_Window_Functions_002 
order by grade, dr,name,mark desc;

--657 T613 Sampling 
  select * from T_Window_Functions_002 
  tablesample bernoulli(0.0)
  ORDER BY GRADE ASC,MARK ASC;
  
--658 T617 FIRST_VALUE and LAST_VALUE functions
DROP TABLE T_Window_Functions_004 IF EXISTS CASCADE;
 
CREATE TABLE T_Window_Functions_004(
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

INSERT INTO T_Window_Functions_004 VALUES
(1,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20),
(1,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1500,300,30),
(1,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30),
(2,'JONES','MANAGER',7839,TO_DATE('1981-4-2','yyyy-mm-dd'),3000,NULL,20),
(2,'MARTIN','SALESMAN',7698,TO_DATE('1981-9-28','yyyy-mm-dd'),1250,1400,30),
(2,'BLAKE','MANAGER',7839,TO_DATE('1981-5-1','yyyy-mm-dd'),2450,NULL,30),
(2,'CLARK','MANAGER',7839,TO_DATE('1981-6-9','yyyy-mm-dd'),2450,NULL,10),
(3,'KING','PRESIDENT',NULL,TO_DATE('1981-11-17','yyyy-mm-dd'),5000,NULL,10),
(3,'TURNER','SALESMAN',7698,TO_DATE('1981-9-8','yyyy-mm-dd'),1500,0,30),
(3,'JAMES','CLERK',7698,TO_DATE('1981-12-3','yyyy-mm-dd'),950,NULL,30),
(3,'FORD','ANALYST',7566,TO_DATE('1981-12-3','yyyy-mm-dd'),3000,NULL,20),
(3,'MILLER','CLERK',7782,TO_DATE('1982-1-23','yyyy-mm-dd'),4000,NULL,10);
 
SELECT EMPNO,ENAME,SAL,
LAST_VALUE(SAL) 
OVER (PARTITION BY EMPNO ORDER BY SAL DESC ROWS BETWEEN 1 following and 2 following) LAST_SAL 
FROM T_Window_Functions_004 
order by EMPNO,ENAME,SAL;

--660 T619 Nested window functions
SELECT empno,ename,hiredate,sal,
AVG(sal) OVER (PARTITION BY empno ORDER BY hiredate) avg_sal_hiredate,
sum(sal) OVER (PARTITION BY empno) sum_sal_order, 
AVG(sal) OVER (PARTITION BY empno ORDER BY hiredate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) avg1, 
count(sal) OVER (PARTITION BY empno ORDER BY hiredate RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) count1
FROM T_Window_Functions_004 order by empno,ename,hiredate,sal;

--736 LDBX043-05 聚集函数REGXXX
DROP TABLE T_Window_Functions_005 IF EXISTS CASCADE;

CREATE TABLE T_Window_Functions_005 (
sals INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
DEPTNO INT
);

INSERT INTO T_Window_Functions_005 VALUES 
(34,'SMTH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),28,30),
(66,'SMTH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),99,20),
(12,'MITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),5,20),
(964,'MITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,30),
(964,'JAKE','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),310,10),
(964,'TOM','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),58900,60),
(9064,'BOB','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,60);
 
 SELECT DEPTNO, ENAME,
COVAR_POP(sals,sal) AS covar_pop,
COVAR_POP(sals,sals) AS covar_pop1,
COVAR_POP(sal,sals) AS covar_pop2,
COVAR_SAMP(sal,sal) AS covar_samp1
    FROM T_Window_Functions_005
    GROUP BY DEPTNO,ENAME
    ORDER BY DEPTNO,ENAME DESC;
	
	SELECT DEPTNO,
REGR_SLOPE(sals,sal) slope1,
REGR_SLOPE(sals,sals) slope2,
REGR_INTERCEPT(sal,sals) intercept1,
REGR_INTERCEPT(sal,sal) intercept2
   FROM T_Window_Functions_005
   WHERE DEPTNO in (20,30)
    GROUP BY DEPTNO
    ORDER BY DEPTNO DESC;
--2246 T612-01 Named Window
drop table T_Window_Functions_006 if exists cascade;

create table T_Window_Functions_006 (depname varchar(100), empno int, salary double);

insert into T_Window_Functions_006 values(
 ('develop' , 11 , 5200),
 ('develop' , 7 , 4200),
 ('develop' , 9 , 4500),
 ('develop' , 8 , 6000),
 ('develop' , 10 , 5200),
 ('personnel' , 5 , 3500),
 ('personnel' , 2 , 3900),
 ('sales' , 3 , 4800),
 ('sales' , 1 , 5000),
 ('sales' , 4 , 4800));
 
SELECT depname, empno, salary, avg(salary) OVER w1 as c1, sum(salary) OVER w2 as c2,
min(salary) OVER w3 as c3, max(salary) OVER w4 as c4 FROM T_Window_Functions_006 order by depname, empno, salary,c1,c2,c3,c4
WINDOW w1 AS (PARTITION BY depname),w2 AS (PARTITION BY depname),w3 AS (PARTITION BY depname),w4 AS (PARTITION BY depname);
