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