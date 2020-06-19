-- 清空环境
drop table t_comparison  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_comparison (EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

-- 插入数据
INSERT INTO t_comparison VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO t_comparison VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO t_comparison VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30);


select * from t_comparison where empno = any (select empno from t_comparison where ename like '%A%') order by empno;

select * from t_comparison where empno = some (select empno from t_comparison where ename like '%A%') order by empno;

select * from t_comparison where empno = all (select empno from t_comparison where ename like '%A%') order by empno;

select * from t_comparison where empno <> any (select empno from t_comparison where ename like '%A%') order by empno;

select * from t_comparison where empno <> some (select empno from t_comparison where ename like '%A%') order by empno;

select * from t_comparison where empno <> all (select empno from t_comparison where ename like '%A%') order by empno;

select * from t_comparison where empno > any (select empno from t_comparison where ename like '%A%') order by empno;

select * from t_comparison where empno <= some (select empno from t_comparison where ename like '%A%') order by empno;

select * from t_comparison where empno >= all (select empno from t_comparison where ename like '%A%') order by empno;

select * from t_comparison where empno < all (select empno from t_comparison where ename like '%A%') order by empno;