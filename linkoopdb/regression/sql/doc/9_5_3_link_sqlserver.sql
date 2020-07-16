--Description: doc 9.5.3 link sqlserver
--Date：2020-07-14
--Author：丁婷

drop user user_sqlserver_001 if exists cascade; 

CREATE USER user_sqlserver_001 PASSWORD '123456';

GRANT CREATE_SCHEMA TO user_sqlserver_001;

grant change_authorization to user_sqlserver_001; 

connect user user_sqlserver_001 password '123456';

CREATE DATABASE LINK SQLSERVER_LINK_DOC_001 CONNECT TO 'sa' IDENTIFIED BY
'LinkoopDB123' USING 'jdbc:sqlserver://192.168.1.72;Database=insen' PROPERTIES
('schema':'dbo');

RELOAD DATABASE LINK SQLSERVER_LINK_DOC_001;

DROP DATABASE LINK SQLSERVER_LINK_DOC_001  CASCADE;


CREATE DATABASE LINK SQLSERVER_LINK_DOC_001 CONNECT TO 'sa' IDENTIFIED BY
'LinkoopDB123' USING 'jdbc:sqlserver://192.168.1.72;Database=insen' PROPERTIES
('schema':'dbo');

ALTER DATABASE LINK SQLSERVER_LINK_DOC_001 CONNECT TO 'sa' IDENTIFIED BY
'LinkoopDB123' USING 'jdbc:sqlserver://192.168.1.72;Database=tempdb' PROPERTIES
('schema':'dbo');


drop table SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001 if exists cascade;

CREATE TABLE SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001 (
ID INT,
NAME VARCHAR(20));

INSERT INTO SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001 VALUES (1,'zs');

SELECT * FROM SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001; 

UPDATE SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001 SET ID =2;

SELECT * FROM SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001; 
 
DELETE FROM SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001; 

SELECT * FROM SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001; 

INSERT INTO SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001 VALUES (1,'zs');

drop table SQLSERVER_LINK_DOC_001.V_VIEW1 if exists;

CREATE VIEW SQLSERVER_LINK_DOC_001.V_VIEW1 AS SELECT * from SQLSERVER_LINK_DOC_001.T_TEST_SQLSERVER_001;

SELECT * FROM SQLSERVER_LINK_DOC_001.V_VIEW1; 



drop table SQLSERVER_LINK_DOC_001.test_add_column if exists cascade;

create table SQLSERVER_LINK_DOC_001.test_add_column(col1 int, col2 int, col3 int);

alter table SQLSERVER_LINK_DOC_001.test_add_column add column col4 int; 

show create table SQLSERVER_LINK_DOC_001.test_add_column;




drop table SQLSERVER_LINK_DOC_001.test_drop_column if exists cascade;

create table SQLSERVER_LINK_DOC_001.test_drop_column (col1 int, col2 int, col3 int);

alter table SQLSERVER_LINK_DOC_001.test_drop_column drop column col1;

show create table SQLSERVER_LINK_DOC_001.test_drop_column;





drop table SQLSERVER_LINK_DOC_001.test_rename_column if exists cascade;

create table SQLSERVER_LINK_DOC_001.test_rename_column (col1 int, col2 int, col3
int);

alter table SQLSERVER_LINK_DOC_001.test_rename_column alter column col1 rename to
new_col1;

show create table SQLSERVER_LINK_DOC_001.test_rename_column;





drop table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE if exists cascade;

create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE(c1 int, c2 int, c3 int);

alter table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE alter column C3 set data type
tinyint;

show create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE;

alter table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE alter column C3 set data type
smallint;

show create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE;

alter table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE alter column C3 set data type
bigint;

show create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE;

alter table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE alter column C3 set data type
real;

show create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE;

alter table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE alter column C3 set data type
float;

show create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE;

alter table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE alter column C3 set data type
decimal(5,3);

show create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE;

alter table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE alter column C3 set data type
numeric(5,3);

show create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE;

alter table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE alter column C3 set data type
char(10);

show create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE;

alter table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE alter column C3 set data type
varchar(10);

show create table SQLSERVER_LINK_DOC_001.TEST_ALT_COL_TYPE;





drop table SQLSERVER_LINK_DOC_001.TEST_PK if exists cascade;

drop table SQLSERVER_LINK_DOC_001.TEST_UN if exists cascade;

create table SQLSERVER_LINK_DOC_001.TEST_PK (id int not null, name VARCHAR(20) ,
age int );
alter table SQLSERVER_LINK_DOC_001.TEST_PK add constraint pk_S2 primary key(id);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='TEST_PK' and CONSTRAINT_NAME='PK_S2';

create table SQLSERVER_LINK_DOC_001.TEST_UN (id int , name VARCHAR(20), age int );

ALTER TABLE SQLSERVER_LINK_DOC_001.TEST_UN ADD CONSTRAINT uc_S3 UNIQUE (name,
age);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='TEST_UN' and CONSTRAINT_NAME='UC_S3';



drop table SQLSERVER_LINK_DOC_001.TEST_01 if exists cascade;

drop table SQLSERVER_LINK_DOC_001.TEST_02 if exists cascade;

create table SQLSERVER_LINK_DOC_001.TEST_01 (id int not null, name VARCHAR(20),
age int );

create table SQLSERVER_LINK_DOC_001.TEST_02 (id int , name VARCHAR(20), age int
not null);

alter table SQLSERVER_LINK_DOC_001.TEST_01 add constraint pk_S4 primary key(id);

alter table SQLSERVER_LINK_DOC_001.TEST_02 add constraint pk_S5 primary key(age);

ALTER TABLE SQLSERVER_LINK_DOC_001.TEST_01 ADD CONSTRAINT fk_S4 FOREIGN KEY(ID)
REFERENCES SQLSERVER_LINK_DOC_001.TEST_02(age);





connect user admin password '123456';

drop user user_sqlserver_002 if exists cascade;

drop DATABASE LINK SQLSERVER_LINK_DOC_002 if exists cascade;

CREATE USER user_sqlserver_002 PASSWORD '123456';

CREATE DATABASE LINK SQLSERVER_LINK_DOC_002 CONNECT TO 'sa' IDENTIFIED BY
'LinkoopDB123' USING 'jdbc:sqlserver://192.168.1.72;Database=insen' PROPERTIES
('schema':'dbo');

DROP table SQLSERVER_LINK_DOC_002.T_TEST_SQLSERVER_002 if exists;

CREATE TABLE SQLSERVER_LINK_DOC_002.T_TEST_SQLSERVER_002 (
ID INT,
NAME VARCHAR(20)
);


GRANT INSERT,SELECT,UPDATE,DELETE ON SQLSERVER_LINK_DOC_002.T_TEST_SQLSERVER_002 TO user_sqlserver_002;

grant change_authorization to user_sqlserver_002; 

connect user user_sqlserver_002 password '123456';

insert into SQLSERVER_LINK_DOC_002.T_TEST_SQLSERVER_002 values(1,'zhangsan');

select * from SQLSERVER_LINK_DOC_002.T_TEST_SQLSERVER_002;

UPDATE SQLSERVER_LINK_DOC_002.T_TEST_SQLSERVER_002 SET ID = 2;

select * from SQLSERVER_LINK_DOC_002.T_TEST_SQLSERVER_002;

delete from SQLSERVER_LINK_DOC_002.T_TEST_SQLSERVER_002;

select * from SQLSERVER_LINK_DOC_002.T_TEST_SQLSERVER_002;
