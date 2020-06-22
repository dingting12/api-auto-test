set echo on

-- 清空环境
drop table t_subquery  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_subquery (
EMPNO INT default 1,
ENAME VARCHAR(20) not null,
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

CREATE TABLE IF NOT EXISTS t_sink (
EMPNO INT ,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);


-- 插入数据
INSERT INTO t_subquery  VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO t_subquery  VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO t_subquery  VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30);

insert into t_sink select * from t_subquery;

select * from t_sink order by empno;