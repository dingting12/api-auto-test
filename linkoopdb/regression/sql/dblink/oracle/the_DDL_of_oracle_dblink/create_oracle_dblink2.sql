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

