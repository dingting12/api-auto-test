--Description:创建Oracle dblink时的异常情况
--Date：2020-06-19
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
--SQL拼写错误

---create拼写错误
CRETE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号');

---database拼写错误
CREATE DATEBASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号');

---link拼写错误
CREATE DATABASE lnk link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号');

---dblink的名字不符合标准
CREATE DATABASE LINK 233_mkhjk connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号');

---connect拼写错误
CREATE DATABASE LINK link_oracle_grammar_covered1000 conect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号');

---to拼写错误
CREATE DATABASE LINK link_oracle_grammar_covered1000 connect t 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号');

---identified 拼写错误
CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identifity by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号');

---by拼写错误
CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified b '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号');

---using拼写错误
CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' useing 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号');

---properties拼写错误
CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIED ('maxActive':'10','otherUsers':'工具人1号');

--properties的参数异常

---maxActive大小写不区分
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('MAXACTIVE':'10','otherUsers':'工具人1号');

---maxActive的值不为正整数
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'-199','otherUsers':'工具人1号');

DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'cxdf','otherUsers':'工具人1号');

---otherUsers大小写不区分
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherusers':'工具人1号');

---otherUsers的用户名错误
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'哈哈哈,呵呵呵');

---otherUsers的多个用户分隔符为中文逗号
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'U_DBLINK_PASSWORD1，U_DBLINK_PASSWORD3，U_DBLINK_PASSWORD2');

---caseSensitive大小写不区分
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true');

---caseSensitive的值不为Boolean类型
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'1');

DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'sdcnbj');

---properties中含有不存在的参数
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true','minActive':'20');

---properties中参数写法存在问题
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive:10,otherUsers:工具人1号,caseSensitive:true');

--dblink缺少部分关键字

---缺少database
DROP LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true');

---缺少link
DROP DATABASE link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true');

---缺少connect
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true');

---缺少to
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true');

---缺少identified
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true');

---缺少by
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true');

---缺少using
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true');

---缺少PROPERTIES
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
('maxActive':'10','otherUsers':'工具人1号','caseSensitive':'true');

---maxActive缺少值
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive','otherUsers':'工具人1号','caseSensitive':'true');

---otherUsers缺少值
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers','caseSensitive':'true');

---caseSensitive缺少值
DROP DATABASE LINK link_oracle_grammar_covered1000 IF EXISTS CASCADE;

CREATE DATABASE LINK link_oracle_grammar_covered1000 connect to 'u_dblink_maxactive' identified by '123456' using 'jdbc:oracle:thin:@192.168.1.72:1521:xe'
PROPERTIES ('maxActive':'10','otherUsers':'工具人1号','caseSensitive');
