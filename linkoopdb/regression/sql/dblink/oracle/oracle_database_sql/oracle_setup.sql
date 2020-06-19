--Description:oracleDDL、DML、DQL
--Date：2020-06-15
--Author：王煜
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

--记录执行时间
set TIMING on
--返回结果
set TERMOUT on
--是否打印执行的SQL语句
set ECHO ON


--------------------------------------------------------
--user_name

---命名

----英文命名及大小写
DROP USER u_Test_DBlink1 CASCADE;

CREATE USER u_Test_DBlink1 IDENTIFIED BY 123456;

GRANT dba TO u_Test_DBlink1;

connect U_TEST_DBLINK1/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE u_Test_DBlink1.t_dblink_wy1;

CREATE TABLE u_Test_DBlink1.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_Test_DBlink1.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_Test_DBlink1.t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='U_TEST_DBLINK1';

DROP USER "u_Test_DBlink1" CASCADE;

CREATE USER "u_Test_DBlink1" IDENTIFIED BY 123456;

GRANT dba TO "u_Test_DBlink1";

connect u_Test_DBlink1/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE "u_Test_DBlink1".t_dblink_wy1;

CREATE TABLE "u_Test_DBlink1".t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO "u_Test_DBlink1".t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM "u_Test_DBlink1".t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='u_Test_DBlink1';

----中文命名
DROP USER 工具人1号 CASCADE;

CREATE USER 工具人1号 IDENTIFIED BY 123456;

GRANT dba TO 工具人1号;

connect 工具人1号/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE 工具人1号.t_dblink_wy1;

CREATE TABLE 工具人1号.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO 工具人1号.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM 工具人1号.t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='工具人1号';

DROP USER "工具人耄耋貔貅" CASCADE;

CREATE USER "工具人耄耋貔貅" IDENTIFIED BY 123456;

GRANT dba TO "工具人耄耋貔貅";

connect 工具人耄耋貔貅/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE "工具人耄耋貔貅".t_dblink_wy1;

CREATE TABLE "工具人耄耋貔貅".t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO "工具人耄耋貔貅".t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM "工具人耄耋貔貅".t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='工具人耄耋貔貅';

----中英文混合加特殊字符加大小写
DROP USER "U_DBlink@!@$%#(*特朗普" CASCADE;

CREATE USER "U_DBlink@!@$%#(*特朗普" IDENTIFIED BY 123456;

GRANT dba TO "U_DBlink@!@$%#(*特朗普";

connect "U_DBlink@!@$%#(*特朗普"/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE "U_DBlink@!@$%#(*特朗普".t_dblink_wy1;

CREATE TABLE "U_DBlink@!@$%#(*特朗普".t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO "U_DBlink@!@$%#(*特朗普".t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM "U_DBlink@!@$%#(*特朗普".t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='U_DBlink@!@$%#(*特朗普';

---权限

----用户有远程访问权限
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission1 CASCADE;

CREATE USER u_dblink_permission1 IDENTIFIED BY 123456;

GRANT CREATE SESSION TO u_dblink_permission1;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION1'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION1'); 

----用户有创建，删除，修改 table的权限
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission2 CASCADE;

CREATE USER u_dblink_permission2 IDENTIFIED BY 123456;

GRANT CREATE SESSION TO u_dblink_permission2;

GRANT RESOURCE,CONNECT TO u_dblink_permission2;

GRANT CREATE TABLE TO u_dblink_permission2;

GRANT DROP ANY TABLE TO u_dblink_permission2;

GRANT ALTER ANY TABLE TO u_dblink_permission2;

connect u_dblink_permission2/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE u_dblink_permission2.t_dblink_wy1;

CREATE TABLE u_dblink_permission2.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission2.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_permission2.t_dblink_wy1 ORDER BY id;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION2'
union
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION2');

connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission3 CASCADE;

CREATE USER u_dblink_permission3 IDENTIFIED BY 123456;

GRANT CREATE SESSION TO u_dblink_permission3;

GRANT RESOURCE,CONNECT TO u_dblink_permission3;

GRANT CREATE ANY TABLE TO u_dblink_permission3;

GRANT DROP ANY TABLE TO u_dblink_permission3;

GRANT ALTER ANY TABLE TO u_dblink_permission3;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION3'
union
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION3');

connect u_dblink_permission3/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE u_dblink_permission3.t_dblink_wy1;

CREATE TABLE u_dblink_permission3.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission3.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_permission3.t_dblink_wy1 ORDER BY id;

----用户有创建，删除view的权限
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission4 CASCADE;

CREATE USER u_dblink_permission4 IDENTIFIED BY 123456;

GRANT CREATE SESSION TO u_dblink_permission4;

GRANT RESOURCE,CONNECT TO u_dblink_permission4;

GRANT CREATE VIEW TO u_dblink_permission4;

GRANT DROP ANY VIEW TO u_dblink_permission4;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION4'
union
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION4');

connect u_dblink_permission4/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_permission4.v_dblink_wy1;

DROP TABLE u_dblink_permission4.t_dblink_wy1;

CREATE TABLE u_dblink_permission4.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission4.t_dblink_wy1 VALUES(1,'冬日热可可');

CREATE VIEW u_dblink_permission4.v_dblink_wy1 AS
SELECT * FROM u_dblink_permission4.t_dblink_wy1;

SELECT * FROM u_dblink_permission4.v_dblink_wy1 ORDER BY id;

connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission5 CASCADE;

CREATE USER u_dblink_permission5 IDENTIFIED BY 123456;

GRANT CREATE SESSION TO u_dblink_permission5;

GRANT RESOURCE,CONNECT TO u_dblink_permission5;

GRANT CREATE ANY VIEW TO u_dblink_permission5;

GRANT DROP ANY VIEW TO u_dblink_permission5;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION5'
union
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION5');

connect u_dblink_permission5/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_permission5.v_dblink_wy1;

DROP TABLE u_dblink_permission5.t_dblink_wy1;

CREATE TABLE u_dblink_permission5.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission5.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_permission5.t_dblink_wy1 ORDER BY id;

CREATE VIEW u_dblink_permission5.v_dblink_wy1 AS
SELECT * FROM u_dblink_permission5.t_dblink_wy1;

SELECT * FROM u_dblink_permission5.v_dblink_wy1 ORDER BY id;

----用户有创建proc的权限
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission6 CASCADE;

CREATE USER u_dblink_permission6 IDENTIFIED BY 123456;

GRANT CREATE SESSION TO u_dblink_permission6;

GRANT RESOURCE,CONNECT TO u_dblink_permission6;

GRANT CREATE PROCEDURE TO u_dblink_permission6;

GRANT DROP ANY PROCEDURE TO u_dblink_permission6;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION6'
union
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION6');

connect u_dblink_permission6/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP PROCEDURE u_dblink_permission6.p_dblink_1;

CREATE OR REPLACE PROCEDURE u_dblink_permission6.p_dblink_1
(
--定义输入、输出参数--
num_A IN INTEGER,
num_B IN INTEGER,
numType IN INTEGER,
num_C OUT INTEGER
)
AS
--定义变量--
 -- numCount integer;
 -- numStr varchar(20);
BEGIN
     --判断计算类型--
     IF numType=1 THEN
        num_C := num_A + num_B;
     ELSIF numType=2 THEN
        num_C := num_A - num_B;
     ELSIF numType=3 THEN
        num_C := num_A * num_B;
     ELSIF numType=4 THEN
        num_C := num_A / num_B;
     ELSE
     --其它处理
       dbms_output.put_line('其它处理');
     END IF;
END;
/

DECLARE num_C INTEGER;
BEGIN
   --调用存储过程---
   u_dblink_permission6.p_dblink_1(3,4,3,num_C);
   dbms_output.put_line('输出结果：'|| num_C );
END;
/

connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission7 CASCADE;

CREATE USER u_dblink_permission7 IDENTIFIED BY 123456;

GRANT CREATE SESSION TO u_dblink_permission7;

GRANT RESOURCE,CONNECT TO u_dblink_permission7;

GRANT CREATE ANY PROCEDURE TO u_dblink_permission7;

GRANT DROP ANY PROCEDURE TO u_dblink_permission7;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION7'
union
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION7');

connect u_dblink_permission7/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP PROCEDURE u_dblink_permission7.p_dblink_1;

CREATE OR REPLACE PROCEDURE u_dblink_permission7.p_dblink_1
(
--定义输入、输出参数--
num_A IN INTEGER,
num_B IN INTEGER,
numType IN INTEGER,
num_C OUT INTEGER
)
AS
--定义变量--
 -- numCount integer;
 -- numStr varchar(20);
BEGIN
     --判断计算类型--
     IF numType=1 THEN
        num_C := num_A + num_B;
     ELSIF numType=2 THEN
        num_C := num_A - num_B;
     ELSIF numType=3 THEN
        num_C := num_A * num_B;
     ELSIF numType=4 THEN
        num_C := num_A / num_B;
     ELSE
     --其它处理
       dbms_output.put_line('其它处理');
     END IF;
END;
/

DECLARE num_C INTEGER;
BEGIN
   --调用存储过程---
   u_dblink_permission7.p_dblink_1(3,4,3,num_C);
   dbms_output.put_line('输出结果：'|| num_C );
END;
/

----用户有查询的权限
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission8 CASCADE;

CREATE USER u_dblink_permission8 IDENTIFIED BY 123456;

GRANT RESOURCE,CONNECT TO u_dblink_permission8;

GRANT CREATE ANY PROCEDURE TO u_dblink_permission8;

GRANT SELECT ANY TABLE TO u_dblink_permission8;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION8'
union
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION8');

connect u_dblink_permission8/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_permission8.v_dblink_wy1;

DROP TABLE u_dblink_permission8.t_dblink_wy1;

CREATE TABLE u_dblink_permission8.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission8.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_permission8.t_dblink_wy1 ORDER BY id;

CREATE VIEW u_dblink_permission8.v_dblink_wy1 AS
SELECT * FROM u_dblink_permission8.t_dblink_wy1;

SELECT * FROM u_dblink_permission8.v_dblink_wy1 ORDER BY id;

SELECT * FROM u_dblink_permission4.v_dblink_wy1 ORDER BY id;


----用户有插入的权限
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission9 CASCADE;

CREATE USER u_dblink_permission9 IDENTIFIED BY 123456;

GRANT RESOURCE,CONNECT TO u_dblink_permission9;

GRANT CREATE ANY PROCEDURE TO u_dblink_permission9;

GRANT INSERT ANY TABLE TO u_dblink_permission9;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION9'
union
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION9');

connect u_dblink_permission9/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_permission9.v_dblink_wy1;

DROP TABLE u_dblink_permission9.t_dblink_wy1;

CREATE TABLE u_dblink_permission9.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission9.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_permission9.t_dblink_wy1 ORDER BY id;

CREATE VIEW u_dblink_permission9.v_dblink_wy1 AS
SELECT * FROM u_dblink_permission9.t_dblink_wy1;

SELECT * FROM u_dblink_permission9.v_dblink_wy1 ORDER BY id;


----用户有更新的权限
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission10 CASCADE;

CREATE USER u_dblink_permission10 IDENTIFIED BY 123456;

GRANT RESOURCE,CONNECT TO u_dblink_permission10;

GRANT CREATE ANY PROCEDURE TO u_dblink_permission10;

GRANT UPDATE ANY TABLE TO u_dblink_permission10;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION10'
union
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION10');

connect u_dblink_permission10/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_permission10.v_dblink_wy1;

DROP TABLE u_dblink_permission10.t_dblink_wy1;

CREATE TABLE u_dblink_permission10.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission10.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_permission10.t_dblink_wy1 ORDER BY id;

UPDATE u_dblink_permission10.t_dblink_wy1
SET name = '病毒死翘翘'
WHERE id = 1;

CREATE VIEW u_dblink_permission10.v_dblink_wy1 AS
SELECT * FROM u_dblink_permission10.t_dblink_wy1;

SELECT * FROM u_dblink_permission10.v_dblink_wy1 ORDER BY id;

----用户有删除的权限
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission11 CASCADE;

CREATE USER u_dblink_permission11 IDENTIFIED BY 123456;

GRANT RESOURCE,CONNECT TO u_dblink_permission11;

GRANT CREATE ANY PROCEDURE TO u_dblink_permission11;

GRANT DELETE ANY TABLE TO u_dblink_permission11;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION11'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION11');

connect u_dblink_permission11/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_permission11.v_dblink_wy1;

DROP TABLE u_dblink_permission11.t_dblink_wy1;

CREATE TABLE u_dblink_permission11.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission11.t_dblink_wy1 VALUES(1,'我来试验一下'),(2,'时势造英雄');

SELECT * FROM u_dblink_permission11.t_dblink_wy1 ORDER BY id;

UPDATE u_dblink_permission11.t_dblink_wy1
SET name = '病毒死翘翘'
WHERE id = 1;

DELETE FROM u_dblink_permission11.t_dblink_wy1
WHERE id = 2;

CREATE VIEW u_dblink_permission11.v_dblink_wy1 AS
SELECT * FROM u_dblink_permission11.t_dblink_wy1;

SELECT * FROM u_dblink_permission11.v_dblink_wy1 ORDER BY id;

----用户无任何权限
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission CASCADE;

CREATE USER u_dblink_permission IDENTIFIED BY 123456;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION'); 


--password

---英文及大小写
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_password1 CASCADE;

CREATE USER u_dblink_password1 IDENTIFIED BY csHIKHBNUgdjK;

GRANT dba TO u_dblink_password1;

connect u_dblink_password1/csHIKHBNUgdjK@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_password1.v_dblink_wy1;

DROP TABLE u_dblink_password1.t_dblink_wy1;

CREATE TABLE u_dblink_password1.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_password1.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_password1.t_dblink_wy1 ORDER BY id;

CREATE VIEW u_dblink_password1.v_dblink_wy1 AS
SELECT * FROM u_dblink_password1.t_dblink_wy1;

SELECT * FROM u_dblink_password1.v_dblink_wy1 ORDER BY id;

---中文
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_password2 CASCADE;

CREATE USER u_dblink_password2 IDENTIFIED BY 这是一个密码;

GRANT dba TO u_dblink_password2;

connect u_dblink_password2/这是一个密码@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_password2.v_dblink_wy1;

DROP TABLE u_dblink_password2.t_dblink_wy1;

CREATE TABLE u_dblink_password2.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_password2.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_password2.t_dblink_wy1 ORDER BY id;

CREATE VIEW u_dblink_password2.v_dblink_wy1 AS
SELECT * FROM u_dblink_password2.t_dblink_wy1;

SELECT * FROM u_dblink_password2.v_dblink_wy1 ORDER BY id;

---中英文混合加特殊字符加大小写
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_password3 CASCADE;

CREATE USER u_dblink_password3 IDENTIFIED BY "^&*SDfbj%^$&^红烧冬1278_84";

GRANT dba TO u_dblink_password3;

connect u_dblink_password3/^&*SDfbj%^$&^红烧冬1278_84@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_password3.v_dblink_wy1;

DROP TABLE u_dblink_password3.t_dblink_wy1;

CREATE TABLE u_dblink_password3.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_password3.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_password3.t_dblink_wy1 ORDER BY id;

CREATE VIEW u_dblink_password3.v_dblink_wy1 AS
SELECT * FROM u_dblink_password3.t_dblink_wy1;

SELECT * FROM u_dblink_password3.v_dblink_wy1 ORDER BY id;

---修改其他数据库的用户的密码，查看dblink是否还能正常使用
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission12 CASCADE;

CREATE USER u_dblink_permission12 IDENTIFIED BY "123456";

GRANT dba TO u_dblink_permission12;

connect u_dblink_permission12/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_permission12.v_dblink_wy1;

DROP TABLE u_dblink_permission12.t_dblink_wy1;

CREATE TABLE u_dblink_permission12.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission12.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_permission12.t_dblink_wy1 ORDER BY id;

CREATE VIEW u_dblink_permission12.v_dblink_wy1 AS
SELECT * FROM u_dblink_permission12.t_dblink_wy1;

SELECT * FROM u_dblink_permission12.v_dblink_wy1 ORDER BY id;

---其他数据库的用户密码过期后，查看dblink是否还能正常使用
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_permission13 CASCADE;

CREATE USER u_dblink_permission13 IDENTIFIED BY "123456";

GRANT dba TO u_dblink_permission13;

connect u_dblink_permission13/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP VIEW u_dblink_permission13.v_dblink_wy1;

DROP TABLE u_dblink_permission13.t_dblink_wy1;

CREATE TABLE u_dblink_permission13.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission13.t_dblink_wy1 VALUES(1,'我来试验一下');

SELECT * FROM u_dblink_permission13.t_dblink_wy1 ORDER BY id;

CREATE VIEW u_dblink_permission13.v_dblink_wy1 AS
SELECT * FROM u_dblink_permission13.t_dblink_wy1;

SELECT * FROM u_dblink_permission13.v_dblink_wy1 ORDER BY id;


--建表
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_grammar_cover CASCADE;

CREATE USER u_dblink_grammar_cover identified BY 123456;

GRANT dba TO u_dblink_grammar_cover;

connect u_dblink_grammar_cover/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE u_dblink_grammar_cover.t_dblink_datatype1;

CREATE TABLE u_dblink_grammar_cover.t_dblink_datatype1(id INT,tchar CHAR(200),tvarchar2 VARCHAR2(200),ttimestamp1 TIMESTAMP,
                                tnumber NUMBER(10,2),tdate DATE,tlong LONG,tfloat FLOAT,
                                traw RAW(100),tblob BLOB,ttimestamp2 TIMESTAMP(6),
                                tclob CLOB,tnclob NCLOB,tbinary_float BINARY_FLOAT,tbinary_double BINARY_DOUBLE,
                                ttimestamp3 TIMESTAMP WITH TIME ZONE,ttimestamp4 TIMESTAMP WITH LOCAL TIME ZONE,
                                trowid ROWID,turowid UROWID);

INSERT INTO u_dblink_grammar_cover.t_dblink_datatype1 VALUES(1,'cdsfdfd','北朝鲜难民bdjs',TIMESTAMP '2015-03-04 01:30:59',
                                                             23143.54,DATE '2015-07-02',234243434,23245.6565,
                                                             utl_raw.cast_to_raw('This is a rawtype test!'),utl_raw.cast_to_raw('This is a rawtype test!'),TIMESTAMP '2020-01-01 12:12:12',
                                                             'cdcdds','vfgfgfg',1212.232,4343.454,
                                                             TO_TIMESTAMP_TZ('2020-01-01 11:00:00 -05:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),TO_TIMESTAMP_TZ('1999-12-12 12:12:12 +08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);           
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype1 VALUES(2,'xcdbfhjdm','南朝鲜难民xjkl',TIMESTAMP '2020-12-23 21:04:01',
                                                             5465.23,DATE '2020-12-02',4565565,56.7676,
                                                             utl_raw.cast_to_raw('hello world'),utl_raw.cast_to_raw('这是一句话'),TIMESTAMP '2020-05-29 21:21:21',
                                                             '你说什么','我听不见',454.656,8965.65,
                                                             TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),TO_TIMESTAMP_TZ('2020-01-01 11:00:00 -08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);                                                                   
                                
SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype1 ORDER BY id;

DROP TABLE u_dblink_grammar_cover.t_dblink_datatype2;

CREATE TABLE u_dblink_grammar_cover.t_dblink_datatype2(id INT,tchar CHAR(200),tvarchar2 VARCHAR2(200),ttimestamp1 TIMESTAMP,
                                tnumber NUMBER(10,2),tdate DATE,tfloat FLOAT,
                                traw RAW(100),tlongraw LONG RAW,tblob BLOB,ttimestamp2 TIMESTAMP(6),
                                tclob CLOB,tnclob NCLOB,tbinary_float BINARY_FLOAT,tbinary_double BINARY_DOUBLE,
                                ttimestamp3 TIMESTAMP WITH TIME ZONE,ttimestamp4 TIMESTAMP WITH LOCAL TIME ZONE,
                                trowid ROWID,turowid UROWID);
                                
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype2 VALUES(1,'cdsfdfd','北朝鲜难民bdjs',TIMESTAMP '2015-03-04 01:30:59',
                                                             23143.54,DATE '2015-07-02',23245.6565,
                                                             utl_raw.cast_to_raw('This is a rawtype test!'),utl_raw.cast_to_raw('121212'),utl_raw.cast_to_raw('This is a rawtype test!'),TIMESTAMP '2020-01-01 12:12:12',
                                                             'cdcdds','vfcvfgfgd',1212.232,4343.454,
                                                             TO_TIMESTAMP_TZ('1998-02-26 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);    
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype2 VALUES(2,'xcdbfhjdm','南朝鲜难民xjkl',TIMESTAMP '2020-12-23 21:04:01',
                                                             5465.23,DATE '2020-12-02',56.7676,
                                                             utl_raw.cast_to_raw('hello world'),utl_raw.cast_to_raw('124545'),utl_raw.cast_to_raw('这是一句话'),TIMESTAMP '2020-05-29 21:21:21',
                                                             '你说什么','我听不见',454.656,8965.65,
                                                             TO_TIMESTAMP_TZ('2030-09-01 01:00:59 +09:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),TO_TIMESTAMP_TZ('2010-05-30 08:45:31 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);                            

SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype2 ORDER BY id;               

---ldb支持的字段                                
DROP TABLE u_dblink_grammar_cover.t_dblink_datatype3;

CREATE TABLE u_dblink_grammar_cover.t_dblink_datatype3(id INT,tchar CHAR(200),tvarchar2 VARCHAR2(200),ttimestamp1 TIMESTAMP,
                                tnumber NUMBER(10,2),tdate DATE,tlong LONG,tfloat FLOAT,tblob BLOB,
                                ttimestamp2 TIMESTAMP(6),tclob CLOB);
                                
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype3 VALUES(1,'张三','是一个好人',TIMESTAMP '1990-01-01 23:59:59',
                                                             11232.43,DATE '1987-12-01',1232334,243.454,UTL_RAW.CAST_TO_RAW('哈哈哈'),
                                                             TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'六一快乐'); 
                                                             
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype3 VALUES(2,'李四','是一个神奇的人',TIMESTAMP '2000-01-01 23:59:59',
                                                             1354232.21,DATE '2005-07-01',120554,623.225,UTL_RAW.CAST_TO_RAW('嘤嘤嘤'),
                                                             TO_TIMESTAMP_TZ('1994-04-23 06:01:00 +08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'先天下之忧而忧');                                                              
                                
SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype3 ORDER BY id;            

---ldb不支持的字段                                
DROP TABLE u_dblink_grammar_cover.t_dblink_datatype4;

CREATE TABLE u_dblink_grammar_cover.t_dblink_datatype4(id INT,traw RAW(100),tlongraw LONG RAW,tnclob NCLOB,
                                tbinary_float BINARY_FLOAT,tbinary_double BINARY_DOUBLE,
                                ttimestamp3 TIMESTAMP WITH TIME ZONE,ttimestamp4 TIMESTAMP WITH LOCAL TIME ZONE,
                                trowid ROWID,turowid UROWID);
                                
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype4 VALUES(1,UTL_RAW.CAST_TO_RAW('十年生死两茫茫，不思量，自难忘'),UTL_RAW.CAST_TO_RAW('红酥手，黄藤酒，满城春色宫墙柳'),'手动滑稽',
                                                             232.343,4565.767,TO_TIMESTAMP_TZ('2039-01-31 12:59:59 +12:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),
                                                             TO_TIMESTAMP_TZ('2039-01-31 12:59:59 -08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);
                                                             
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype4 VALUES(2,UTL_RAW.CAST_TO_RAW('喜欢看你的笑容'),UTL_RAW.CAST_TO_RAW('绽放在夏日夜空'),'温泉',
                                                             232.343,4565.767,TO_TIMESTAMP_TZ('2039-01-31 12:59:59 +12:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),
                                                             TO_TIMESTAMP_TZ('2039-01-31 12:59:59 -08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);                                                             
                                
SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype4 ORDER BY id;

---带中文的表
DROP TABLE u_dblink_grammar_cover.t_dblink_数据类型5;

CREATE TABLE u_dblink_grammar_cover.t_dblink_数据类型5(编号 INT,姓名1 CHAR(200),姓名2 VARCHAR2(200),时间戳1 TIMESTAMP,
                                数字1 NUMBER(10,2),日期1 DATE,数字2 LONG,数字3 FLOAT,blob类型1 BLOB,
                                时间戳2 TIMESTAMP(6),clob类型1 CLOB);
                                
INSERT INTO u_dblink_grammar_cover.t_dblink_数据类型5 VALUES(1,'张三','是一个好人',TIMESTAMP '1990-01-01 23:59:59',
                                                             11232.43,DATE '1987-12-01',1232334,243.454,UTL_RAW.CAST_TO_RAW('哈哈哈'),
                                                             TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'六一快乐'); 
                                                             
INSERT INTO u_dblink_grammar_cover.t_dblink_数据类型5 VALUES(2,'李四','是一个神奇的人',TIMESTAMP '2000-01-01 23:59:59',
                                                             1354232.21,DATE '2005-07-01',120554,623.225,UTL_RAW.CAST_TO_RAW('嘤嘤嘤'),
                                                             TO_TIMESTAMP_TZ('1994-04-23 06:01:00 +08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'先天下之忧而忧');                                 

SELECT * FROM u_dblink_grammar_cover.t_dblink_数据类型5 ORDER BY 编号;     

---中英文加大小写的表
DROP TABLE u_dblink_grammar_cover."t_DBlink_数据类型6";

CREATE TABLE u_dblink_grammar_cover."t_DBlink_数据类型6"("编号HJK_ds" INT,"姓dshjkHJBSD名1" CHAR(200),"姓VBNBfdnk名1" VARCHAR2(200),"时间戳1cdmGHF" TIMESTAMP,
                                "数bvn_BJH字1" NUMBER(10,2),"日vcnnm_BH期1" DATE,"数QZC_BVB字2" LONG,"数cnmv_HJ字3" FLOAT,"blobVYTsdv类型1" BLOB,
                                "时间pmc_BH戳2" TIMESTAMP(6),"clVGHR_gvhob类型1" CLOB);   
                                
INSERT INTO u_dblink_grammar_cover."t_DBlink_数据类型6" VALUES(1,'张三','是一个好人',TIMESTAMP '1990-01-01 23:59:59',
                                                             11232.43,DATE '1987-12-01',1232334,243.454,UTL_RAW.CAST_TO_RAW('哈哈哈'),
                                                             TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'六一快乐'); 
                                                             
INSERT INTO u_dblink_grammar_cover."t_DBlink_数据类型6" VALUES(2,'李四','是一个神奇的人',TIMESTAMP '2000-01-01 23:59:59',
                                                             1354232.21,DATE '2005-07-01',120554,623.225,UTL_RAW.CAST_TO_RAW('嘤嘤嘤'),
                                                             TO_TIMESTAMP_TZ('1994-04-23 06:01:00 +08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'先天下之忧而忧');                                 
                                
SELECT * FROM u_dblink_grammar_cover."t_DBlink_数据类型6" ORDER BY "编号HJK_ds";


--创建视图

---创建基本类型的视图
DROP VIEW u_dblink_grammar_cover.v_dblink_datatype1;

CREATE VIEW u_dblink_grammar_cover.v_dblink_datatype1
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype1 ORDER BY id;

SELECT * FROM u_dblink_grammar_cover.v_dblink_datatype1 ORDER BY id;

DROP VIEW u_dblink_grammar_cover.v_dblink_datatype2;

CREATE VIEW u_dblink_grammar_cover.v_dblink_datatype2
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype2 ORDER BY id;

SELECT * FROM u_dblink_grammar_cover.v_dblink_datatype2 ORDER BY id;

---ldb支持的数据类型的视图
DROP VIEW u_dblink_grammar_cover.v_dblink_datatype3;

CREATE VIEW u_dblink_grammar_cover.v_dblink_datatype3
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype3 ORDER BY id;

SELECT * FROM u_dblink_grammar_cover.v_dblink_datatype3 ORDER BY id;

---ldb不支持的数据类型的视图
DROP VIEW u_dblink_grammar_cover.v_dblink_datatype4;

CREATE VIEW u_dblink_grammar_cover.v_dblink_datatype4
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype4 ORDER BY id;

SELECT * FROM u_dblink_grammar_cover.v_dblink_datatype4 ORDER BY id;

---带中文的视图
DROP VIEW u_dblink_grammar_cover.v_dblink_数据类型5;

CREATE VIEW u_dblink_grammar_cover.v_dblink_数据类型5
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_数据类型5 ORDER BY 编号;

SELECT * FROM u_dblink_grammar_cover.v_dblink_数据类型5 ORDER BY 编号;

---中英文加大小写的视图
DROP VIEW u_dblink_grammar_cover."v_DBlink_数据类型6";

CREATE VIEW u_dblink_grammar_cover."v_DBlink_数据类型6"
AS SELECT * FROM u_dblink_grammar_cover."t_DBlink_数据类型6" ORDER BY "编号HJK_ds";

SELECT * FROM u_dblink_grammar_cover."v_DBlink_数据类型6" ORDER BY "编号HJK_ds";

--多表join的视图
DROP VIEW u_dblink_grammar_cover."V_左连接_7";

CREATE VIEW u_dblink_grammar_cover."V_左连接_7" AS
SELECT a.编号,b."编号HJK_ds",a.日期1,b."数QZC_BVB字2",b."姓VBNBfdnk名1",a.时间戳1 FROM u_dblink_grammar_cover.t_dblink_数据类型5 a
LEFT JOIN u_dblink_grammar_cover."t_DBlink_数据类型6" b
ON a.编号=b."编号HJK_ds" OR a.姓名2=b."姓VBNBfdnk名1"
WHERE a.数字3>0 OR b."数bvn_BJH字1" BETWEEN 0 AND 100;

SELECT * FROM u_dblink_grammar_cover."V_左连接_7" ORDER BY "编号HJK_ds";

--子查询的视图
DROP VIEW u_dblink_grammar_cover.v_子查询_8;

CREATE VIEW u_dblink_grammar_cover.v_子查询_8 AS
SELECT "编号HJK_ds","时间戳1cdmGHF" FROM u_dblink_grammar_cover."t_DBlink_数据类型6"
WHERE "数bvn_BJH字1">=(SELECT 数字1 FROM u_dblink_grammar_cover.t_dblink_数据类型5 WHERE 姓名1 LIKE '%三%');

SELECT * FROM u_dblink_grammar_cover.v_子查询_8 ORDER BY "时间戳1cdmGHF";


--创建proc
DROP PROCEDURE u_dblink_grammar_cover.p_dblink_1;

CREATE OR REPLACE PROCEDURE u_dblink_grammar_cover.p_dblink_1
(
--定义输入、输出参数--
num_A IN INTEGER,
num_B IN INTEGER,
numType IN INTEGER,
num_C OUT INTEGER
)
AS
--定义变量--
 -- numCount integer;
 -- numStr varchar(20);  
BEGIN   
     --判断计算类型--
     IF numType=1 THEN
        num_C := num_A + num_B;
     ELSIF numType=2 THEN
        num_C := num_A - num_B;
     ELSIF numType=3 THEN
        num_C := num_A * num_B; 
     ELSIF numType=4 THEN
        num_C := num_A / num_B; 
     ELSE
     --其它处理
       dbms_output.put_line('其它处理');
     END IF;
END;
/

DECLARE num_C INTEGER;
BEGIN
   --调用存储过程---
   u_dblink_grammar_cover.p_dblink_1(3,4,3,num_C);
   dbms_output.put_line('输出结果：'|| num_C );
END;
/

DROP FUNCTION u_dblink_grammar_cover.f_dblink_1;

CREATE OR REPLACE FUNCTION u_dblink_grammar_cover.f_dblink_1
RETURN VARCHAR2
IS
BEGIN
  RETURN TO_CHAR(sysdate,
    'YYYY"年"MM"月"DD"日"HH24"时"MI"分"SS"秒"');
END;
/


--约束

---主键约束
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_1;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_1(id NUMBER(6),name VARCHAR2(200),sal NUMERIC(10,2),birthday DATE,
                                                          CONSTRAINT t1_id_name_pk PRIMARY KEY(id,name));
                                                          
INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_1 VALUES(1,'伏尔泰',213.43,DATE '1990-01-01');

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_1 VALUES(2,'小卫',4545.54,DATE '1991-12-23');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_1 ORDER BY id;

---非空约束
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_2;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_2(id NUMBER(6),name VARCHAR2(200),sal NUMERIC(10,2),birthday DATE CONSTRAINT t2_birthday_notnull NOT NULL);

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_2 VALUES(1,'爱因斯坦',354222.45,DATE '2020-01-03');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_2 ORDER BY id;

---unique约束
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_3;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_3(id NUMBER(6),name VARCHAR2(200),sal NUMERIC(10,2),birthday DATE,CONSTRAINT t3_id_unique UNIQUE(id));

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_3 VALUES(1,'普朗克',565.67,DATE '1994-11-12');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_3 ORDER BY id;

---foreign key约束
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_4;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_4(eid NUMBER(6),ename VARCHAR2(200),sal NUMERIC(6,2),
                                                          CONSTRAINT t4_eid_pk PRIMARY KEY(eid));

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_4 VALUES(1,'量子力学',2434.65);

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_4 ORDER BY eid;

DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_5;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_5(did NUMBER(6),eid NUMBER(6),dname VARCHAR2(200),
                                                          CONSTRAINT t5_fk FOREIGN KEY(eid) REFERENCES u_dblink_grammar_cover.t_dblink_constraint_4(eid)
                                                          ON DELETE CASCADE);
                                                          
INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_5 VALUES(1,1,'物理');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_5 ORDER BY did;

---check约束
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_6;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_6(id INT,name VARCHAR2(200),sex VARCHAR2(5));

ALTER TABLE u_dblink_grammar_cover.t_dblink_constraint_6
ADD CONSTRAINT t6_check CHECK(sex IN ('男','女'));

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_6 VALUES(1,'范闲','男');

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_6 VALUES(2,'战豆豆','女');

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_6 VALUES(3,'耿晨雨','未知');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_6 ORDER BY id;

---索引
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_7;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_7(id INT,name VARCHAR2(100),sal FLOAT,birthday DATE);

CREATE INDEX index_t7_id ON u_dblink_grammar_cover.t_dblink_constraint_7(id,name);

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_7 VALUES(1,'时间的管理者',674554.45443,DATE '1980-12-11');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_7 ORDER BY id;

select i.index_name,
       i.index_type,
       i.table_owner,
       i.table_name,
       i.uniqueness,
       i.tablespace_name,
       c.column_name,
       c.column_position,
       c.column_length
from user_indexes i, user_ind_columns c
where i.index_name = c.index_name AND i.table_name='T_DBLINK_CONSTRAINT_7' AND i.table_owner='U_DBLINK_GRAMMAR_COVER';


--大小写敏感
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_case_sensitivity CASCADE;

CREATE USER u_case_sensitivity IDENTIFIED BY 123456;

GRANT dba TO u_case_sensitivity;

connect u_case_sensitivity/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE u_case_sensitivity."T_DBLINK_SENSITIVITY1";

CREATE TABLE u_case_sensitivity."T_DBLINK_SENSITIVITY1"(id INT,name VARCHAR2(200));

INSERT INTO u_case_sensitivity."T_DBLINK_SENSITIVITY1" VALUES(1,'vcvcv');

SELECT * FROM u_case_sensitivity."T_DBLINK_SENSITIVITY1" ORDER BY id;

DROP TABLE u_case_sensitivity."t_dblink_sensitivity1";

CREATE TABLE u_case_sensitivity."t_dblink_sensitivity1"("id" INT,"name" VARCHAR2(200));

INSERT INTO u_case_sensitivity."t_dblink_sensitivity1" VALUES(1,'vcvcv');

SELECT * FROM u_case_sensitivity."t_dblink_sensitivity1" ORDER BY "id";

--properties

---maxactive
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_maxactive CASCADE;

CREATE USER u_dblink_maxactive IDENTIFIED BY 123456;

GRANT dba TO u_dblink_maxactive;

connect maxactive/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE u_dblink_maxactive.t_dblink_maxactive1;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive1 (TUNIQUE NUMBER(10),
                                  TINT1 INT,
                                  TVARCHAR2 VARCHAR2(200),
                                  TDOUBLE3 NUMBER(13,6),
                                  TDECIMAL4 NUMBER(10,2),
                                  TDATE5 DATE,
                                  TTIMESTAMP6 TIMESTAMP,
                                  TSMALLINT7 SMALLINT,
                                  TBIGINT8 NUMBER(10),
                                  TCHAR9 CHAR(20),
                                  TNUMERIC10 NUMBER(13,6),
                                  TFLOAT11 NUMBER(13,6),
                                  TREAL12 NUMBER(13,6));

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(1,-899092547,'oVEc^3T4zIwg1ILtyiP8rkd7G#FvBwAXjwpLhu6cu*Kkc7Tf',1648926.2148723458,4116031.49,DATE '1987-06-02',TIMESTAMP '2020-06-18 16:27:17',-11095,-1932371658,'%IEA0HR',3773536.314954,1996385.2026839552,1224049.1147975207);
INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(2,-1403168017,'Epr6AcNJW*uY*2GiZrcGv#ak$BVacBVy*g#zl',2726162.144835754,14643319.71,DATE '2023-06-21',TIMESTAMP '2020-06-18 16:27:17',22621,-1480340730,'Q8BPh36^2hCdDnP3aO',6071569.247461,4663778.476250502,1903884.2548447768);
INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(3,-789490626,'(TwI)mWrPs2lU6(5$D%D^^HoelmxTjoW',2145892.981525481,78560196.91,DATE '2007-10-27',TIMESTAMP '2020-06-18 16:27:17',-12109,-524646332,'zoN*uAdlfc$XcW8S',3072306.826447,1502070.0616832613,244758.11515140504);
INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(4,1392375813,'Ms*f',4879191.878297356,74615663.75,DATE '1982-10-18',TIMESTAMP '2020-06-18 16:27:17',32329,-1737021348,'G3%hOz5*F8C%D5y',4375081.676359,5780860.287694029,6285177.537457812);
INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(5,-515651660,'Y7ZYAS5*)FOhAF#rWD%F',526456.634216947,25468271.21,DATE '2008-06-14',TIMESTAMP '2020-06-18 16:27:17',17288,-1472704848,'U413xX4cITZb^QAy',1878613.583271,5382541.993735052,6447347.412390448);
INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(6,387663444,'p7f$U#)IcQ$nHW5vVeOkbvaWDDuaQVm7(r5Mp5C',7572543.455808893,27145378.41,DATE '1982-08-29',TIMESTAMP '2020-06-18 16:27:17',30489,-1527676042,'^',41062.485755,4937302.6028597215,6951146.156716858);
INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(7,-2088054337,'d10VluN8W^wP*TDxDkC*bjJZ44Av3A2',1048631.2271054361,1560670.63,DATE '2000-07-09',TIMESTAMP '2020-06-18 16:27:17',-6361,1999798379,'hcJA^CsDAE)((',7238528.719465,1237817.6176910177,1013249.1776682566);
INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(8,520860823,'6KuWV)yHEar#*q%hnzqPPH5pm6C#',8512355.724419868,16271077.11,DATE '1970-01-15',TIMESTAMP '2020-06-18 16:27:17',-30518,-1756909766,'KyLFFtVPWD',2468710.528561,4439442.10005343,2853842.3877217392);
INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(9,2012515139,'wjHNqBvyPJAd6kv4c5xHO9hFKe9^NDSO6Lne',4223752.97563944,55782180.54,DATE '1998-11-03',TIMESTAMP '2020-06-18 16:27:17',-2835,-1164254851,'JXbAl#Bx)',1026047.771822,4227803.871756566,3242746.357411831);
INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 VALUES(10,1927074565,'BbT^n9wPydjBHyf7aW*',6752701.0426634215,27792983.14,DATE '1980-08-17',TIMESTAMP '2020-06-18 16:27:17',30680,1681445272,'b4Uo',8157127.090337,4294028.845923988,3355026.935450707);


INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

INSERT INTO u_dblink_maxactive.t_dblink_maxactive1 SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive1;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive2;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive2 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive2;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive3;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive3 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive3;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive4;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive4 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive4;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive5;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive5 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive5;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive6;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive6 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive6;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive7;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive7 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive7;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive8;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive8 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive8;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive9;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive9 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive9;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive10;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive10 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive10;

DROP TABLE u_dblink_maxactive.t_dblink_maxactive11;

CREATE TABLE u_dblink_maxactive.t_dblink_maxactive11 AS (SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1);

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive11;


---schema
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_schema CASCADE;

CREATE USER u_dblink_schema IDENTIFIED BY 123456;

GRANT dba TO u_dblink_schema;

connect u_dblink_schema/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE u_dblink_schema.t_test_schema1;

CREATE TABLE u_dblink_schema.t_test_schema1(id INT,name VARCHAR2(200));

INSERT INTO u_dblink_schema.t_test_schema1 VALUES(1,'等你下课');
INSERT INTO u_dblink_otherUsers.t_test_otherusers1 VALUES(2,'你又擦肩而过');

SELECT * FROM u_dblink_schema.t_test_schema1 ORDER BY id;

---otherUsers
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP USER u_dblink_otherUsers CASCADE;

CREATE USER u_dblink_otherUsers IDENTIFIED BY 123456;

GRANT dba TO u_dblink_otherUsers;

connect u_dblink_otherUsers/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

DROP TABLE u_dblink_otherUsers.t_test_otherusers1;

CREATE TABLE u_dblink_otherUsers.t_test_otherusers1(id INT,name VARCHAR2(200));

INSERT INTO u_dblink_otherUsers.t_test_otherusers1 VALUES(1,'等你下课');
INSERT INTO u_dblink_otherUsers.t_test_otherusers1 VALUES(2,'你又擦肩而过');

SELECT * FROM u_dblink_otherUsers.t_test_otherusers1 ORDER BY id;
