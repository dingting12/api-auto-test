set echo on

-- 清空环境
drop table t_Rename  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_Rename (EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

-- 插入数据
INSERT INTO t_Rename VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);

select name from (select ename as name  from t_Rename);