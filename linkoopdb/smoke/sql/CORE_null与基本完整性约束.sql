--    Description: 测试null与基本完整性约束 ,包括F381-01,E141-07,F381-03,E131
--    Date:         2020-06-09
--    Author:       丁婷

--测试242 F381-01 ALTER TABLE statement: ALTER COLUMN clause 

drop table if exists T_Extended_Schema_Manipulation_001;

CREATE TABLE T_Extended_Schema_Manipulation_001 (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

--增加一列
alter table T_Extended_Schema_Manipulation_001 add column c1 int;

SELECT data_type
FROM information_schema.columns
WHERE table_name = 'T_EXTENDED_SCHEMA_MANIPULATION_001'
	AND column_name = 'C1';
	
--删除一列
alter table T_Extended_Schema_Manipulation_001 drop column c1;

SELECT data_type
FROM information_schema.columns
WHERE table_name = 'T_EXTENDED_SCHEMA_MANIPULATION_001'
	AND column_name = 'C1';

--测试599 E141-07  Column defaults+not null
drop table if exists T_Extended_Schema_Manipulation_002;

create table T_Extended_Schema_Manipulation_002 (
tsmallint smallint default 1 not null ,
tint int default 2,
tbigint bigint default 3,
treal real default 4.2,
tfloat float default 5.2,
tdouble double default 6.2,
tdecimal decimal(10,2) default 7.2,
tnumeric numeric(10,2) default 8.2,
tdate date default current_date,
ttimestamp timestamp default current_timestamp,
tchar char(200) default 'char',
tvarchar varchar(200) default 'varchar',
tbinary binary(100) default '0x10110110',
tvarbinary varbinary(100) default '0x10110110',
tblob BLOB default 'BLOB',
tclob CLOB default 'CLOB',
tbit bit default 1,
tcharacter character varying(100) default 'character varying',
tcharv char varying(100) default 'char varying',
tlongvarchar longvarchar default 'longvarchar',
tcharacterl character large object(100) default 'character large object',
tcharl char large object(100) default 'char large object',
tbinaryv binary varying(100) default '0x10110110'
);

insert into T_Extended_Schema_Manipulation_002(tint) values (11);

select tsmallint,tint,treal,tdouble from T_Extended_Schema_Manipulation_002;

--增加一列测试默认值
alter table T_Extended_Schema_Manipulation_002 add column c1 smallint default 520;

insert into T_Extended_Schema_Manipulation_002(tsmallint) values (110);

select tsmallint,tint,treal,tdouble from T_Extended_Schema_Manipulation_002;


-- 244 F381-03 ALTER TABLE statement: DROP CONSTRAINT clause
drop table if exists T_Extended_Schema_Manipulation_003;
CREATE TABLE T_Extended_Schema_Manipulation_003 (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

INSERT INTO T_Extended_Schema_Manipulation_003 VALUES 
(1,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
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


alter table T_Extended_Schema_Manipulation_003 add constraint pk_1 primary key (empno);

insert into T_Extended_Schema_Manipulation_003(empno) values (1);

alter table T_Extended_Schema_Manipulation_003 drop constraint pk_1;

insert into T_Extended_Schema_Manipulation_003(empno) values (1);


--144 E131 Null value support (nulls in lieu of values)
drop table if exists T_Extended_Schema_Manipulation_004;

create table T_Extended_Schema_Manipulation_004(
id int,
name char(255),
age int,
account double,
ttime timestamp,
classid char);

insert into T_Extended_Schema_Manipulation_004 values 
(1,'纸蜘蛛',18,null,'2019-04-03 11:11:11','a'),
(2,null,43,21334.2,'2018-03-03 22:44:44','b');

select * from T_Extended_Schema_Manipulation_004 where account is null;