--Description:涉及到创建dblink时，其他数据库的用户，密码，URL，用户权限相关case
--Date：2020-06-15
--Author：王煜

--记录执行时间
set TIMING on
--返回结果
set TERMOUT on
--是否打印执行的SQL语句
set ECHO ON

-------------------------------------------------创建多个session----------------------------------------------------
--node73 ldb
connect admin/123456@jdbc:linkoopdb:tcp://192.168.1.73:9105/ldb

session save ldbnode73

--oracle u_dblink_permission1
connect u_dblink_permission1/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission1

--oracle u_dblink_permission2
connect u_dblink_permission2/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission2

--oracle u_dblink_permission3
connect u_dblink_permission3/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission3

--oracle u_dblink_permission4
connect u_dblink_permission4/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission4

--oracle u_dblink_permission5
connect u_dblink_permission5/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission5

--oracle u_dblink_permission6
connect u_dblink_permission6/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission6

--oracle u_dblink_permission7
connect u_dblink_permission7/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission7

--oracle u_dblink_permission8
connect u_dblink_permission8/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission8

--oracle u_dblink_permission9
connect u_dblink_permission9/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission9

--oracle u_dblink_permission10
connect u_dblink_permission10/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission10

--oracle u_dblink_permission11
connect u_dblink_permission11/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission11

--oracle u_dblink_permission12
connect u_dblink_permission12/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_permission12

--oracle u_dblink_password1
connect u_dblink_password1/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_password1

--oracle u_dblink_password2
connect u_dblink_password2/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_password2

--oracle u_dblink_password3
connect u_dblink_password3/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_password3

--oracle u_dblink_grammar_cover
connect u_dblink_grammar_cover/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_dblink_grammar_cover

--oracle u_case_sensitivity
connect u_case_sensitivity/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_u_case_sensitivity

--oracle system
connect system/123456@jdbc:oracle:thin://192.168.1.72:1521:xe

session save oracle_system
-------------------------------------------------分界线-------------------------------------------------------------
session restore ldbnode73

--user_name

---命名

----英文命名及大小写
DROP DATABASE LINK link_oracle_grammar_covered1 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1 connect to 'U_TEST_DBLINK1' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered1.T_DBLINK_WY1 ORDER BY id;


DROP DATABASE LINK link_oracle_grammar_covered2 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered2 connect to 'u_Test_DBlink1' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered2.T_DBLINK_WY1 ORDER BY Id;

----中文命名
DROP DATABASE LINK link_oracle_grammar_covered3 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered3 connect to '工具人1号' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered3.T_DBLINK_WY1 ORDER BY Id;

DROP DATABASE LINK link_oracle_grammar_covered4 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered4 connect to '工具人耄耋貔貅' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered4.T_DBLINK_WY1 ORDER BY Id;

----中英文混合加特殊字符加大小写
DROP DATABASE LINK link_oracle_grammar_covered5 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered5 connect to '"U_DBlink@!@$%#(*特朗普"' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered5.t_dblink_wy1 ORDER BY Id;

---权限

----用户有远程访问权限
DROP DATABASE LINK link_oracle_grammar_covered6 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered6 connect to 'u_dblink_permission1' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

-----创建表并进行操作
DROP TABLE link_oracle_grammar_covered6.t_dblink_wy1 IF EXISTS;

CREATE TABLE link_oracle_grammar_covered6.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered6.t_dblink_wy1 VALUES(1,'cdfdffd'),(2,'有点甜');

UPDATE link_oracle_grammar_covered6.t_dblink_wy1 SET name ='巴赫旧约' WHERE id=2;

DELETE FROM link_oracle_grammar_covered6.t_dblink_wy1 WHERE id=2;

session restore oracle_u_dblink_permission1

SELECT * FROM u_dblink_permission1.t_dblink_wy1 ORDER BY id;

session restore ldbnode73

----用户有创建，删除，修改 table的权限
DROP DATABASE LINK link_oracle_grammar_covered7 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered7 connect to 'u_dblink_permission2' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

-----对Oracle数据库中的表进行操作
SELECT * FROM link_oracle_grammar_covered7.t_dblink_wy1 ORDER BY Id;

INSERT INTO link_oracle_grammar_covered7.t_dblink_wy1 VALUES(1,'cdfdffd'),(2,'有点甜');

SELECT * FROM link_oracle_grammar_covered7.t_dblink_wy1 ORDER BY Id;

UPDATE link_oracle_grammar_covered7.t_dblink_wy1 SET name ='巴赫旧约' WHERE id=2;

SELECT * FROM link_oracle_grammar_covered7.t_dblink_wy1 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered7.t_dblink_wy1 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered7.t_dblink_wy1 ORDER BY Id;

-----创建表并进行操作
DROP TABLE link_oracle_grammar_covered7.t_dblink_wy2 IF EXISTS;

CREATE TABLE link_oracle_grammar_covered7.t_dblink_wy2(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered7.t_dblink_wy2 VALUES(1,'哈哈镜'),(2,'苏打气泡水');

SELECT * FROM link_oracle_grammar_covered7.t_dblink_wy2 ORDER BY Id;

UPDATE link_oracle_grammar_covered7.t_dblink_wy2 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered7.t_dblink_wy2 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered7.t_dblink_wy2 WHERE id=2;

session restore oracle_u_dblink_permission2

SELECT * FROM u_dblink_permission2.t_dblink_wy1 ORDER BY id;

SELECT * FROM u_dblink_permission2.t_dblink_wy2 ORDER BY id;

session restore ldbnode73

DROP DATABASE LINK link_oracle_grammar_covered8 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered8 connect to 'u_dblink_permission3' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

-----对Oracle数据库中的表进行操作
SELECT * FROM link_oracle_grammar_covered8.t_dblink_wy1 ORDER BY Id;

INSERT INTO link_oracle_grammar_covered8.t_dblink_wy1 VALUES(1,'cdfdffd'),(2,'有点甜');

SELECT * FROM link_oracle_grammar_covered8.t_dblink_wy1 ORDER BY Id;

UPDATE link_oracle_grammar_covered8.t_dblink_wy1 SET name ='巴赫旧约' WHERE id=2;

SELECT * FROM link_oracle_grammar_covered8.t_dblink_wy1 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered8.t_dblink_wy1 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered8.t_dblink_wy1 ORDER BY Id;

-----创建表并进行操作
DROP TABLE link_oracle_grammar_covered8.t_dblink_wy2 IF EXISTS;

CREATE TABLE link_oracle_grammar_covered8.t_dblink_wy2(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered8.t_dblink_wy2 VALUES(1,'哈哈镜'),(2,'苏打气泡水');

SELECT * FROM link_oracle_grammar_covered8.t_dblink_wy2 ORDER BY Id;

UPDATE link_oracle_grammar_covered8.t_dblink_wy2 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered8.t_dblink_wy2 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered8.t_dblink_wy2 WHERE id=2;

session restore oracle_u_dblink_permission3

SELECT * FROM u_dblink_permission3.t_dblink_wy1 ORDER BY id;

SELECT * FROM u_dblink_permission3.t_dblink_wy2 ORDER BY id;

session restore ldbnode73

----用户有创建，删除view的权限
DROP DATABASE LINK link_oracle_grammar_covered9 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered9 connect to 'u_dblink_permission4' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered9.t_dblink_wy1 ORDER BY Id;

SELECT * FROM link_oracle_grammar_covered9.v_dblink_wy1 ORDER BY Id;

DROP TABLE link_oracle_grammar_covered9.t_test_wy2 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered9.t_test_wy2(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered9.t_test_wy2 VALUES(1,'秋日棉花糖');

SELECT * FROM link_oracle_grammar_covered9.t_test_wy2 ORDER BY id;

DROP VIEW link_oracle_grammar_covered9.v_test_wy2 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered9.v_test_wy2 AS
SELECT * FROM link_oracle_grammar_covered9.t_test_wy2;

SELECT * FROM link_oracle_grammar_covered9.v_test_wy2 ORDER BY id;

session restore oracle_u_dblink_permission4

SELECT * FROM u_dblink_permission4.t_test_wy2 ORDER BY Id;

SELECT * FROM u_dblink_permission4.v_test_wy2 ORDER BY Id;

session restore ldbnode73

DROP DATABASE LINK link_oracle_grammar_covered10 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered10 connect to 'u_dblink_permission5' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered10.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered10.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered10.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered10.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered10.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered10.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered10.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered10.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered10.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered10.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered10.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered10.v_test_wy11 ORDER BY id;

session restore oracle_u_dblink_permission5

SELECT * FROM link_oracle_grammar_covered10.t_test_wy11 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered10.v_test_wy11 ORDER BY id;

session restore ldbnode73

----用户有创建proc的权限
DROP DATABASE LINK link_oracle_grammar_covered11 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered11 connect to 'u_dblink_permission6' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered11.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered11.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered11.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered11.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered11.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered11.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered11.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered11.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered11.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered11.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered11.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered11.v_test_wy11 ORDER BY id;

DROP PROCEDURE link_oracle_grammar_covered11.p_test_wy11 IF EXISTS CASCADE;

CREATE PROCEDURE link_oracle_grammar_covered11.p_test_wy11(IN var_int INT,OUT var_result INT)
BEGIN
	SET var_result=var_int+1;
END;
/

CALL link_oracle_grammar_covered11.p_test_wy11(1,var_result);

CALL var_result;

DROP FUNCTION link_oracle_grammar_covered11.f_test_wy11 IF EXISTS CASCADE;

CREATE FUNCTION link_oracle_grammar_covered11.f_test_wy11(var_int INT) RETURNS INT
RETURN var_int+1;
/

CALL link_oracle_grammar_covered11.f_test_wy11(1);

CALL link_oracle_grammar_covered11.p_dblink_1(3,4,3,num_C);

CALL num_C;

session restore oracle_u_dblink_permission6

SELECT * FROM u_dblink_permission6.t_test_wy11 ORDER BY id;

SELECT * FROM u_dblink_permission6.v_test_wy11 ORDER BY id;

DECLARE num_C INTEGER;
BEGIN
   --调用存储过程---
   u_dblink_permission6.p_test_wy11(3,num_C);
   dbms_output.put_line('输出结果：'|| num_C );
END;
/

session restore ldbnode73

DROP DATABASE LINK link_oracle_grammar_covered12 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered12 connect to 'u_dblink_permission7' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered12.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered12.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered12.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered12.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered12.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered12.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered12.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered12.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered12.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered12.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered12.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered12.v_test_wy11 ORDER BY id;

DROP PROCEDURE link_oracle_grammar_covered12.p_test_wy11 IF EXISTS CASCADE;

CREATE PROCEDURE link_oracle_grammar_covered12.p_test_wy11(IN var_int INT,OUT var_result INT)
BEGIN
	SET var_result=var_int+1;
END;
/

CALL link_oracle_grammar_covered12.p_test_wy11(1,var_result);

CALL var_result;

DROP FUNCTION link_oracle_grammar_covered12.f_test_wy11 IF EXISTS CASCADE;

CREATE FUNCTION link_oracle_grammar_covered12.f_test_wy11(var_int INT) RETURNS INT
RETURN var_int+1;
/

CALL link_oracle_grammar_covered12.f_test_wy11(1);

session restore oracle_u_dblink_permission7

SELECT * FROM u_dblink_permission7.t_test_wy11 ORDER BY Id;

SELECT * FROM u_dblink_permission7.v_test_wy11 ORDER BY Id;

DECLARE num_C INTEGER;
BEGIN
   --调用存储过程---
   u_dblink_permission7.p_test_wy11(3,num_C);
   dbms_output.put_line('输出结果：'|| num_C );
END;
/

session restore ldbnode73

----用户有查询的权限
DROP DATABASE LINK link_oracle_grammar_covered13 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered13 connect to 'u_dblink_permission8' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered13.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered13.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered13.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered13.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered13.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered13.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered13.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered13.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered13.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered13.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered13.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered13.v_test_wy11 ORDER BY id;

session restore oracle_u_dblink_permission8

SELECT * FROM u_dblink_permission8.t_test_wy11 ORDER BY id;

SELECT * FROM u_dblink_permission8.v_test_wy11 ORDER BY id;

SELECT * FROM u_dblink_permission3.t_dblink_wy1 ORDER BY id;

SELECT * FROM u_dblink_permission3.t_dblink_wy2 ORDER BY id;

session restore ldbnode73

----用户有插入的权限
DROP DATABASE LINK link_oracle_grammar_covered14 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered14 connect to 'u_dblink_permission9' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered14.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered14.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered14.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered14.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered14.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered14.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered14.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered14.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered14.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered14.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered14.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered14.v_test_wy11 ORDER BY id;

session restore ldbnode73

----用户有更新的权限
DROP DATABASE LINK link_oracle_grammar_covered15 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered15 connect to 'u_dblink_permission10' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered15.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered15.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered15.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered15.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered15.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered15.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered15.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered15.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered15.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered15.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered15.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered15.v_test_wy11 ORDER BY id;

session restore oracle_u_dblink_permission10

SELECT * FROM u_dblink_permission2.t_dblink_wy1 ORDER BY id;

UPDATE u_dblink_permission2.t_test_wy1 SET name ='下蛋公鸡，公鸡中的战斗机，欧耶' WHERE id=1;

SELECT * FROM u_dblink_permission2.t_dblink_wy1 ORDER BY id;

session restore oracle_u_dblink_permission2

SELECT * FROM u_dblink_permission2.t_dblink_wy1 ORDER BY id;

session restore ldbnode73

----用户有删除的权限
DROP DATABASE LINK link_oracle_grammar_covered16 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered16 connect to 'u_dblink_permission11' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered16.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered16.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered16.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered16.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered16.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered16.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered16.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered16.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered16.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered16.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered16.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered16.v_test_wy11 ORDER BY id;

session restore oracle_u_dblink_permission11

SELECT * FROM u_dblink_permission2.t_dblink_wy1 ORDER BY id;

DELETE FROM u_dblink_permission2.t_test_wy1 WHERE id=1;

SELECT * FROM u_dblink_permission2.t_dblink_wy1 ORDER BY id;

session restore oracle_u_dblink_permission2

SELECT * FROM u_dblink_permission2.t_dblink_wy1 ORDER BY id;

session restore ldbnode73

----用户无任何权限
DROP DATABASE LINK link_oracle_grammar_covered17 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered17 connect to 'u_dblink_permission' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered17.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered17.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered17.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered17.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered17.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered17.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered17.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered17.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered17.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered17.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered17.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered17.v_test_wy11 ORDER BY id;

session restore oracle_u_dblink_permission

SELECT * FROM u_dblink_permission.t_test_wy11 ORDER BY id;

session restore ldbnode73

---用户是否存在
DROP DATABASE LINK link_oracle_grammar_covered23 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered23 connect to '最肯忘却故人事' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

--password

---英文及大小写

DROP DATABASE LINK link_oracle_grammar_covered18 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered18 connect to 'u_dblink_password1' identified by 'csHIKHBNUgdjK' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered18.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered18.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered18.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered18.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered18.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered18.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered18.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered18.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered18.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered18.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered18.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered18.v_test_wy11 ORDER BY id;

session restore oracle_u_dblink_password1

SELECT * FROM u_dblink_password1.t_test_wy11 ORDER BY id;

SELECT * FROM u_dblink_password1.v_test_wy11 ORDER BY id;

session restore ldbnode73

---中文

DROP DATABASE LINK link_oracle_grammar_covered19 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered19 connect to 'u_dblink_password2' identified by '这是一个密码' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered19.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered19.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered19.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered19.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered19.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered19.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered19.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered19.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered19.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered19.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered19.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered19.v_test_wy11 ORDER BY id;

session restore oracle_u_dblink_password2

SELECT * FROM u_dblink_password2.t_test_wy11 ORDER BY Id;

SELECT * FROM u_dblink_password2.v_test_wy11 ORDER BY id;

session restore ldbnode73

---中英文混合加特殊字符加大小写

DROP DATABASE LINK link_oracle_grammar_covered20 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered20 connect to 'u_dblink_password3' identified by '"^&*SDfbj%^$&^红烧冬1278_84"' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

DROP TABLE link_oracle_grammar_covered20.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered20.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered20.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered20.t_test_wy11 ORDER BY id;

UPDATE link_oracle_grammar_covered20.t_test_wy11 SET name ='夏日小饼干' WHERE id=1;

SELECT * FROM link_oracle_grammar_covered20.t_test_wy11 ORDER BY Id;

DELETE FROM link_oracle_grammar_covered20.t_test_wy11 WHERE id=2;

SELECT * FROM link_oracle_grammar_covered20.t_test_wy11 ORDER BY Id;

DROP VIEW link_oracle_grammar_covered20.v_test_wy11 IF EXISTS CASCADE;

CREATE VIEW link_oracle_grammar_covered20.v_test_wy11 AS
SELECT * FROM link_oracle_grammar_covered20.t_test_wy11;

SELECT * FROM link_oracle_grammar_covered20.v_test_wy11 ORDER BY id;

session restore oracle_u_dblink_password3

SELECT * FROM u_dblink_password3.t_test_wy11 ORDER BY Id;

SELECT * FROM u_dblink_password3.v_test_wy11 ORDER BY id;

session restore ldbnode73

---密码是否正确
DROP DATABASE LINK link_oracle_grammar_covered23 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered23 connect to 'u_dblink_password3' identified by '小菜鸟考上的' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

---修改其他数据库的用户的密码，查看dblink是否还能正常使用
DROP DATABASE LINK link_oracle_grammar_covered24 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered24 connect to 'u_dblink_permission12' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered24.t_test_wy1 ORDER BY Id;

SELECT * FROM link_oracle_grammar_covered24.v_test_wy1 ORDER BY id;

session restore oracle_system

ALTER USER u_dblink_permission12 IDENTIFIED BY 456789;

session restore ldbnode73

SELECT * FROM link_oracle_grammar_covered24.t_test_wy1 ORDER BY Id;

SELECT * FROM link_oracle_grammar_covered24.v_test_wy1 ORDER BY id;

DROP TABLE link_oracle_grammar_covered24.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered24.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered24.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered24.t_test_wy11 ORDER BY id;

---其他数据库的用户密码过期后，查看dblink是否还能正常使用
DROP DATABASE LINK link_oracle_grammar_covered25 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered25 connect to 'u_dblink_permission13' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered25.t_test_wy1 ORDER BY Id;

SELECT * FROM link_oracle_grammar_covered25.v_test_wy1 ORDER BY id;

session restore oracle_system

ALTER USER u_dblink_permission13 password expire;

session restore oracle_u_dblink_permission13

SELECT * FROM u_dblink_permission13.v_test_wy1 ORDER BY id;

session restore ldbnode73

SELECT * FROM link_oracle_grammar_covered25.t_test_wy1 ORDER BY Id;

SELECT * FROM link_oracle_grammar_covered25.v_test_wy1 ORDER BY id;

DROP TABLE link_oracle_grammar_covered25.t_test_wy11 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered25.t_test_wy11(id INT,name VARCHAR(200));

INSERT INTO link_oracle_grammar_covered25.t_test_wy11 VALUES(1,'秋日棉花糖'),(2,'春日小红花');

SELECT * FROM link_oracle_grammar_covered25.t_test_wy11 ORDER BY id;

--CONNECTION URL

---URL不存在
DROP DATABASE LINK link_oracle_grammar_covered26 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered26 connect to 'u_dblink_permission13' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.76:1521:xe';

---URL
DROP DATABASE LINK link_oracle_grammar_covered27 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered27 connect to 'u_dblink_permission13' identified by '123456' using 'xcbmfdfyhuiyjsavc';
