--Description:涉及到创建dblink时，properties clause相关case
--Date：2020-06-18
--Author：王煜



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
DROP DATABASE LINK link_oracle_grammar_covered28 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered28 connect to 'u_case_sensitivity' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('caseSensitive':'true');

SELECT * FROM link_oracle_grammar_covered28."T_DBLINK_SENSITIVITY1" ORDER BY id;

SELECT * FROM link_oracle_grammar_covered28."t_dblink_sensitivity1" ORDER BY "id";

DROP DATABASE LINK link_oracle_grammar_covered28 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered28 connect to 'u_case_sensitivity' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe' PROPERTIES ('caseSensitive':'false');

SELECT * FROM link_oracle_grammar_covered28."T_DBLINK_SENSITIVITY1" ORDER BY id;

SELECT * FROM link_oracle_grammar_covered28."t_dblink_sensitivity1" ORDER BY "id";

----schema

----otherUsers

---对dblink表级别的参数

----dblink读并发控制

