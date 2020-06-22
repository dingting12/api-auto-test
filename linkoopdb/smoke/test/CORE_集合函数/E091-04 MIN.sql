set echo on
-- 清空环境
drop table t_min IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_min (EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

-- 插入数据
INSERT INTO t_min VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO t_min VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO t_min VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30);
INSERT INTO t_min VALUES (7566,'JONES','MANAGER',7839,TO_DATE('1981-4-2','yyyy-mm-dd'),2975,NULL,20);
INSERT INTO t_min VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('1981-9-28','yyyy-mm-dd'),1250,1400,30);

-- 统计员工最低工资
select min(sal) from t_min;

-- 以job分组后，统计员工最低工资
select * from (select min(sal)  min from t_min group by JOB) order by min;