--Description:create oracle dblink
--Date：2020-06-15
--Author：王煜

connect admin/123456@jdbc:linkoopdb:tcp://192.168.1.73:9105/ldb

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


DROP VIEW link_oracle_grammar_covered4.v_dblink_wy1 IF EXISTS;

CREATE VIEW link_oracle_grammar_covered4.v_dblink_wy1 AS
SELECT * FROM link_oracle_grammar_covered4.T_DBLINK_WY1 ORDER BY Id;


----中英文混合加特殊字符加大小写
DROP DATABASE LINK link_oracle_grammar_covered5 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered5 connect to '"U_DBlink@!@$%#(*特朗普"' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe';

SELECT * FROM link_oracle_grammar_covered5.t_dblink_wy1 ORDER BY Id;