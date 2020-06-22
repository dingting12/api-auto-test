set echo on

-- 创建用户
drop user user IF  EXISTS cascade;

-- 清空环境
drop table test.t_grant_update_column IF  EXISTS;
drop schema test IF  EXISTS cascade;

create user user password '123456';


GRANT CHANGE_AUTHORIZATION TO user;

-- 创建库
create schema test;

-- 创建表
CREATE TABLE IF NOT EXISTS test.t_grant_update_column (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

-- 插入数据
INSERT INTO test.t_grant_update_column VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO test.t_grant_update_column VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO test.t_grant_update_column VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30);


GRANT select,UPDATE(empno) ON test.t_grant_update_column TO user;

connect user user password '123456';

update test.t_grant_update_column set empno=7380 where empno=7369;

select * from test.t_grant_update_column order by empno;

disconnect;