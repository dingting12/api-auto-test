set echo on

-- 清空环境
drop table t_create_like  IF  EXISTS;
drop table t_create_like_hdfs IF  EXISTS;
drop table t_create_like_hdfs2 IF  EXISTS;


-- 创建表
CREATE TABLE IF NOT EXISTS t_create_like (
EMPNO INT primary key,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);



CREATE TABLE t_create_like_hdfs(LIKE t_create_like INCLUDING IDENTITY INCLUDING DEFAULTS  INCLUDING GENERATED) ;
CREATE TABLE t_create_like_hdfs2 (uid int, LIKE t_create_like INCLUDING IDENTITY INCLUDING DEFAULTS  INCLUDING GENERATED) ;


select * from t_create_like_hdfs order by empno;

select * from t_create_like_hdfs2 order by empno;

show create table t_create_like_hdfs;

show create table t_create_like_hdfs2;