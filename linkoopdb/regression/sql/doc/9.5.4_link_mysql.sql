--Description: doc 9.5.4 link mysql
--Date：2020-07-14
--Author：丁婷

GRANT CREATE_SCHEMA TO USER;
CREATE DATABASE LINK MYSQL_LINK CONNECT TO 'TEST_USER' IDENTIFIED BY
'123456' USING 'jdbc:mysql://localhost:3306/test' PROPERTIES
('caseSensitive':'true');
209
TIP
• 需要将CREATE_SCHEMA权限授予给用户，用户才能创建DATABASE LINK。 • MYSQL JDBC DRIVER：com.mysql.jdbc.Driver 
• MYSQL的<CONNECTION_URL>：jdbc:mysql://<host>:<port>/<database> 其中，<host>
是MYSQL所在机器的ip或hostname，<port>为MYSQL的监听端口，默认值
是3306，<database>是MYSQL中待访问的数据库
• 目标MYSQL DB大小写敏感时，PROPERTIES中的caseSensitive设置为TRUE，大小写不敏感
时设置为FALSE。 PROPERTIES中的maxActive指定了LINKOOPDB读取MYSQL中的表时采用
的最大并发数
重载MYSQL DATABASE LINK
重新加载DATABASE LINK中关于表、视图等数据库对象的信息
语法： RELOAD DATABASE LINK <DBLINK_NAME>;
例：
RELOAD DATABASE LINK MYSQL_LINK;
删除MYSQL DATABASE LINK
清空LINKOOPDB中指定DATABASE LINK中的信息（并不会清空对应数据库中的信息）并删除这个DATABASE
LINK。
语法: DROP DATABASE LINK <DBLINK_NAME> [IF EXISTS] [CASCADE]
TIP
需要注意的是，当待删除的DATABASE LINK中有表、视图等对象时，需要使用CASCADE关键字将
其中的对象和DATABASE LINK本身一起删除。 否则，需要手动删除DATABASE LINK中的所有对象
后，再删除LINK本身。 例:
DROP DATABASE LINK MYSQL_LINK CASCADE;
修改MYSQL DATABASE LINK
语法： ALTER DATABASE LINK <DBLINK_NAME> CONNECT TO '<USER_NAME>' IDENTIFIED BY
'<PASSWORD>' USING '<CONNECTION_URL>' PROPERTIES ('caseSensitive':'<value>'[,
'maxActive':'<value>'])
例:
210
GRANT CREATE_SCHEMA TO USER;
ALTER DATABASE LINK MYSQL_LINK CONNECT TO 'TEST_USER' IDENTIFIED BY
'123456' USING 'jdbc:mysql://localhost:3306/test' PROPERTIES
('caseSensitive':'true');
当dblink里用到的用户的用户名或者密码被改变时，若想继续使用link,则需要用到ALTER TIP DATABASE LINK语句
通过MYSQL DATABASE LINK操作MYSQL中的对象
创建表
CREATE TABLE MYSQL_LINK.TEST (
ID INT,
NAME VARCHAR(20));
插入数据
INSERT INTO MYSQL_LINK.TEST VALUES (1,'zs');
更新数据
UPDATE MYSQL_LINK.TEST SET ID = 2; 删除数据
DELETE FROM MYSQL_LINK.TEST; 查询表
SELECT * FROM MYSQL_LINK.TEST; 创建视图
CREATE VIEW MYSQL_LINK.VIEW1 AS SELECT * from MYSQL_LINK.TEST; 查询视图
211
SELECT * FROM MYSQL_LINK.VIEW1; 添加列
create table MYSQL_LINK.TEST_COL ( c1 int, c2 VARCHAR(20), c3 smallint );
alter table MYSQL_LINK.TEST_COL add c5 float; 删除列
ALTER TABLE MYSQL_LINK.TEST_COL DROP COLUMN c3;
修改列名
ALTER table MYSQL_LINK.TEST_COL ALTER c2 RENAME TO salary;
修改列数据类型
create table MYSQL_LINK.TEST_ALT_COL_TYPE ( id int, name VARCHAR(20), age
int );
alter table MYSQL_LINK.TEST_ALT_COL_TYPE alter column name set data type
date;
alter table MYSQL_LINK.TEST_ALT_COL_TYPE alter column name set data type
timestamp
alter table MYSQL_LINK.TEST_ALT_COL_TYPE alter column name set data type
varchar(38);
alter table MYSQL_LINK.TEST_ALT_COL_TYPE alter column name set data type
DOUBLE;
alter table MYSQL_LINK.TEST_ALT_COL_TYPE alter column name set data type
decimal;
alter table MYSQL_LINK.TEST_ALT_COL_TYPE alter column name set data type
char(20);
alter table MYSQL_LINK.TEST_ALT_COL_TYPE alter column name set data type
float;
alter table MYSQL_LINK.TEST_ALT_COL_TYPE alter column name set data type
smallint;
alter table MYSQL_LINK.TEST_ALT_COL_TYPE alter column name set data type
DOUBLE; 添加主键
212
create table MYSQL_LINK.TEST_PK (id int, name VARCHAR(20), age int );
alter table MYSQL_LINK.TEST_PK add constraint pk_t02 primary key(id);
添加unique约束
create table MYSQL_LINK.TEST_UN (id int, name VARCHAR(20), age int );
ALTER TABLE MYSQL_LINK.TEST_UN ADD CONSTRAINT uc_t03 UNIQUE (name,age);
添加外键
create table MYSQL_LINK.TEST_01 ( id int, name VARCHAR(20), age int );
create table MYSQL_LINK.TEST_02 ( id int, name VARCHAR(20), age int );
alter table MYSQL_LINK.TEST_01 add constraint pk_t04 primary key(id);
alter table MYSQL_LINK.TEST_02 add constraint pk_t05 primary key(age);
ALTER TABLE MYSQL_LINK.TEST_01 ADD CONSTRAINT fk_t04 FOREIGN KEY(ID)
REFERENCES MYSQL_LINK.TEST_02(age);
MYSQL DATABASE LINK的权限控制 将对表的操作权限授予给用户。
GRANT INSERT,SELECT,UPDATE,DELETE ON MYSQL_LINK.TEST TO USER;