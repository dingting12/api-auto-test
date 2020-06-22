set echo on

-- 清空环境
drop table t_alter_cloumn_datatype  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_alter_cloumn_datatype (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);


show create table t_alter_cloumn_datatype;

alter table t_alter_cloumn_datatype alter column empno set data type smallint;

show create table t_alter_cloumn_datatype;