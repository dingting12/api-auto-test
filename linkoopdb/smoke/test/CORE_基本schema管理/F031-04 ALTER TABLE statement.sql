set echo on
-- 清空环境
drop table t_alter_column  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_alter_column (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

show create table t_alter_column;

alter table t_alter_column add column c1 int;

show create table t_alter_column;