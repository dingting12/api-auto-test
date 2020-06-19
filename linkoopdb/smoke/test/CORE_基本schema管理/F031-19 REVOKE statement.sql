-- 创建用户
drop user user cascade;

-- 清空环境
drop table test.t_REVOKE  IF  EXISTS;

-- 创建用户
create user user password '123456';

-- 授予CHANGE_AUTHORIZATION权限
GRANT CHANGE_AUTHORIZATION TO user;

-- 创建库
create schema test;

-- 创建表
CREATE TABLE IF NOT EXISTS test.t_REVOKE (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);

-- 插入数据
INSERT INTO test.t_REVOKE VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO test.t_REVOKE VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO test.t_REVOKE VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30);


GRANT SELECT ON test.t_REVOKE TO user;


connect user/123456;

select * from test.t_REVOKE order by empno;

connect admin/123456;

REVOKE SELECT ON test.t_REVOKE FROM user RESTRICT;

connect user/123456;

select * from test.t_REVOKE order by empno;

