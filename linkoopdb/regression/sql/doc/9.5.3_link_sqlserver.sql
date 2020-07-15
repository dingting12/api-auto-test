--Description: doc 9.5.3 link sqlserver
--Date：2020-07-14
--Author：丁婷

GRANT CREATE_SCHEMA TO USER;
CREATE DATABASE LINK SQLSERVER_LINK CONNECT TO 'TEST_USER' IDENTIFIED BY
'123456' USING 'jdbc:sqlserver://localhost;database==testdb' PROPERTIES
('schema':'test_user_schema');

RELOAD DATABASE LINK SQLSERVER_LINK;

DROP DATABASE LINK SQLSERVER_LINK CASCADE;

GRANT CREATE_SCHEMA TO USER;
ALTER DATABASE LINK SQLSERVER_LINK CONNECT TO 'TEST_USER' IDENTIFIED BY
'123456' USING 'jdbc:sqlserver://localhost;database==testdb' PROPERTIES
('schema':'test_user_schema');

CREATE TABLE SQLSERVER_LINK.TEST (
ID INT,
NAME VARCHAR(20));

INSERT INTO SQLSERVER_LINK.TEST VALUES (1,'zs');

UPDATE SQLSERVER_LINK.TEST SET ID == 2;
 
DELETE FROM SQLSERVER_LINK.TEST; 

SELECT * FROM SQLSERVER_LINK.TEST; 

CREATE VIEW SQLSERVER_LINK.VIEW1 AS SELECT * SQLSERVER_LINK.TEST;

SELECT * FROM SQLSERVER_LINK.VIEW1; 

create table SQLSERVER_LINK.test_add_column(col1 int, col2 int, col3 int);

alter table SQLSERVER_LINK.test_add_column add column col4 int; 

create table SQLSERVER_LINK.test_drop_column (col1 int, col2 int, col3
int);
alter table SQLSERVER_LINK.test_drop_column drop column col1;

create table SQLSERVER_LINK.test_rename_column (col1 int, col2 int, col3
int);
alter table SQLSERVER_LINK.test_rename_column alter column col1 rename to
new_col1;

create table SQLSERVER_LINK.TEST_ALT_COL_TYPE(c1 int, c2 int, c3 int);
alter table SQLSERVER_LINK.TEST_ALT_COL_TYPE alter column C3 set data type
tinyint;
alter table SQLSERVER_LINK.TEST_ALT_COL_TYPE alter column C3 set data type
smallint;
alter table SQLSERVER_LINK.TEST_ALT_COL_TYPE alter column C3 set data type
bigint;
alter table SQLSERVER_LINK.TEST_ALT_COL_TYPE alter column C3 set data type
real;
alter table SQLSERVER_LINK.TEST_ALT_COL_TYPE alter column C3 set data type
float;
alter table SQLSERVER_LINK.TEST_ALT_COL_TYPE alter column C3 set data type
decimal(5,3);
alter table SQLSERVER_LINK.TEST_ALT_COL_TYPE alter column C3 set data type
numeric(5,3);
alter table SQLSERVER_LINK.TEST_ALT_COL_TYPE alter column C3 set data type
char(10);
alter table SQLSERVER_LINK.TEST_ALT_COL_TYPE alter column C3 set data type
varchar(10);

create table SQLSERVER_LINK.TEST_PK (id int not null, name VARCHAR(20) ,
age int );
alter table SQLSERVER_LINK.TEST_PK add constraint pk_S2 primary key(id);

create table SQLSERVER_LINK.TEST_UN (id int , name VARCHAR(20), age int );
ALTER TABLE SQLSERVER_LINK.TEST_UN ADD CONSTRAINT uc_S3 UNIQUE (name,
age);


create table SQLSERVER_LINK.TEST_01 (id int not null, name VARCHAR(20),
age int );
create table SQLSERVER_LINK.TEST_02 (id int , name VARCHAR(20), age int
not null);
alter table SQLSERVER_LINK.TEST_01 add constraint pk_S4 primary key(id);
alter table SQLSERVER_LINK.TEST_02 add constraint pk_S5 primary key(age);
ALTER TABLE SQLSERVER_LINK.TEST_01 ADD CONSTRAINT fk_S4 FOREIGN KEY(ID)
REFERENCES SQLSERVER_LINK.TEST_02(age);

GRANT INSERT,SELECT,UPDATE,DELETE ON SQLSERVER_LINK.TEST TO USER;