--Description: doc 11 chapter view
--Date：2020-07-13
--Author：满意
drop table EMP if exists cascade;
drop table DEPT if exists cascade;

CREATE TABLE EMP (EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17'
,'yyyy-mm-dd'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20'
,'yyyy-mm-dd'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2'
,'yyyy-mm-dd'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,TO_DATE('1981-4-2'
,'yyyy-mm-dd'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('1981-9-28'
,'yyyy-mm-dd'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,TO_DATE('1981-5-1'
,'yyyy-mm-dd'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,TO_DATE('1981-6-9'
,'yyyy-mm-dd'),2450,NULL,10);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,TO_DATE('1981-11-17'
,'yyyy-mm-dd'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,TO_DATE('1981-9-8'
,'yyyy-mm-dd'),1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,TO_DATE('1981-12-3'
,'yyyy-mm-dd'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,TO_DATE('1981-12-3'
,'yyyy-mm-dd'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,TO_DATE('1982-1-23'
,'yyyy-mm-dd'),1300,NULL,10);

CREATE TABLE DEPT (DEPTNO INT,DNAME VARCHAR(20),LOC VARCHAR(20));
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

drop view EMP_30 if exists;

CREATE VIEW EMP_30
AS SELECT EMPNO
,ENAME
,SAL
FROM EMP
WHERE DEPTNO = 30;

SELECT * FROM EMP_30 order by EMPNO;

drop view EMP_DEPT if exists;

CREATE VIEW EMP_DEPT
AS SELECT e.EMPNO
,e.ENAME
,e.JOB
,e.SAL
,e.COMM
,e.DEPTNO
,d.DNAME
,d.LOC
FROM EMP e
INNER JOIN DEPT d
ON e.DEPTNO = d.DEPTNO;

SELECT * FROM EMP_DEPT order by EMPNO;


drop view EMP_RENAME if exists;

CREATE VIEW EMP_RENAME
AS SELECT EMPNO E_NO
,DEPTNO D_NO
,ENAME E_NAME
,SAL E_SAL
FROM EMP
WHERE DEPTNO = 20;

SELECT * FROM EMP_RENAME order by E_NO;


drop view EMP_SAL if exists;

CREATE VIEW EMP_SAL
AS SELECT DEPTNO AS DEPT_NO
,SUM (SAL) AS SAL_TOTAL
,AVG (SAL) AS SAL_AVG
,MAX (SAL) AS SAL_MAX
,MIN (SAL) AS SAL_MIN
FROM EMP
GROUP BY DEPTNO;

SELECT * FROM EMP_SAL order by DEPT_NO;



drop view EMP_SAL2 if exists;

CREATE VIEW EMP_SAL2
AS SELECT DEPTNO AS DEPT_NO
,SUM (SAL) AS SAL_TOTAL
,AVG (SAL) AS SAL_AVG
,MAX (SAL) AS SAL_MAX
,MIN (SAL) AS SAL_MIN
FROM emp
GROUP BY DEPTNO
HAVING AVG(SAL) < 2000 ;

SELECT * FROM EMP_SAL2 order by DEPT_NO;


