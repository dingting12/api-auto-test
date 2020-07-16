--Description: doc 9.5.2 link postgres
--Date：2020-07-14
--Author：丁婷

drop user user_postgres_001 if exists cascade; 

CREATE USER user_postgres_001 PASSWORD '123456';

GRANT CREATE_SCHEMA TO user_postgres_001;

grant change_authorization to user_postgres_001; 

connect user user_postgres_001 password '123456';

create database link POSTGRES_LINK_DOC_001 connect to 'postgres' identified by 'linkoopdb' using 'jdbc:postgresql://192.168.1.72:5432/test' properties('schema':'manyi','caseSensitive':'true');

RELOAD DATABASE LINK POSTGRES_LINK_DOC_001;

DROP DATABASE LINK POSTGRES_LINK_DOC_001 if exists cascade;

create database link POSTGRES_LINK_DOC_001 connect to 'postgres' identified by
'linkoopdb' using 'jdbc:postgresql://192.168.1.72:5432/test' properties
('schema':'manyi','caseSensitive':'true');

ALTER DATABASE LINK POSTGRES_LINK_DOC_001 CONNECT TO 'postgres' IDENTIFIED BY
'123456' USING 'jdbc:postgresql://localhost:5432/postgres';




drop table POSTGRES_LINK_DOC_001.T_TEST_PG_001 if exists cascade;

drop view POSTGRES_LINK_DOC_001.V_VIEW1 if exists;

CREATE TABLE POSTGRES_LINK_DOC_001.T_TEST_PG_001 (
ID INT,
NAME VARCHAR(20));

INSERT INTO POSTGRES_LINK_DOC_001.T_TEST_PG_001 VALUES (1,'zs');

select * from POSTGRES_LINK_DOC_001.T_TEST_PG_001;

UPDATE POSTGRES_LINK_DOC_001.T_TEST_PG_001 SET ID =2; 

select * from POSTGRES_LINK_DOC_001.T_TEST_PG_001;

DELETE FROM POSTGRES_LINK_DOC_001.T_TEST_PG_001; 

select * from POSTGRES_LINK_DOC_001.T_TEST_PG_001;

INSERT INTO POSTGRES_LINK_DOC_001.T_TEST_PG_001 VALUES (1,'zs');

CREATE VIEW POSTGRES_LINK_DOC_001.V_VIEW1 AS SELECT * from POSTGRES_LINK_DOC_001.T_TEST_PG_001;

SELECT * FROM POSTGRES_LINK_DOC_001.V_VIEW1; 




drop table POSTGRES_LINK_DOC_001.TEST_COL if exists cascade;

create table POSTGRES_LINK_DOC_001.TEST_COL (c1 int, c2 VARCHAR(20), c3 smallint
);
alter table POSTGRES_LINK_DOC_001.TEST_COL add c6 bigint;
alter table POSTGRES_LINK_DOC_001.TEST_COL add c9 decimal;
alter table POSTGRES_LINK_DOC_001.TEST_COL add c10 date;
alter table POSTGRES_LINK_DOC_001.TEST_COL add c11 timestamp;
alter table POSTGRES_LINK_DOC_001.TEST_COL add c12 char(6);

show create table POSTGRES_LINK_DOC_001.TEST_COL;

ALTER TABLE POSTGRES_LINK_DOC_001.TEST_COL DROP COLUMN c11;

show create table POSTGRES_LINK_DOC_001.TEST_COL;

ALTER table POSTGRES_LINK_DOC_001.TEST_COL ALTER c3 RENAME TO salary;

show create table POSTGRES_LINK_DOC_001.TEST_COL;





drop table POSTGRES_LINK_DOC_001.test_alt_type if exists cascade;

create table POSTGRES_LINK_DOC_001.test_alt_type (id int, age int, salary int);

alter table POSTGRES_LINK_DOC_001.test_alt_type alter column salary set data type
varchar(200);

show create table POSTGRES_LINK_DOC_001.test_alt_type;

alter table POSTGRES_LINK_DOC_001.test_alt_type alter column salary set data type
smallint;

show create table POSTGRES_LINK_DOC_001.test_alt_type;

alter table POSTGRES_LINK_DOC_001.test_alt_type alter column salary set data type
bigint;

show create table POSTGRES_LINK_DOC_001.test_alt_type;

alter table POSTGRES_LINK_DOC_001.test_alt_type alter column salary set data type
real;

show create table POSTGRES_LINK_DOC_001.test_alt_type;

alter table POSTGRES_LINK_DOC_001.test_alt_type alter column salary set data type
float;

show create table POSTGRES_LINK_DOC_001.test_alt_type;

alter table POSTGRES_LINK_DOC_001.test_alt_type alter column salary set data type
decimal(5,3);

show create table POSTGRES_LINK_DOC_001.test_alt_type;

alter table POSTGRES_LINK_DOC_001.test_alt_type alter column salary set data type
numeric(5,3);

show create table POSTGRES_LINK_DOC_001.test_alt_type;

alter table POSTGRES_LINK_DOC_001.test_alt_type alter column salary set data type
char(10);

show create table POSTGRES_LINK_DOC_001.test_alt_type;

alter table POSTGRES_LINK_DOC_001.test_alt_type alter column salary set data type
varchar(10);


drop table POSTGRES_LINK_DOC_001.TEST_01 if exists cascade;
drop table POSTGRES_LINK_DOC_001.TEST_02 if exists cascade;

create table POSTGRES_LINK_DOC_001.TEST_01 ( id int, name VARCHAR(20), age int );
create table POSTGRES_LINK_DOC_001.TEST_02 ( id int, name VARCHAR(20), age int );
alter table POSTGRES_LINK_DOC_001.TEST_01 add constraint pk_t04 primary key(id);
alter table POSTGRES_LINK_DOC_001.TEST_02 add constraint pk_t05 primary key(age);
ALTER TABLE POSTGRES_LINK_DOC_001.TEST_01 ADD CONSTRAINT fk_t04 FOREIGN KEY(ID)
REFERENCES POSTGRES_LINK_DOC_001.TEST_02(age);





drop table POSTGRES_LINK_DOC_001.TEST_PS_UN if exists cascade;

create table POSTGRES_LINK_DOC_001.TEST_PS_UN ( id int, name VARCHAR(20), age int );

ALTER TABLE POSTGRES_LINK_DOC_001.TEST_PS_UN ADD CONSTRAINT uc_t03 UNIQUE (name,
age);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='TEST_PS_UN' and CONSTRAINT_NAME='UC_T03';



drop table POSTGRES_LINK_DOC_001.TEST_PS_PK if exists cascade;

create table POSTGRES_LINK_DOC_001.TEST_PS_PK ( id int, name VARCHAR(20), age int );
alter table POSTGRES_LINK_DOC_001.TEST_PS_PK add constraint pk_t02 primary key(id);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='TEST_PS_PK' and CONSTRAINT_NAME='PK_T02';





connect user admin password '123456';

drop user user_postgres_002 if exists cascade;

drop DATABASE LINK POSTGRES_LINK_DOC_002 if exists cascade;

CREATE USER user_postgres_002 PASSWORD '123456';

create database link POSTGRES_LINK_DOC_002 connect to 'postgres' identified by
'linkoopdb' using 'jdbc:postgresql://192.168.1.72:5432/test'properties
('schema':'manyi','caseSensitive':'true');


DROP table POSTGRES_LINK_DOC_002.T_TEST_PS_002 if exists;

CREATE TABLE POSTGRES_LINK_DOC_002.T_TEST_PS_002 (
ID INT,
NAME VARCHAR(20)
);


GRANT INSERT,SELECT,UPDATE,DELETE ON POSTGRES_LINK_DOC_002.T_TEST_PS_002 TO user_postgres_002;

grant change_authorization to user_postgres_002; 

connect user user_postgres_002 password '123456';

insert into POSTGRES_LINK_DOC_002.T_TEST_PS_002 values(1,'zhangsan');

select * from POSTGRES_LINK_DOC_002.T_TEST_PS_002;

UPDATE POSTGRES_LINK_DOC_002.T_TEST_PS_002 SET ID = 2;

select * from POSTGRES_LINK_DOC_002.T_TEST_PS_002;

delete from POSTGRES_LINK_DOC_002.T_TEST_PS_002;

select * from POSTGRES_LINK_DOC_002.T_TEST_PS_002;
