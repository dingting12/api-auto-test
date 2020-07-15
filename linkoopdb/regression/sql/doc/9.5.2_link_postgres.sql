--Description: doc 9.5.2 link postgres
--Date：2020-07-14
--Author：丁婷

GRANT CREATE_SCHEMA TO USER;
create database link POSTGRES_LINK connect to 'postgres' identified by
'linkoopdb' using 'jdbc:postgresql://192.168.1.73:5432/test'properties
('schema':'manyi','caseSensitive':'true');

RELOAD DATABASE LINK POSTGRES_LINK;

DROP DATABASE LINK POSTGRES_LINK;

GRANT CREATE_SCHEMA TO USER;
ALTER DATABASE LINK POSTGRES_LINK CONNECT TO 'postgres' IDENTIFIED BY
'linkoopdb' USING 'jdbc:postgresql://localhost:5432/postgres';


CREATE TABLE POSTGRES_LINK.TEST (
ID INT,
NAME VARCHAR(20));

INSERT INTO POSTGRES_LINK.TEST VALUES (1,'zs');
更新数据
UPDATE POSTGRES_LINK.TEST SET ID == 2; 删除数据
DELETE FROM POSTGRES_LINK.TEST; 查询表
SELECT * FROM POSTGRES_LINK.TEST; 创建视图
CREATE VIEW POSTGRES_LINK.VIEW1 AS SELECT * POSTGRES_LINK.TEST; 查询视图
202
SELECT * FROM POSTGRES_LINK.VIEW1; 添加列
create table POSTGRES_LINK.TEST_COL (c1 int, c2 VARCHAR(20), c3 smallint
);
alter table POSTGRES_LINK.TEST_COL add c6 bigint;
alter table POSTGRES_LINK.TEST_COL add c9 decimal;
alter table POSTGRES_LINK.TEST_COL add c10 date;
alter table POSTGRES_LINK.TEST_COL add c11 timestamp;
alter table POSTGRES_LINK.TEST_COL add c12 char(6);
删除列
ALTER TABLE POSTGRES_LINK.TEST_COL DROP COLUMN c11;
修改列名
ALTER table POSTGRES_LINK.TEST_COL ALTER c3 RENAME TO salary;
修改列数据类型
create table POSTGRES_LINK.test_alt_type (id int, age int, salary int);
alter table POSTGRES_LINK.test_alt_type alter column salary set data type
varchar(200);
alter table POSTGRES_LINK.test_alt_type alter column salary set data type
smallint;
alter table POSTGRES_LINK.test_alt_type alter column salary set data type
bigint;
alter table POSTGRES_LINK.test_alt_type alter column salary set data type
real;
alter table POSTGRES_LINK.test_alt_type alter column salary set data type
float;
alter table POSTGRES_LINK.test_alt_type alter column salary set data type
decimal(5,3);
alter table POSTGRES_LINK.test_alt_type alter column salary set data type
numeric(5,3);
alter table POSTGRES_LINK.test_alt_type alter column salary set data type
char(10);
alter table POSTGRES_LINK.test_alt_type alter column salary set data type
varchar(10);
203
添加外键
create table POSTGRES_LINK.TEST_01 ( id int, name VARCHAR(20), age int );
create table POSTGRES_LINK.TEST_02 ( id int, name VARCHAR(20), age int );
alter table POSTGRES_LINK.TEST_01 add constraint pk_t04 primary key(id);
alter table POSTGRES_LINK.TEST_02 add constraint pk_t05 primary key(age);
ALTER TABLE POSTGRES_LINK.TEST_01 ADD CONSTRAINT fk_t04 FOREIGN KEY(ID)
REFERENCES POSTGRES_LINK.TEST_02(age);
添加 UNIQUE 约束
create table POSTGRES_LINK.TEST_UN ( id int, name VARCHAR(20), age int );
ALTER TABLE POSTGRES_LINK.TEST_UN ADD CONSTRAINT uc_t03 UNIQUE (name,
age);
添加主键
create table POSTGRES_LINK.TEST_PK ( id int, name VARCHAR(20), age int );
alter table POSTGRES_LINK.TEST_PK add constraint pk_t02 primary key(id);
POSTGRES DATABASE LINK的权限控制 将对表的操作权限授予给用户。
GRANT INSERT,SELECT,UPDATE,DELETE ON POSTGRES_LINK.TEST TO USER;