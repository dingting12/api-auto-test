set echo on
-- 清空环境
drop view v1 IF  EXISTS;
drop table t_view_RESTRICT  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_view_RESTRICT (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);


-- 插入数据
INSERT INTO t_view_RESTRICT  VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO t_view_RESTRICT  VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO t_view_RESTRICT  VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30);

create view v1 as select * from t_view_RESTRICT;

drop view v1 RESTRICT;

select * from v1;