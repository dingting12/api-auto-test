--    Description: 测试子查询
--    Date:         2020-06-10
--    Author:       丁婷

-- 测试402  F471  Scalar subquery values
drop table T_db_subquery_001 if exists cascade;

drop table T_db_subquery_002 if exists cascade;

CREATE TABLE T_db_subquery_001 (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

INSERT INTO T_db_subquery_001 VALUES 
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-2-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-2-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-4-2',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-9-28',1150,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-5-1',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-6-9',2450,NULL,10),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,0,30),
(7900,'JAMES','CLERK',7698,'1981-12-8',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-8',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);

CREATE TABLE T_db_subquery_002 (
DEPTNO INT,
DNAME VARCHAR(20),
LOC VARCHAR(20)
);

INSERT INTO T_db_subquery_002 VALUES 
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');


select
(select max(SAL) from T_db_subquery_001)       max_salary,
(select max(HIREDATE) from T_db_subquery_001)  max_hiredate
from T_db_subquery_001,(select dname from T_db_subquery_002 where deptno = 10) limit 1;

select count(*) from (
select sal, (select max(DEPTNO) from T_db_subquery_002)+1 from T_db_subquery_001 order by sal);