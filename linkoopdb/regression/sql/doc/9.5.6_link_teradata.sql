--Description: doc 9.5.6 link teradata
--Date：2020-07-14
--Author：丁婷

create database link td_link connect to 'testdblink' identified by
'testdblink' using
'jdbc:teradata://192.168.2.207/CLIENT_CHARSET==cp936,TMODE==TERA,CHARSET==
ASCII,LOB_SUPPORT==off,COLUMN_NAME == ON,MAYBENULL ==
ON,database==testdblinkbase' properties ('host':'192.168.2.207' ,
'schema':'testdblinkbase');

RELOAD DATABASE LINK TERADATA_LINK;
删除TERADATA DATABASE LINK
清空LINKOOPDB中指定DATABASE LINK中的信息（并不会清空对应数据库中的信息）并删除这个DATABASE
LINK。
语法: DROP DATABASE LINK <DBLINK_NAME> [IF EXISTS] [CASCADE]
TIP
需要注意的是，当待删除的DATABASE LINK中有表、视图等对象时，需要使用CASCADE关键字将
其中的对象和DATABASE LINK本身一起删除。 否则，需要手动删除DATABASE LINK中的所有对象
后，再删除LINK本身。 例:
DROP DATABASE LINK TERADATA_LINK IF EXISTS CASCADE;
修改TERADATA DATABASE LINK
语法： ALTER DATABASE LINK <DBLINK_NAME> CONNECT TO '<USER_NAME>' IDENTIFIED BY '' USING
'<CONNECTION_URL>' PROPERTIES ('SCHEMA':''[, 'host':''])
例:
ALTER database link td_link connect to 'testdblink' identified by
'testdblink' using
'jdbc:teradata://192.168.2.207/CLIENT_CHARSET==cp936,TMODE==TERA,CHARSET==
ASCII,LOB_SUPPORT==off,COLUMN_NAME == ON,MAYBENULL ==
ON,database==testdblinkbase' properties ('host':'192.168.2.207' ,
'schema':'testdblinkbase');
TIP 当dblink里用到的用户的用户名或者密码被改变时，若想继续使用link,则需要用到ALTER
DATABASE LINK语句
通过TERADATA DATABASE LINK操作TERADATA中的对象
创建表
CREATE TABLE TERADATA_LINK.TEST (
ID INT,
NAME VARCHAR(20));
插入数据
217
INSERT INTO TERADATA_LINK.TEST VALUES (1,'zs');
更新数据
UPDATE TERADATA_LINK.TEST SET ID == 2; 删除数据
DELETE FROM TERADATA_LINK.TEST; 查询表
SELECT * FROM TERADATA_LINK.TEST; 创建视图
CREATE VIEW TERADATA_LINK.VIEW1 AS SELECT * TERADATA_LINK.TEST; 查询视图
SELECT * FROM TERADATA_LINK.VIEW1; 添加列
create table TERADATA_LINK.TEST_COL ( c1 int, c2 VARCHAR(20), c3 smallint
);
alter table TERADATA_LINK.TEST_COL add c6 bigint;
alter table TERADATA_LINK.TEST_COL add c9 decimal;
alter table TERADATA_LINK.TEST_COL add c10 date;
alter table TERADATA_LINK.TEST_COL add c11 timestamp;
alter table TERADATA_LINK.TEST_COL add c12 char(6);
删除列TERADATA_LINK
ALTER TABLE TERADATA_LINK.TEST_COL DROP COLUMN c11;
修改列名
218
ALTER table TERADATA_LINK.TEST_COL ALTER C3 RENAME TO salary; 列添加默认值
alter table TERADATA_LINK.TEST_COL alter column C3 set default 1; 列删除默认值
alter table TERADATA_LINK.TEST_COL alter column C3 drop default; 设置列为非空
create table TERADATA_LINK.TEST_PK ( id int, name VARCHAR(20), age int );
alter table TERADATA_LINK.TEST_PK alter column age set not null; 添加主键
alter table TERADATA_LINK.TEST_PK add constraint pk_t02 primary key(age);
添加unique约束
create table TERADATA_LINK.TEST_UN ( id int, name VARCHAR(20), age int );
ALTER TABLE TERADATA_LINK.TEST_UN ADD CONSTRAINT uc_t03 UNIQUE (name,
age);
添加外键
219
create table TERADATA_LINK.TEST_01 (age int, name VARCHAR(20), id int);
create table TERADATA_LINK.TEST_02 ( id int , name VARCHAR(20), age int);
alter table TERADATA_LINK.TEST_01 alter column id set not null;
alter table TERADATA_LINK.TEST_01 add constraint pk_t04 primary key(id);
alter table TERADATA_LINK.TEST_02 alter column age set not null;
alter table TERADATA_LINK.TEST_02 add constraint pk_t05 primary key(age);
ALTER TABLE TERADATA_LINK.TEST_01 ADD CONSTRAINT fk_t04 FOREIGN KEY(ID)
REFERENCES TERADATA_LINK.TEST_02(age);
TERADATA_LINK DATABASE LINK的权限控制 将对表的操作权限授予给用户。
GRANT INSERT,SELECT,UPDATE,DELETE ON TERADATA_LINK.TEST TO USER;