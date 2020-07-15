--Description: doc 9.5.1 link oracle
--Date：2020-07-14
--Author：丁婷

GRANT CREATE_SCHEMA TO USER;

CREATE DATABASE LINK ORACLE_LINK CONNECT TO 'LINKOOPDB' IDENTIFIED BY
'123456' USING 'jdbc:oracle:thin:@localhost:1521:orcl'
properties('maxActive':'10','otherUsers':'TEMP,SYSTEM');

RELOAD DATABASE LINK ORACLE_LINK;

DROP DATABASE LINK ORACLE_LINK;

GRANT CREATE_SCHEMA TO USER;

ALTER DATABASE LINK ORACLE_LINK CONNECT TO 'LINKOOPDB' IDENTIFIED BY
'123456' USING 'jdbc:oracle:thin:@localhost:1521:orcl'
properties('maxActive':'10','otherUsers':'TEMP,SYSTEM');

CREATE TABLE ORACLE_LINK.TEST (
ID INT,
NAME VARCHAR(20));


INSERT INTO ORACLE_LINK.TEST VALUES (1,'zs');

UPDATE ORACLE_LINK.TEST SET ID = 2;

DELETE FROM ORACLE_LINK.TEST;

SELECT * FROM ORACLE_LINK.TEST;

CREATE VIEW ORACLE_LINK.VIEW1 AS SELECT * FROM ORACLE_LINK.TEST;

SELECT * FROM ORACLE_LINK.VIEW1;

create table ORACLE_LINK.test_table_for_synonym (col1 int, col2 varchar
(200));

create synonym ORACLE_LINK.synonym_for_test for ORACLE_LINK
.test_table_for_synonym;

drop synonym ORACLE_LINK.synonym_for_test if exists;

create table ORACLE_LINK.TESTCOL ( id int, name VARCHAR(20), age int );
alter table ORACLE_LINK.TESTCOL add phone int;
alter table ORACLE_LINK.TESTCOL add salary int;

ALTER TABLE ORACLE_LINK.TESTCOL DROP COLUMN name;
ALTER TABLE ORACLE_LINK.TESTCOL DROP COLUMN phone;

ALTER table ORACLE_LINK.TESTCOL ALTER age RENAME TO name;

alter table ORACLE_LINK.TESTCOL alter column name set data type varchar(
38);
alter table ORACLE_LINK.TESTCOL alter column name set data type DOUBLE;

create table ORACLE_LINK.TEST (id int, name varchar(20));
alter table ORACLE_LINK.TEST add constraint pk_O2 primary key(id);

create table ORACLE_LINK.TESTUN (id int, name VARCHAR(20), age int );
ALTER TABLE ORACLE_LINK.TESTUN ADD CONSTRAINT uc_O3 UNIQUE (name,age);

create table ORACLE_LINK.TEST_01 (id int, name VARCHAR(20), age int );
create table ORACLE_LINK.TEST_02 (id int, name VARCHAR(20), age int );
alter table ORACLE_LINK.TEST_01 add constraint pk_O4 primary key(id);
alter table ORACLE_LINK.TEST_02 add constraint pk_O5 primary key(age);
ALTER TABLE ORACLE_LINK.TEST_01 ADD CONSTRAINT fk_O4 FOREIGN KEY(ID)
REFERENCES ORACLE_LINK.TEST_02(age);


GRANT INSERT,SELECT,UPDATE,DELETE ON ORACLE_LINK.TEST TO USER;

