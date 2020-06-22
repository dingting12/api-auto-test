set echo on

-- 清空环境
drop table t_EXISTS  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_EXISTS (EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

select * from t_EXISTS order by empno;


