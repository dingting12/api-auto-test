--Description: doc 9.5.6 link teradata
--Date：2020-07-14
--Author：丁婷

drop database link td_link_doc_001 if exists cascade;

create database link td_link_doc_001 connect to 'testdblink' identified by
'testdblink' 
USING 'jdbc:teradata://192.168.1.136/CLIENT_CHARSET=cp936,TMODE=TERA,CHARSET=ASCII,LOB_SUPPORT=ON,COLUMN_NAME = ON,MAYBENULL = ON,database=testdblinkbase'
PROPERTIES ('host':'192.168.1.136' , 'schema':'testdblinkbase');



RELOAD DATABASE LINK td_link_doc_001;

DROP DATABASE LINK td_link_doc_001 IF EXISTS CASCADE;

create database link td_link_doc_001 connect to 'testdblink' identified by
'testdblink' 
USING 'jdbc:teradata://192.168.1.136/CLIENT_CHARSET=cp936,TMODE=TERA,CHARSET=ASCII,LOB_SUPPORT=ON,COLUMN_NAME = ON,MAYBENULL = ON,database=testdblinkbase'
PROPERTIES ('host':'192.168.1.136' , 'schema':'testdblinkbase');

alter database link td_link_doc_001 connect to 'testdblink' identified by
'testdblink' 
USING 'jdbc:teradata://192.168.1.136/CLIENT_CHARSET=cp936,TMODE=TERA,CHARSET=ASCII,LOB_SUPPORT=ON,COLUMN_NAME = ON,MAYBENULL = ON,database=testdblinkbase'
PROPERTIES ('host':'192.168.1.136' , 'schema':'testdblinkbase');




DROP TABLE td_link_doc_001.T_TEST_TD_001 IF EXISTS cascade;

CREATE TABLE td_link_doc_001.T_TEST_TD_001 (
ID INT,
NAME VARCHAR(20)
);

INSERT INTO td_link_doc_001.T_TEST_TD_001 VALUES (1,'zs');

SELECT * FROM td_link_doc_001.T_TEST_TD_001; 

UPDATE td_link_doc_001.T_TEST_TD_001 SET ID = 2;

SELECT * FROM td_link_doc_001.T_TEST_TD_001; 

DELETE FROM td_link_doc_001.T_TEST_TD_001; 

SELECT * FROM td_link_doc_001.T_TEST_TD_001; 

drop view td_link_doc_001.T_VIEW1 if exists;

INSERT INTO td_link_doc_001.T_TEST_TD_001 VALUES (1,'zs');

CREATE VIEW td_link_doc_001.T_VIEW1 AS SELECT * from td_link_doc_001.T_TEST_TD_001; 

SELECT * FROM td_link_doc_001.T_VIEW1; 



DROP TABLE td_link_doc_001.TEST_COL IF EXISTS cascade;

create table td_link_doc_001.TEST_COL ( c1 int, c2 VARCHAR(20), c3 smallint
);

alter table td_link_doc_001.TEST_COL add c6 bigint;
alter table td_link_doc_001.TEST_COL add c9 decimal;
alter table td_link_doc_001.TEST_COL add c10 date;
alter table td_link_doc_001.TEST_COL add c11 timestamp;
alter table td_link_doc_001.TEST_COL add c12 char(6);

show create table td_link_doc_001.TEST_COL;

ALTER TABLE td_link_doc_001.TEST_COL DROP COLUMN c11;

show create table td_link_doc_001.TEST_COL;

ALTER table td_link_doc_001.TEST_COL ALTER C3 RENAME TO salary; 

show create table td_link_doc_001.TEST_COL;

alter table td_link_doc_001.TEST_COL alter column C6 set default 1; 

show create table td_link_doc_001.TEST_COL;

alter table td_link_doc_001.TEST_COL alter column C6 drop default; 

show create table td_link_doc_001.TEST_COL;






DROP TABLE td_link_doc_001.TEST_TD_PK IF EXISTS cascade;

create table td_link_doc_001.TEST_TD_PK ( id int, name VARCHAR(20), age int );
alter table td_link_doc_001.TEST_TD_PK alter column age set not null; 

alter table td_link_doc_001.TEST_TD_PK add constraint pk_t02 primary key(age);

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='TEST_TD_PK' and CONSTRAINT_NAME='PK_T02';




DROP TABLE td_link_doc_001.TEST_TD_UN IF EXISTS cascade;
create table td_link_doc_001.TEST_TD_UN ( id int, name VARCHAR(20), age int );
ALTER TABLE td_link_doc_001.TEST_TD_UN ADD CONSTRAINT uc_t03 UNIQUE (name,
age);
select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS where TABLE_NAME='TEST_TD_UN' and CONSTRAINT_NAME='UC_T03';



DROP TABLE td_link_doc_001.T_TD_FR_01 IF EXISTS cascade;
DROP TABLE td_link_doc_001.T_TD_FR_02 IF EXISTS cascade;
create table td_link_doc_001.T_TD_FR_01 (age int, name VARCHAR(20), id int);
create table td_link_doc_001.T_TD_FR_02 ( id int , name VARCHAR(20), age int);
alter table td_link_doc_001.T_TD_FR_01 alter column id set not null;
alter table td_link_doc_001.T_TD_FR_01 add constraint pk_t04 primary key(id);
alter table td_link_doc_001.T_TD_FR_02 alter column age set not null;
alter table td_link_doc_001.T_TD_FR_02 add constraint pk_t05 primary key(age);
ALTER TABLE td_link_doc_001.T_TD_FR_01 ADD CONSTRAINT fk_t040 FOREIGN KEY(ID)
REFERENCES td_link_doc_001.T_TD_FR_02(age);






connect user admin password '123456';

drop user user_td_001 if exists cascade;

drop DATABASE LINK td_link_doc_002 if exists cascade;

CREATE USER user_td_001 PASSWORD '123456';

create database link td_link_doc_002 connect to 'testdblink' identified by
'testdblink' 
USING 'jdbc:teradata://192.168.1.136/CLIENT_CHARSET=cp936,TMODE=TERA,CHARSET=ASCII,LOB_SUPPORT=ON,COLUMN_NAME = ON,MAYBENULL = ON,database=testdblinkbase'
PROPERTIES ('host':'192.168.1.136' , 'schema':'testdblinkbase');



DROP table td_link_doc_002.T_TEST_td_002 if exists;

CREATE TABLE td_link_doc_002.T_TEST_td_002 (
ID INT,
NAME VARCHAR(20)
);


GRANT INSERT,SELECT,UPDATE,DELETE ON td_link_doc_002.T_TEST_td_002 TO user_td_001;

grant change_authorization to user_td_001; 

connect user user_td_001 password '123456';

insert into td_link_doc_002.T_TEST_td_002 values(1,'zhangsan');

select * from td_link_doc_002.T_TEST_td_002;

UPDATE td_link_doc_002.T_TEST_td_002 SET ID = 2;

select * from td_link_doc_002.T_TEST_td_002;

delete from td_link_doc_002.T_TEST_td_002;

select * from td_link_doc_002.T_TEST_td_002;