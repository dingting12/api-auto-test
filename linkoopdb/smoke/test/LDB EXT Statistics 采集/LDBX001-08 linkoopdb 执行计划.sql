-- 清空环境
drop table t_explain  IF  EXISTS;


-- 创建表
CREATE TABLE IF NOT EXISTS t_explain (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT);


-- 插入数据
INSERT INTO t_explain VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO t_explain VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO t_explain VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30);



explain plan for select * from t_explain;

explain plan for select a.*,b.* from t_explain a inner join t_explain b on a.empno=b.empno;

explain plan for select row_number() over(partition by 1 order by empno) id,a.* from t_explain a;