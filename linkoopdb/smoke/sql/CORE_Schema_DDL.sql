--    Description: 测试schema ddl 
--    Date:         2020-06-10
--    Author:       丁婷

--测试80 F311-01 CREATE SCHEMA，不支持数字开头
drop scheme if exists T_create_schema_001;

CREATE SCHEMA T_create_schema_001;

CREATE SCHEMA 12_sdgh_wegh_wy1;

-- 78 F311-02 CREATE TABLE for persistent base tables

drop table T_create_schema_001.Test_CREATE_table_001 if exists cascade;

drop schema T_create_schema_001 if exists cascade;

create schema T_create_schema_001 create table Test_CREATE_table_001 (id int);

insert into T_create_schema_001.Test_CREATE_table_001 values (1);

select * from T_create_schema_001.Test_CREATE_table_001;


-- 79 F311-03 CREATE VIEW
DROP SCHEMA T_create_view_schema_001 IF EXISTS CASCADE;

CREATE SCHEMA T_create_view_schema_001;

CREATE TABLE T_create_view_schema_001.t_create_table_001(
id INT,
name VARCHAR(200),
sal NUMERIC(6,2)
);

INSERT INTO T_create_view_schema_001.t_create_table_001 VALUES
(1,'张三阿Sa',128.23),
(2,'cdng稍等',2186.23),
(3,'xsh文件sd',34.56);
CREATE TABLE T_create_view_schema_001.t_create_table_002(
id INT,
name VARCHAR(200),
sal NUMERIC(6,2)
);
INSERT INTO T_create_view_schema_001.t_create_table_002 VALUES
(4,'张三阿Sa',56.76),
(5,'cdng稍等',3754.54),
(6,'xsh文件sd',389.23);

CREATE VIEW T_create_view_schema_001.v_craete_view_001 AS 
SELECT t1.id id1,t2.id id2 
FROM T_create_view_schema_001.t_create_table_001 t1,
T_create_view_schema_001.t_create_table_002 t2 
ORDER BY t1.SAL,t2.SAL;

--122 F311-05 GRANT statement,privilege at the table level (single)

drop user user_ddl if exists cascade;

drop schema S_create_schema_001 if exists cascade;

create schema S_create_schema_001;

CREATE TABLE S_create_schema_001.t_create_table_003 
(
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

INSERT INTO S_create_schema_001.t_create_table_003 VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-2-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-2-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-4-2',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-9-28',1150,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-5-1',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-6-9',2450,NULL,10),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,0,30),
(7900,'JAMES','CLERK',7698,'1981-12-8',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-8',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);

create user user_ddl password '123456';

grant select on S_create_schema_001.t_create_table_003 to user_ddl;

grant change_authorization to user_ddl; 

connect user USER1 password '123456';

select count(*) from S_create_schema_001.t_create_table_003 where empno > 7499;

insert into S_create_schema_001.t_create_table_003 values (7900,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);



--122 F311-05 GRANT statement,privilege at the table level (multiple)
connect user admin password '123456';

REVOKE all ON S_create_schema_001.t_create_table_003 FROM user_ddl RESTRICT;

GRANT select,update ON S_create_schema_001.t_create_table_003 TO user_ddl;

grant change_authorization to user_ddl; 

connect user USER1 password '123456';

update S_create_schema_001.t_create_table_003 set ename = 'aaa' where sal = 1250;

insert into S_create_schema_001.t_create_table_003 values (7900,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);


--122 F311-05 GRANT statement,privilege at the column level (1)
connect user admin password '123456';

REVOKE all ON S_create_schema_001.t_create_table_003 FROM user_ddl RESTRICT;

grant select(ename) on S_create_schema_001.t_create_table_003 to user_ddl;

grant change_authorization to user_ddl; 

connect user USER1 password '123456';

select ename from S_create_schema_001.t_create_table_003 ;

select EMPNO from S_create_schema_001.t_create_table_003 ;