--Description: doc 9.5.4 link mysql
--Date：2020-07-14
--Author：丁婷
drop user user_mysql_001 if exists cascade; 

CREATE USER user_mysql_001 PASSWORD '123456';

GRANT CREATE_SCHEMA TO user_mysql_001;

grant change_authorization to user_mysql_001; 

connect user user_mysql_001 password '123456';

CREATE DATABASE LINK MYSQL_LINK_DOC_001 CONNECT TO 'test' IDENTIFIED BY
'123456' USING 'jdbc:mysql://192.168.1.72:3306/test' PROPERTIES
('caseSensitive':'true');

RELOAD DATABASE LINK MYSQL_LINK_DOC_001;

DROP DATABASE LINK MYSQL_LINK_DOC_001 if exists cascade; 

CREATE DATABASE LINK MYSQL_LINK_DOC_001 CONNECT TO 'test' IDENTIFIED BY
'123456' USING 'jdbc:mysql://192.168.1.72:3306/test' PROPERTIES
('caseSensitive':'true');

ALTER DATABASE LINK MYSQL_LINK_DOC_001 CONNECT TO 'admin' IDENTIFIED BY
'123456' USING 'jdbc:mysql://192.168.1.72:3306/test' PROPERTIES
('caseSensitive':'true');


drop table  MYSQL_LINK_DOC_001.T_TEST_001 if exists cascade;

CREATE TABLE MYSQL_LINK_DOC_001.T_TEST_001 (
ID INT,
NAME VARCHAR(20));

INSERT INTO MYSQL_LINK_DOC_001.T_TEST_001 VALUES (1,'zs');

SELECT * FROM MYSQL_LINK_DOC_001.T_TEST_001; 

UPDATE MYSQL_LINK_DOC_001.T_TEST_001 SET ID = 2; 

SELECT * FROM MYSQL_LINK_DOC_001.T_TEST_001; 

DELETE FROM MYSQL_LINK_DOC_001.T_TEST_001; 

SELECT * FROM MYSQL_LINK_DOC_001.T_TEST_001; 

INSERT INTO MYSQL_LINK_DOC_001.T_TEST_001 VALUES (1,'zs');

drop view MYSQL_LINK_DOC_001.V_VIEW1 if exists;

CREATE VIEW MYSQL_LINK_DOC_001.V_VIEW1 AS SELECT * from MYSQL_LINK_DOC_001.T_TEST_001; 

SELECT * FROM MYSQL_LINK_DOC_001.V_VIEW1;





drop table MYSQL_LINK_DOC_001.TEST_COL_001 if exists;

create table MYSQL_LINK_DOC_001.TEST_COL_001 ( c1 int, c2 VARCHAR(20), c3 smallint );

alter table MYSQL_LINK_DOC_001.TEST_COL_001 add c5 float;

show create table MYSQL_LINK_DOC_001.TEST_COL_001;

ALTER TABLE MYSQL_LINK_DOC_001.TEST_COL_001 DROP COLUMN c3;

show create table MYSQL_LINK_DOC_001.TEST_COL_001;

ALTER table MYSQL_LINK_DOC_001.TEST_COL_001 ALTER c2 RENAME TO salary;

show create table MYSQL_LINK_DOC_001.TEST_COL_001;


drop table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 if exists;

create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 ( id int, name VARCHAR(20), age
int );

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;

alter table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 alter column name set data type
date;

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;

alter table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 alter column name set data type
timestamp;

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;

alter table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 alter column name set data type
varchar(38);

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;

alter table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 alter column name set data type
DOUBLE;

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;

alter table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 alter column name set data type
decimal;

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;

alter table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 alter column name set data type
char(20);

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;

alter table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 alter column name set data type
float;

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;

alter table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 alter column name set data type
smallint;

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;

alter table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001 alter column name set data type
DOUBLE; 

show create table MYSQL_LINK_DOC_001.TEST_ALT_COL_TYPE_001;






drop table MYSQL_LINK_DOC_001.TEST_PK_001 if exists;

create table MYSQL_LINK_DOC_001.TEST_PK_001 (id int, name VARCHAR(20), age int );

alter table MYSQL_LINK_DOC_001.TEST_PK_001 add constraint pk_t02 primary key(id);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='TEST_PK_001' and CONSTRAINT_NAME='PK_T02';

drop table MYSQL_LINK_DOC_001.TEST_UN_001 if exists;

create table MYSQL_LINK_DOC_001.TEST_UN_001 (id int, name VARCHAR(20), age int );

ALTER TABLE MYSQL_LINK_DOC_001.TEST_UN_001 ADD CONSTRAINT uc_t03 UNIQUE (name,age);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='TEST_UN_001' and CONSTRAINT_NAME='UC_T03';

drop table MYSQL_LINK_DOC_001.TEST_FOR_01 if exists;
drop table MYSQL_LINK_DOC_001.TEST_FOR_02 if exists;

create table MYSQL_LINK_DOC_001.TEST_FOR_01 ( id int, name VARCHAR(20), age int );
create table MYSQL_LINK_DOC_001.TEST_FOR_02 ( id int, name VARCHAR(20), age int );
alter table MYSQL_LINK_DOC_001.TEST_FOR_01 add constraint pk_t04 primary key(id);
alter table MYSQL_LINK_DOC_001.TEST_FOR_02 add constraint pk_t05 primary key(age);
ALTER TABLE MYSQL_LINK_DOC_001.TEST_FOR_01 ADD CONSTRAINT fk_t04 FOREIGN KEY(ID)
REFERENCES MYSQL_LINK_DOC_001.TEST_FOR_02(age);





connect user admin password '123456';

disconnect user_mysql_002;

drop user user_mysql_002 if exists cascade;

drop DATABASE LINK MYSQL_LINK_DOC_002 if exists cascade;

CREATE USER user_mysql_002 PASSWORD '123456';

CREATE DATABASE LINK MYSQL_LINK_DOC_002 CONNECT TO 'test' IDENTIFIED BY
'123456' USING 'jdbc:mysql://192.168.1.72:3306/test' PROPERTIES
('caseSensitive':'true');

DROP table MYSQL_LINK_DOC_002.T_TEST_MYSQL_002 if exists;

CREATE TABLE MYSQL_LINK_DOC_002.T_TEST_MYSQL_002 (
ID INT,
NAME VARCHAR(20)
);


GRANT INSERT,SELECT,UPDATE,DELETE ON MYSQL_LINK_DOC_002.T_TEST_MYSQL_002 TO user_mysql_002;

grant change_authorization to user_mysql_002; 

connect user user_mysql_002 password '123456';

insert into MYSQL_LINK_DOC_002.T_TEST_MYSQL_002 values(1,'zhangsan');

UPDATE MYSQL_LINK_DOC_002.T_TEST_MYSQL_002 SET ID = 2;

select * from MYSQL_LINK_DOC_002.T_TEST_MYSQL_002;

delete from MYSQL_LINK_DOC_002.T_TEST_MYSQL_002;

select * from MYSQL_LINK_DOC_002.T_TEST_MYSQL_002;

disconnect user_mysql_002;

