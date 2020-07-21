--Description: doc 9.3 data load
--Date：2020-07-14
--Author：丁婷

--9.3.1. 从HDFS文件加载
drop table T_DATA_LOAD_001 if exists ;
drop table T_DATA_LOAD_002 if exists ;
drop table T_DATA_LOAD_003 if exists ;
drop table T_DATA_LOAD_004 if exists ;

CREATE EXTERNAL TABLE T_DATA_LOAD_001 (ID INT, NAME VARCHAR(10)) LOCATION
('HDFSRPC_URL/doc/TEST1.csv') FORMAT 'csv' (DELIMITER ',');

CREATE EXTERNAL TABLE T_DATA_LOAD_002 (ID INT, NAME VARCHAR(10)) LOCATION
('HDFSRPC_URL/doc/csv_doc') FORMAT 'csv' (DELIMITER ',');

CREATE EXTERNAL TABLE T_DATA_LOAD_003 (ID INT, NAME VARCHAR(10)) LOCATION
('HDFSRPC_URL/doc/csv_doc,HDFSRPC_URL/doc/TEST1.csv') FORMAT 'csv'
(DELIMITER ',');


CREATE TABLE T_DATA_LOAD_004 (ID INT, NAME VARCHAR(10));

INSERT INTO T_DATA_LOAD_004 SELECT * FROM T_DATA_LOAD_001;

select * from T_DATA_LOAD_004 order by id;

delete from T_DATA_LOAD_004;

INSERT INTO T_DATA_LOAD_004 SELECT * FROM T_DATA_LOAD_002;

select * from T_DATA_LOAD_004 order by id;

delete from T_DATA_LOAD_004;

INSERT INTO T_DATA_LOAD_004 SELECT * FROM T_DATA_LOAD_003;

select * from T_DATA_LOAD_004 order by NAME;


--9.3.2. 从HIVE表加载
drop table T_DATA_LOAD_HIVE_001 if exists ;
drop table T_DATA_LOAD_HIVE_002 if exists ;

CREATE EXTERNAL TABLE T_DATA_LOAD_HIVE_001 (
ID INT,
NAME VARCHAR(20) ) FORMAT 'HIVE' PROPERTIES ('table':'HIVE_DATA_001');

CREATE TABLE T_DATA_LOAD_HIVE_002 (
ID INT, 
NAME VARCHAR(10)
);

INSERT INTO T_DATA_LOAD_HIVE_002 SELECT * FROM T_DATA_LOAD_HIVE_001;

SELECT * FROM T_DATA_LOAD_HIVE_002 ORDER BY ID;



--9.3.3. 从其他数据库加载
drop table T_DATA_LOAD_ORACLE_001 if exists ;
drop table T_DATA_LOAD_ORACLE_002 if exists ;

CREATE EXTERNAL TABLE T_DATA_LOAD_ORACLE_001 ( 
ID INT, 
NAME VARCHAR(20)
 ) FORMAT 'JDBC'
PROPERTIES
('table':'T_DATA_EXPORT_002','driver':'oracle.jdbc.driver.OracleDriver','url':'jdbc:oracle:thin:@192.168.1.72:1521:xe','user':'testlink1',
'password':'123456');

CREATE TABLE T_DATA_LOAD_ORACLE_002 (ID INT, NAME VARCHAR(10));

INSERT INTO T_DATA_LOAD_ORACLE_002 SELECT * FROM T_DATA_LOAD_ORACLE_001;

SELECT * FROM T_DATA_LOAD_ORACLE_002 ORDER BY ID;




drop DATABASE LINK ORACLE_LINK_LOAD_001 if exists cascade;

CREATE DATABASE LINK ORACLE_LINK_LOAD_001 CONNECT TO 'testlink1' IDENTIFIED BY
'123456' USING 'jdbc:oracle:thin:@192.168.1.72:1521:xe' properties
('maxActive':'5');

ALTER TABLE ORACLE_LINK_LOAD_001.T_DATA_EXPORT_002 SET PROPERTIES ('part1':'ID=1','part2':'ID=2');

select * from ORACLE_LINK_LOAD_001.T_DATA_EXPORT_002;

drop table T_DATA_LOAD_ORACLE_003 if exists ;

CREATE TABLE T_DATA_LOAD_ORACLE_003 (ID INT, NAME VARCHAR(10));

INSERT INTO T_DATA_LOAD_ORACLE_003 SELECT * FROM ORACLE_LINK_LOAD_001.T_DATA_EXPORT_002;

select * from T_DATA_LOAD_ORACLE_003;

--从子查询加载
drop table T_LOAD_SUB_001 if exists;
drop table EMP_LOAD_001 if exists ;
drop table DEPT_LOAD_001 if exists;

CREATE TABLE T_LOAD_SUB_001 (
C1 VARCHAR(20),
C2 INT,
C3 DATE
);

CREATE TABLE EMP_LOAD_001 (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

INSERT INTO EMP_LOAD_001 VALUES (7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO EMP_LOAD_001 VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);
INSERT INTO EMP_LOAD_001 VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30);
INSERT INTO EMP_LOAD_001 VALUES (7566,'JONES','MANAGER',7839,TO_DATE('1981-4-2','yyyy-mm-dd'),2975,NULL,20);
INSERT INTO EMP_LOAD_001 VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('1981-9-28','yyyy-mm-dd'),1250,1400,30);
INSERT INTO EMP_LOAD_001 VALUES (7698,'BLAKE','MANAGER',7839,TO_DATE('1981-5-1','yyyy-mm-dd'),2850,NULL,30);
INSERT INTO EMP_LOAD_001 VALUES (7782,'CLARK','MANAGER',7839,TO_DATE('1981-6-9','yyyy-mm-dd'),2450,NULL,10);
INSERT INTO EMP_LOAD_001 VALUES (7839,'KING','PRESIDENT',NULL,TO_DATE('1981-11-17','yyyy-mm-dd'),5000,NULL,10);
INSERT INTO EMP_LOAD_001 VALUES (7844,'TURNER','SALESMAN',7698,TO_DATE('1981-9-8','yyyy-mm-dd'),1500,0,30);
INSERT INTO EMP_LOAD_001 VALUES (7900,'JAMES','CLERK',7698,TO_DATE('1981-12-3','yyyy-mm-dd'),950,NULL,30);
INSERT INTO EMP_LOAD_001 VALUES (7902,'FORD','ANALYST',7566,TO_DATE('1981-12-3','yyyy-mm-dd'),3000,NULL,20);
INSERT INTO EMP_LOAD_001 VALUES (7934,'MILLER','CLERK',7782,TO_DATE('1982-1-23','yyyy-mm-dd'),1300,NULL,10);

CREATE TABLE DEPT_LOAD_001 (
DEPTNO INT,
DNAME VARCHAR(20),
LOC VARCHAR(20)
);

INSERT INTO DEPT_LOAD_001 VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT_LOAD_001 VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT_LOAD_001 VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT_LOAD_001 VALUES (40,'OPERATIONS','BOSTON');

INSERT INTO T_LOAD_SUB_001 SELECT ENAME,SAL,HIREDATE FROM EMP_LOAD_001 WHERE DEPTNO IN
(SELECT DEPTNO FROM DEPT_LOAD_001);

select * from T_LOAD_SUB_001 order by C2;

--9.3.5. 从多台服务器批量加载普通文件
drop table T_LOAD_LDBDIST_001 if exists;
drop table T_LOAD_LDBDIST_002 if exists;
drop table T_LOAD_LDBDIST_003 if exists;
drop table T_LOAD_LDBDIST_004 if exists;
drop table T_LOAD_LDBDIST_005 if exists;

CREATE EXTERNAL TABLE T_LOAD_LDBDIST_001 (
ID INT,
NAME VARCHAR(20)
) LOCATION('LDBDIST_URL/doc/TEST1.csv') FORMAT 'csv' (DELIMITER ',');


CREATE TABLE T_LOAD_LDBDIST_002 (
ID INT,
NAME VARCHAR(20)
);

INSERT INTO T_LOAD_LDBDIST_002 SELECT * FROM T_LOAD_LDBDIST_001;

select * from T_LOAD_LDBDIST_002 order by id;




CREATE EXTERNAL TABLE T_LOAD_LDBDIST_003 (
ID INT,
NAME VARCHAR(20)
) LOCATION
('LDBDIST_URL/doc/TEST1.csv,LDBDIST_URL/doc/TEST2.csv') FORMAT
'csv' (DELIMITER ',');

delete from T_LOAD_LDBDIST_002;

INSERT INTO T_LOAD_LDBDIST_002 SELECT * FROM T_LOAD_LDBDIST_003;

select * from T_LOAD_LDBDIST_002 order by id;


CREATE EXTERNAL TABLE T_LOAD_LDBDIST_004 (
ID INT,
NAME VARCHAR(20)
) LOCATION
('LDBDIST_URL/doc/TEST') FORMAT 'csv' (DELIMITER ',');

delete from T_LOAD_LDBDIST_002;

INSERT INTO T_LOAD_LDBDIST_002 SELECT * FROM T_LOAD_LDBDIST_004;

select * from T_LOAD_LDBDIST_002 order by id;



CREATE EXTERNAL TABLE T_LOAD_LDBDIST_005(
ID INT,
NAME VARCHAR(20)) LOCATION
('LDBDIST_URL/doc/TEST1.csv,LDBDIST_URL/doc/TEST') FORMAT
'csv' (DELIMITER ',');

delete from T_LOAD_LDBDIST_002;

INSERT INTO T_LOAD_LDBDIST_002 SELECT * FROM T_LOAD_LDBDIST_005;

select * from T_LOAD_LDBDIST_002 order by id;

