-- 清空环境
drop table t_Comparison  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_Comparison (EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

-- 插入数据
INSERT INTO t_Comparison VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO t_Comparison VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO t_Comparison VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30);
INSERT INTO t_Comparison VALUES (7566,'JONES','MANAGER',7839,TO_DATE('1981-4-2','yyyy-mm-dd'),2975,NULL,20);
INSERT INTO t_Comparison VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('1981-9-28','yyyy-mm-dd'),1250,1400,30);
INSERT INTO t_Comparison VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('1981-9-28','yyyy-mm-dd'),1250,1400,30);

select * from t_Comparison where empno>7500 order by empno;

select * from t_Comparison where empno<7500 order by empno;

select * from t_Comparison where empno>=7500 order by empno;

select * from t_Comparison where empno<=7500 order by empno;

select * from t_Comparison where empno<>7500 order by empno;

select * from t_Comparison where empno!=7500 order by empno;