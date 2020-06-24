--Description:涉及到创建dblink时，properties clause相关case
--Date：2020-06-18
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

-------------------------------------------------分界线-------------------------------------------------------------
session restore ldbnode73

--properties clause

---对dblink级别的参数

----maxActive
DROP DATABASE LINK link_oracle_grammar_covered28 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered28 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('maxActive':'10');

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive1;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive1 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive2;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive2 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive3;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive3 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive4;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive4 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive5;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive5 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive6;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive6 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive7;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive7 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive8;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive8 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive9;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive9 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive10;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive10 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM u_dblink_maxactive.t_dblink_maxactive11;

SELECT * FROM u_dblink_maxactive.t_dblink_maxactive11 ORDER BY TUNIQUE LIMIT 5;

----caseSensitive
DROP DATABASE LINK link_oracle_grammar_covered29 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered29 connect to 'u_case_sensitivity' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('caseSensitive':'true');

SELECT * FROM link_oracle_grammar_covered29."T_DBLINK_SENSITIVITY1" ORDER BY id;

SELECT * FROM link_oracle_grammar_covered29."t_dblink_sensitivity1" ORDER BY "id";

DROP DATABASE LINK link_oracle_grammar_covered30 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered30 connect to 'u_case_sensitivity' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('caseSensitive':'false');

SELECT * FROM link_oracle_grammar_covered30."T_DBLINK_SENSITIVITY1" ORDER BY id;

SELECT * FROM link_oracle_grammar_covered30."t_dblink_sensitivity1" ORDER BY "id";

----schema

-----schema存在
DROP DATABASE LINK link_oracle_grammar_covered31 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered31 connect to 'u_dblink_schema' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('schema':'工具人1号');

SELECT * FROM link_oracle_grammar_covered31.t_test_schema1 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered31.t_dblink_wy1 ORDER BY id;

-----schema不存在
DROP DATABASE LINK link_oracle_grammar_covered32 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered32 connect to 'u_dblink_schema' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('schema':'这个schema不存在');

SELECT * FROM link_oracle_grammar_covered32.t_test_schema1 ORDER BY id;

----otherUsers

-----单个user

------user大写，Oracle中user是全大写的

DROP DATABASE LINK link_oracle_grammar_covered33 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered33 connect to 'u_dblink_otherUsers' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('otherUsers':'U_DBLINK_MAXACTIVE');

SELECT * FROM link_oracle_grammar_covered33.t_test_otherusers1 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered33.t_dblink_maxactive3 ORDER BY TUNIQUE LIMIT 5;

SELECT * FROM link_oracle_grammar_covered33.t_dblink_maxactive8 ORDER BY TUNIQUE LIMIT 5;

------user小写，Oracle中user是全大写的

DROP DATABASE LINK link_oracle_grammar_covered34 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered34 connect to 'u_dblink_otherUsers' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('otherUsers':'u_dblink_maxactive');

SELECT * FROM link_oracle_grammar_covered34.t_test_otherusers1 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered34.t_dblink_maxactive3 ORDER BY TUNIQUE LIMIT 5;

SELECT * FROM link_oracle_grammar_covered34.t_dblink_maxactive8 ORDER BY TUNIQUE LIMIT 5;

------user不存在
DROP DATABASE LINK link_oracle_grammar_covered35 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered35 connect to 'u_dblink_otherUsers' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('otherUsers':'这个用户不存在');

SELECT * FROM link_oracle_grammar_covered35.t_test_otherusers1 ORDER BY id;

------user带特殊字符
DROP DATABASE LINK link_oracle_grammar_covered36 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered36 connect to 'u_dblink_otherUsers' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('otherUsers':'U_DBlink@!@$%#(*特朗普');

SELECT * FROM link_oracle_grammar_covered36.t_test_otherusers1 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered36.t_dblink_wy1 ORDER BY id;

------user带中文
DROP DATABASE LINK link_oracle_grammar_covered37 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered37 connect to 'u_dblink_otherUsers' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('otherUsers':'工具人耄耋貔貅');

SELECT * FROM link_oracle_grammar_covered37.t_test_otherusers1 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered37.t_dblink_wy1 ORDER BY id;

-----多个user

------两个用户分别为大写与小写
DROP DATABASE LINK link_oracle_grammar_covered38 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered38 connect to 'u_dblink_otherUsers' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('otherUsers':'u_Test_DBlink1,U_TEST_DBLINK1');

SELECT * FROM link_oracle_grammar_covered38.t_test_otherusers1 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered38.t_dblink_wy1 ORDER BY id;

------多个user拥有相同名字的表
DROP DATABASE LINK link_oracle_grammar_covered39 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered39 connect to 'u_dblink_otherUsers' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('otherUsers':'u_dblink_password3,u_dblink_password2,u_dblink_password1');

SELECT * FROM link_oracle_grammar_covered39.t_test_otherusers1 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered39.t_dblink_wy1 ORDER BY id;

------多个user中有不存在的用户名
DROP DATABASE LINK link_oracle_grammar_covered40 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered40 connect to 'u_dblink_otherUsers' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('otherUsers':'u_dblink_password3,chjdhjdf,u_dblink_password1');

SELECT * FROM link_oracle_grammar_covered40.t_test_otherusers1 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered40.t_dblink_wy1 ORDER BY id;

------多个用户
DROP DATABASE LINK link_oracle_grammar_covered41 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered41 connect to 'u_dblink_otherUsers' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('otherUsers':'工具人耄耋貔貅,u_dblink_maxactive');

SELECT * FROM link_oracle_grammar_covered41.t_test_otherusers1 ORDER BY id;

SELECT * FROM link_oracle_grammar_covered41.t_dblink_wy1 ORDER BY id;

---对dblink表级别的参数

----dblink读并发控制

-----设置参数、取消参数、查询参数

------part

-------part分区正常情况

DROP DATABASE LINK link_oracle_grammar_covered42 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered42 connect to 'u_dblink_read_concurrent' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1 LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent1
SET PROPERTIES('part1':'TUNIQUE=1','part2':'TUNIQUE=2','part3':'TUNIQUE=3','part4':'TUNIQUE=4','part5':'TUNIQUE=5',
               'part6':'TUNIQUE=6','part7':'TUNIQUE=7','part8':'TUNIQUE=8','part9':'TUNIQUE=9','part10':'TUNIQUE=10');

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1 ORDER BY TUNIQUE LIMIT 5;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1;

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent1;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent1
UNSET PROPERTIES ('part1','part2','part3','part4','part5','part6','part7','part8','part9','part10');

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1;

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent1;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent1
SET PROPERTIES('part1':'TUNIQUE>=1 and TUNIQUE<=2','part2':'TUNIQUE>=3 and TUNIQUE<=4',
               'part3':'TUNIQUE>=5 and TUNIQUE<=6','part4':'TUNIQUE>=7 and TUNIQUE<=8','part5':'TUNIQUE>=9 and TUNIQUE<=10');

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1 ORDER BY TUNIQUE LIMIT 5;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent1
UNSET PROPERTIES ('part1','part2','part3','part4','part5');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent1;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent1
SET PROPERTIES('part1':'TUNIQUE>=1 and TUNIQUE<=3','part2':'TUNIQUE>=4 and TUNIQUE<=6','part3':'TUNIQUE>=7 and TUNIQUE<=10');

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1 ORDER BY TUNIQUE LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent1
UNSET PROPERTIES ('part1','part2','part3');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent1;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent1 ORDER BY TUNIQUE LIMIT 10;

-------part中支持的字段类型，外部表中含有10万条数据
DROP TABLE external_oracle_dblink1 IF EXISTS CASCADE;

CREATE EXTERNAL TABLE external_oracle_dblink1(
tint INT,tvarchar VARCHAR(200),tdouble DOUBLE,
tdecimal DECIMAL(10,2),tdate DATE,ttimestamp TIMESTAMP,
tsmallint SMALLINT,tbigint BIGINT,tchar CHAR(50),
tnumeric NUMERIC(13,6),tfloat FLOAT,treal REAL)
LOCATION('ldbdist://192.168.1.73:54322/testdata_oracledblink.csv') FORMAT 'csv' (DELIMITER ',');

SELECT COUNT(*) FROM external_oracle_dblink1;

DROP TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4 IF EXISTS CASCADE;

CREATE TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4 AS (SELECT * FROM external_oracle_dblink1) WITH DATA;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tint LIMIT 10;

--------SMALLINT
SELECT MAX(tsmallint),MIN(tsmallint) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tsmallint>=-32766 and tsmallint<=-20000','part2':'tsmallint>=-19999 and tsmallint<=-10000',
               'part3':'tsmallint>=-9999 and tsmallint<=0','part4':'tsmallint>=1 and tsmallint<=10000',
               'part5':'tsmallint>=10001 and tsmallint<=20000','part6':'tsmallint>=20001 and tsmallint<=30000',
               'part7':'tsmallint>=30001 and tsmallint<=31000','part8':'tsmallint>=31001 and tsmallint<=32766');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tint LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4','part5','part6','part7','part8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tint LIMIT 10;

--------INT
SELECT MAX(tint),MIN(tint) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tint>=-2147480213 and tint<=-2000000000','part2':'tint>=-1999999999 and tint<=-1000000000',
               'part3':'tint>=-999999999 and tint<=0','part4':'tint>=1 and tint<=1000000000',
               'part5':'tint>=1000000001 and tint<=2000000000','part6':'tint>=2000000001 and tint<=3000000000',
               'part7':'tint>=3000000001 and tint<=3100000000','part8':'tint>=3100000001 and tint<=2147447041');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tint LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4','part5','part6','part7','part8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tint LIMIT 10;

--------BIGINT
SELECT MAX(tbigint),MIN(tbigint) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tbigint>=-2147420267 and tbigint<=-2000000000','part2':'tbigint>=-1999999999 and tbigint<=-1000000000',
               'part3':'tbigint>=-999999999 and tbigint<=0','part4':'tbigint>=1 and tbigint<=1000000000',
               'part5':'tbigint>=1000000001 and tbigint<=2000000000','part6':'tbigint>=2000000001 and tbigint<=3000000000',
               'part7':'tbigint>=3000000001 and tbigint<=3100000000','part8':'tbigint>=3100000001 and tbigint<=2147458172');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tbigint LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4','part5','part6','part7','part8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tbigint LIMIT 10;

--------DOUBLE
SELECT MAX(tdouble),MIN(tdouble) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tdouble>=-2147420267 and tdouble<=-2000000000','part2':'tdouble>=-1999999999 and tdouble<=-1000000000',
               'part3':'tdouble>=-999999999 and tdouble<=0','part4':'tdouble>=1 and tdouble<=1000000000',
               'part5':'tdouble>=1000000001 and tdouble<=2000000000','part6':'tdouble>=2000000001 and tdouble<=3000000000',
               'part7':'tdouble>=3000000001 and tdouble<=3100000000','part8':'tdouble>=3100000001 and tdouble<=2147458172');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tdouble LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4','part5','part6','part7','part8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tdouble LIMIT 10;

--------FLOAT
SELECT MAX(tfloat),MIN(tfloat) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tfloat>=142.1316680908 and tfloat<=1000000','part2':'tfloat>=1000001 and tfloat<=2000000',
               'part3':'tfloat>=2000001 and tfloat<=3000000','part4':'tfloat>=3000001 and tfloat<=9999958');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tfloat LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tfloat LIMIT 10;

--------REAL
SELECT MAX(treal),MIN(treal) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'treal>=30 and treal<2000000','part2':'treal>=2000000 and treal<4000000',
               'part3':'treal>=4000000 and treal<8000000','part4':'treal>=8000000 and treal<=9999977');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY treal LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY treal LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'treal>=31.1516132721 and treal<2000000','part2':'treal>=2000000 and treal<4000000',
               'part3':'treal>=4000000 and treal<8000000','part4':'treal>=8000000 and treal<=9999976.258133976');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY treal LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY treal LIMIT 10;

--------DECIMAL
SELECT MAX(tdecimal),MIN(tdecimal) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tdecimal>=203.79 and tdecimal<2000000','part2':'tdecimal>=2000000 and tdecimal<4000000',
               'part3':'tdecimal>=4000000 and tdecimal<8000000','part4':'tdecimal>=8000000 and tdecimal<=99997919.59');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tdecimal LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tdecimal LIMIT 10;

--------NUMERIC
SELECT MAX(tnumeric),MIN(tnumeric) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tnumeric>=3.568651 and tnumeric<2000000','part2':'tnumeric>=2000000 and tnumeric<4000000',
               'part3':'tnumeric>=4000000 and tnumeric<8000000','part4':'tnumeric>=8000000 and tnumeric<=9999660.184282');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------CHAR
SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 WHERE tchar LIKE '%c%';

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tchar like '%c%'','part2':'tchar like '%b%'',
               'part3':'tchar like '%d%'','part4':'tchar like '%e%'');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------VARCHAR
SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 WHERE tvarchar LIKE '%c%';

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tvarchar like '%c%'','part2':'tvarchar like '%b%'',
               'part3':'tvarchar like '%d%'','part4':'tvarchar like '%e%'');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------DATE
/*ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tdate>='1970-01-01' and tdate<''2000-12-31'','part2':'tdate>='2001-01-01' and tdate<'2010-12-31'',
               'part3':'tdate>='2011-01-01' and tdate<='2040-12-29'');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tdate LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tdate desc LIMIT 10;*/

--------TIMESTAMP
/*ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'ttimestamp>='1970-01-01 00:00:00' and ttimestamp<''2000-12-31 00:00:00'','part2':'ttimestamp>='2001-01-01 00:00:00' and ttimestamp<'2010-12-31 00:00:00'',
               'part3':'ttimestamp>='2011-01-01 00:00:00' and ttimestamp<='2040-12-29 00:00:00'');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY ttimestamp LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY ttimestamp desc LIMIT 10;*/

-------part中多字段类型组合（字符和时间类型字段作为查询条件有问题）
ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'(tnumeric between 3.568651 and 3000000) and (tint between -2147375249 and 2147390080) and
                        (tdouble between 346 and 9999134) and (tdecimal between 10310.13 and 99993748.29) and
                        (tsmallint between -32766 and 32766) and (tbigint between -2147420267 and 2147458172) and
                        (tfloat between 627 and 9999685) and (treal between 442 and 9999208)',
               'part2':'(tnumeric between 3000000 and 6000000) and (tint between -2147445358 and 2147447041) and
                        (tdouble between 151 and 9999877) and (tdecimal between 203.79 and 99997919.59) and
                        (tsmallint between -32765 and 32766) and (tbigint between -2147332502 and 2146869658) and
                        (tfloat between 235.19825744628906 and 9999958) and (treal between 297 and 9999635)',
               'part3':'(tnumeric between 6000000 and 9999660.184282) and (tint between -2147480213 and 2147245009) and
                        (tdouble between 185 and 9999997) and (tdecimal between 2716.80 and 99992225.01) and
                        (tsmallint between -32763 and 32765) and (tbigint between -2147377238 and 2147264367) and
                        (tfloat between 142.1316680908203 and 9998836) and (treal between 30 and 9999977)');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

-------part中含有子查询
ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tnumeric in (select tnumeric from link_oracle_grammar_covered42.t_dblink_read_concurrent4 where tnumeric between 100 and 20000)',
               'part2':'tnumeric in (select tnumeric from link_oracle_grammar_covered42.t_dblink_read_concurrent4 where tnumeric between 3000000 and 7000000)',
               'part3':'tnumeric in (select tnumeric from link_oracle_grammar_covered42.t_dblink_read_concurrent4 where tnumeric between 5000000 and 9900000)');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

-------part分区异常情况
--------当各个part有重合时
ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tnumeric between 100 and 20000',
               'part2':'tnumeric between 3000000 and 7000000',
               'part3':'tnumeric between 5000000 and 9900000');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------part中的参数大小写对表的影响
ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tnumeric between 100 AND 20000',
               'part2':'tnumeric BETWEEN 3000000 and 7000000',
               'part3':'tnumeric between 5000000 AND 9900000');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------part中的含有不存在的字段名
ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'mncxm between 100 and 20000',
               'part2':'cdnjm between 3000000 and 7000000',
               'part3':'vcnm between 5000000 and 9900000');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------part中规定的范围中不存在数据
SELECT MAX(tnumeric),MIN(tnumeric) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tnumeric<=2','part2':'tnumeric>=9999661',
               'part3':'tnumeric>=40000000 and tnumeric<80000000','part4':'tnumeric>=80000000 and tnumeric<=99996600');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------part中字段属性与范围的比较值不匹配
SELECT MAX(tnumeric),MIN(tnumeric) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tnumeric like '%s_'','part2':'tnumeric like '%v%'',
               'part3':'tnumeric>=4000000 and tnumeric<8000000','part4':'tnumeric>=8000000 and tnumeric<=9999660');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------多个part中分别含有不同的字段
SELECT MAX(tnumeric),MIN(tnumeric) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tnumeric>=3.568651 and tnumeric<2000000','part2':'tdecimal>=203.79 and tdecimal<2000000',
               'part3':'treal>=2000000 and treal<4000000','part4':'tfloat>=3000001 and tfloat<=9999958');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------properties中除了part开头的参数外还有其他参数混在其中
SELECT MAX(tnumeric),MIN(tnumeric) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tnumeric>=3.568651 and tnumeric<2000000','part2':'tnumeric>=2000000 and tnumeric<4000000',
               'autopart1':'tnumeric>=4000000 and tnumeric<8000000','autopart2':'tnumeric>=8000000 and tnumeric<=9999660.184282');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','autopart1','autopart2');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------当执行一次分区后，不进行unset操作，再次进行分区操作
SELECT MAX(tnumeric),MIN(tnumeric) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part1':'tnumeric>=3.568651 and tnumeric<2000000','part2':'tnumeric>=2000000 and tnumeric<4000000',
               'part3':'tnumeric>=4000000 and tnumeric<8000000','part4':'tnumeric>=8000000 and tnumeric<=9999660.184282');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('part5':'tnumeric>=3.568651 and tnumeric<2000000','part6':'tnumeric>=2000000 and tnumeric<4000000',
               'part7':'tnumeric>=4000000 and tnumeric<8000000','part8':'tnumeric>=8000000 and tnumeric<=9999660.184282');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('part1','part2','part3','part4','part5','part6','part7','part8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;


------fetchsize
ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('fetchSize':'10');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('fetchSize':'100');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('fetchSize':'1000');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('fetchSize':'10000');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;


ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('fetchSize');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

-------fetchSize不分区大小写
ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('FETCHSIZE':'10000');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;


ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('FETCHSIZE');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('fetchsize':'10000');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('fetchsize');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

------column_partition

-------column_partition的字段类型为数值类型

--------smallint
SELECT MAX(TSMALLINT),MIN(TSMALLINT) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('column_partition':'TSMALLINT','lower_bound':'-32766','upper_bound':'32766','num_partitions':'8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('column_partition','lower_bound','upper_bound','num_partitions');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;


--------int
SELECT MAX(TINT),MIN(TINT) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('column_partition':'TINT','lower_bound':'-2147480213','upper_bound':'2147447041','num_partitions':'8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('column_partition','lower_bound','upper_bound','num_partitions');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------bigint
SELECT MAX(TBIGINT),MIN(TBIGINT) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('column_partition':'TBIGINT','lower_bound':'-2147420267','upper_bound':'2147458172','num_partitions':'8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('column_partition','lower_bound','upper_bound','num_partitions');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------float
SELECT MAX(TFLOAT),MIN(TFLOAT) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('column_partition':'TFLOAT','lower_bound':'142.1316680908203','upper_bound':'9999958','num_partitions':'8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('column_partition','lower_bound','upper_bound','num_partitions');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------double
SELECT MAX(TDOUBLE),MIN(TDOUBLE) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('column_partition':'TDOUBLE','lower_bound':'152.543888414','upper_bound':'9999996.00402736','num_partitions':'8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('column_partition','lower_bound','upper_bound','num_partitions');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------real
SELECT MAX(TREAL),MIN(TREAL) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('column_partition':'TREAL','lower_bound':'31.1516132721','upper_bound':'9999976.258133976','num_partitions':'8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('column_partition','lower_bound','upper_bound','num_partitions');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------numeric
SELECT MAX(TNUMERIC),MIN(TNUMERIC) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('column_partition':'TNUMERIC','lower_bound':'3.568651','upper_bound':'9999660.184282','num_partitions':'8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('column_partition','lower_bound','upper_bound','num_partitions');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

--------decimal
SELECT MAX(TDECIMAL),MIN(TDECIMAL) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
SET PROPERTIES('column_partition':'TDECIMAL','lower_bound':'203.79','upper_bound':'99997919.59','num_partitions':'8');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

ALTER TABLE link_oracle_grammar_covered42.t_dblink_read_concurrent4
UNSET PROPERTIES('column_partition','lower_bound','upper_bound','num_partitions');

SHOW TABLE PROPERTIES link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT COUNT(*) FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4;

SELECT * FROM link_oracle_grammar_covered42.t_dblink_read_concurrent4 ORDER BY tnumeric LIMIT 10;

-------column_partition的字段类型为非数值类型

--------date
--------timestamp
--------varchar
--------char

-------bound的取值范围

--------lower<upper
--------lower<=upper
--------lower=upper
--------lower>=upper
--------lower>upper
--------bound的取值范围包含全部数据
--------bound的取值范围包含部分数据
--------bound的取值范围不包含任何数据

-------num_partitions

--------num为正整数
--------num为负整数
--------num为0
--------num为正浮点数
--------num为负浮点数
--------num小于table的数据个数
--------num大于table的数据个数

------column_partition缺少部分参数

-------缺少column_partition
-------缺少lower_bound
-------缺少upper_bound
-------缺少num_partitions

------column_partition大小写问题

-------全大写
-------全小写
-------大小写混合