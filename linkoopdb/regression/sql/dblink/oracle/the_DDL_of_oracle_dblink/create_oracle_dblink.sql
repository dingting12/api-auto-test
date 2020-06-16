--Description:create oracle dblink
--Date：2020-06-15
--Author：王煜


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
-------------------------------------------------分界线----------------------------------------------------
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

session restore ldbnode73