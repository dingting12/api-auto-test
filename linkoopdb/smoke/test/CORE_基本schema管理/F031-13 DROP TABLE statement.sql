set echo on

-- 清空环境
drop table t_drop_RESTRICT  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_drop_RESTRICT (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

drop table t_drop_RESTRICT RESTRICT;

select * from t_drop_RESTRICT;