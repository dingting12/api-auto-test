--Description:numeric type session variable test
--Date：2020-07-17
--Author：王煜

--记录执行时间
set TIMING off
--返回结果
set TERMOUT on
--是否打印执行的SQL语句
set ECHO ON

--------------------------------------------------------

--变量名测试

---英文名
DECLARE numeric_variable NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE "NUMERIC_variable" NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE 123_numeric_var NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE "123_NUMERIC_var" NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE _numeric_var NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE "_numeric_VAR" NUMERIC(20,5);

SHOW SESSION_VARIABLES;

---中文名
DECLARE numeric浮点型变量 NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE numeric浮点型_变量 NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE _numeric浮点型_变量 NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE "_numeric浮点型_变量" NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅numeric浮点型变量 NUMERIC(20,5);

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE numeric浮点型变量_numericvar NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE 整numeric型var变numeric量var NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE "整NUMERIC型var变numeric量VAR" NUMERIC(20,5);

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&NUMERIC_VAR" NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE "&numeric浮点型变量" NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE numericeger&numeric浮点型变量 NUMERIC(20,5);

SHOW SESSION_VARIABLES;

DECLARE "numericeger&numeric浮点型变量" NUMERIC(20,5);

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE numeric_var1 NUMERIC(20,5) DEFAULT 0;

DECLARE numeric_var2 NUMERIC(20,5) DEFAULT -999999999999999.99999;

DECLARE numeric_var3 NUMERIC(20,5) DEFAULT 999999999999999.99999;

DECLARE numeric_var4 NUMERIC(20,5) DEFAULT 9999999999999999.99999;

DECLARE numeric_var5 NUMERIC(20,5) DEFAULT -9999999999999999.99999;

DECLARE numeric_var6 NUMERIC(20,5) DEFAULT 100;

---默认值与该类型不符
DECLARE numeric_var7 NUMERIC(20,5) DEFAULT "23123";

DECLARE numeric_var8 NUMERIC(20,5) DEFAULT "dvfg";

DECLARE numeric_var9 NUMERIC(20,5) DEFAULT TRUE;

DECLARE numeric_var10 NUMERIC(20,5) DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE numeric_var11 NUMERIC(20,5) DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE numeric_var12 NUMERIC(20,5) DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET numeric_variable = -999999999999999.99999 ;

SET "NUMERIC_variable" = 999999999999999.99999 ;

SET 123_numeric_var = 2323 ;

SET "123_NUMERIC_var" = 9999999999999999.99999 ;

SET _numeric_var = 1223 ;

SET "_numeric_VAR" = -9999999999999999.99999 ;

SET numeric浮点型变量 = 0 ;

SET numeric浮点型_变量 = 1 ;

SET _numeric浮点型_变量 = 2 ;

SET "_numeric浮点型_变量" = 3 ;

SET 耄耋貔貅numeric浮点型变量 = 4 ;

SET numeric浮点型变量_numericvar = 5 ;

SET 整numeric型var变numeric量var = 6 ;

SET "整NUMERIC型var变numeric量VAR" = 7 ;

SET "&NUMERIC_VAR"  = 8 ;

SET "&numeric浮点型变量" = 9 ;

SET numericeger&numeric浮点型变量 = 43565 ;

SET "numericeger&numeric浮点型变量" = 10 ;

---赋的值与该类型不符
SET numeric_var1 = "23123";

SET numeric_var2 = "dvfg";

SET numeric_var3 = TRUE;

SET numeric_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET numeric浮点型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &numeric_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"NUMERIC_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_NUMERIC_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_numeric_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &numeric浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric浮点型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_numeric浮点型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅numeric浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric浮点型变量_numericvar FROM t_session_var_dfs LIMIT 1;

SELECT &整numeric型var变numeric量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整NUMERIC型var变numeric量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&NUMERIC_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&numeric浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"numericeger&numeric浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &numeric_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &numeric_variable,&"NUMERIC_variable",&"123_NUMERIC_var",&"_numeric_VAR",
       &numeric浮点型变量,&numeric浮点型_变量,&"_numeric浮点型_变量",&耄耋貔貅numeric浮点型变量,&numeric浮点型变量_numericvar,
       &整numeric型var变numeric量var,&"整NUMERIC型var变numeric量VAR",&"&NUMERIC_VAR",&"&numeric浮点型变量",
       &"numericeger&numeric浮点型变量",&numeric_var1,&numeric_var2,&numeric_var3,&numeric_var4,
       &numeric_var5,&numeric_var6,&numeric_var7,&numeric_var8,&numeric_var9,
       &numeric_var10,&numeric_var11,&numeric_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &numeric浮点型变量,tunique,&耄耋貔貅numeric浮点型变量,ttimestamp,
       &整numeric型var变numeric量var,tboolean,&numeric_var3,tnumeric FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &numeric_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"NUMERIC_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_NUMERIC_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_numeric_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &numeric浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric浮点型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_numeric浮点型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅numeric浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric浮点型变量_numericvar FROM t_session_var_pallas LIMIT 1;

SELECT &整numeric型var变numeric量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整NUMERIC型var变numeric量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&NUMERIC_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&numeric浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"numericeger&numeric浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &numeric_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &numeric_variable,&"NUMERIC_variable",&"123_NUMERIC_var",&"_numeric_VAR",
       &numeric浮点型变量,&numeric浮点型_变量,&"_numeric浮点型_变量",&耄耋貔貅numeric浮点型变量,&numeric浮点型变量_numericvar,
       &整numeric型var变numeric量var,&"整NUMERIC型var变numeric量VAR",&"&NUMERIC_VAR",&"&numeric浮点型变量",
       &"numericeger&numeric浮点型变量",&numeric_var1,&numeric_var2,&numeric_var3,&numeric_var4,
       &numeric_var5,&numeric_var6,&numeric_var7,&numeric_var8,&numeric_var9,
       &numeric_var10,&numeric_var11,&numeric_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &numeric浮点型变量,tunique,&耄耋貔貅numeric浮点型变量,ttimestamp,
       &整numeric型var变numeric量var,tboolean,&numeric_var3,tnumeric FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &numeric_variable FROM t_session_var_external LIMIT 1;

SELECT &"NUMERIC_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_NUMERIC_var" FROM t_session_var_external LIMIT 1;

SELECT &"_numeric_VAR" FROM t_session_var_external LIMIT 1;

SELECT &numeric浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &numeric浮点型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_numeric浮点型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅numeric浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &numeric浮点型变量_numericvar FROM t_session_var_external LIMIT 1;

SELECT &整numeric型var变numeric量var FROM t_session_var_external LIMIT 1;

SELECT &"整NUMERIC型var变numeric量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&NUMERIC_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&numeric浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &"numericeger&numeric浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &numeric_var1 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var2 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var3 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var4 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var5 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var6 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var7 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var8 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var9 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var10 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var11 FROM t_session_var_external LIMIT 1;

SELECT &numeric_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &numeric_variable,&"NUMERIC_variable",&"123_NUMERIC_var",&"_numeric_VAR",
       &numeric浮点型变量,&numeric浮点型_变量,&"_numeric浮点型_变量",&耄耋貔貅numeric浮点型变量,&numeric浮点型变量_numericvar,
       &整numeric型var变numeric量var,&"整NUMERIC型var变numeric量VAR",&"&NUMERIC_VAR",&"&numeric浮点型变量",
       &"numericeger&numeric浮点型变量",&numeric_var1,&numeric_var2,&numeric_var3,&numeric_var4,
       &numeric_var5,&numeric_var6,&numeric_var7,&numeric_var8,&numeric_var9,
       &numeric_var10,&numeric_var11,&numeric_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &numeric浮点型变量,tnumeric,&耄耋貔貅numeric浮点型变量,ttimestamp,
       &整numeric型var变numeric量var,tboolean,&numeric_var3,tnumeric FROM t_session_var_external
ORDER BY tnumeric LIMIT 5;

---dblink

----单列会话变量查询

SELECT &numeric_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"NUMERIC_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_NUMERIC_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_numeric_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric浮点型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_numeric浮点型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅numeric浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric浮点型变量_numericvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整numeric型var变numeric量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整NUMERIC型var变numeric量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&NUMERIC_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&numeric浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"numericeger&numeric浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &numeric_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &numeric_variable,&"NUMERIC_variable",&"123_NUMERIC_var",&"_numeric_VAR",
       &numeric浮点型变量,&numeric浮点型_变量,&"_numeric浮点型_变量",&耄耋貔貅numeric浮点型变量,&numeric浮点型变量_numericvar,
       &整numeric型var变numeric量var,&"整NUMERIC型var变numeric量VAR",&"&NUMERIC_VAR",&"&numeric浮点型变量",
       &"numericeger&numeric浮点型变量",&numeric_var1,&numeric_var2,&numeric_var3,&numeric_var4,
       &numeric_var5,&numeric_var6,&numeric_var7,&numeric_var8,&numeric_var9,
       &numeric_var10,&numeric_var11,&numeric_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &numeric浮点型变量,tunique,&耄耋貔貅numeric浮点型变量,ttimestamp,
       &整numeric型var变numeric量var,tboolean,&numeric_var3,tnumeric FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &numeric_variable OR tnumeric >= &"NUMERIC_variable"
       OR tsmallnumeric>= &"123_NUMERIC_var" AND tbignumeric <= &"_numeric_VAR";

SELECT tunique,tnumeric,tvarchar,tnumeric,tdecimal FROM t_session_var_dfs
WHERE tnumeric IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &numeric_variable OR tunique <= &numeric_variable);

---pallas表

SELECT tunique,tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &numeric_variable OR tnumeric >= &"NUMERIC_variable"
       OR tsmallnumeric>= &"123_NUMERIC_var" AND tbignumeric <= &"_numeric_VAR";

SELECT tunique,tnumeric,tvarchar,tnumeric,tdecimal FROM t_session_var_pallas
WHERE tnumeric IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &numeric_variable OR tunique <= &numeric_variable);

---外部表

SELECT tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tnumeric >= &numeric_variable OR tnumeric >= &"NUMERIC_variable"
       OR tsmallnumeric>= &"123_NUMERIC_var" AND tbignumeric <= &"_numeric_VAR";

SELECT tnumeric,tvarchar,tnumeric,tdecimal FROM t_session_var_external
WHERE tnumeric IN (SELECT tnumeric FROM t_session_var_external WHERE tnumeric >= &numeric_variable OR tnumeric <= &numeric_variable);

---dblink

SELECT tunique,tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &numeric_variable OR tnumeric >= &"NUMERIC_variable"
       OR tsmallnumeric>= &"123_NUMERIC_var" AND tbignumeric <= &"_numeric_VAR";

SELECT tunique,tnumeric,tvarchar,tnumeric,tdecimal FROM link_oracle_session_var.t_session_var
WHERE tnumeric IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &numeric_variable OR tunique <= &numeric_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tnumeric) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tnumeric) >= &numeric_variable OR SUM(tdecimal) <= "NUMERIC_variable" LIMIT 5;

---pallas表
SELECT tunique,tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tnumeric) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tnumeric) >= &numeric_variable OR SUM(tdecimal) <= "NUMERIC_variable" LIMIT 5;

---外部表
SELECT tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tnumeric) FROM t_session_var_external
       WHERE tnumeric >= 100146364 AND tnumeric <=2100146364
       GROUP BY tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tnumeric) >= &numeric_variable OR SUM(tdecimal) <= "NUMERIC_variable" LIMIT 5;

---dblink
SELECT tunique,tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tbinary,
       tvarbinary,tvarbinary,SUM(tnumeric) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tnumeric) >= &numeric_variable OR SUM(tdecimal) <= "NUMERIC_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric FROM t_session_var_dfs LIMIT &numeric_variable;

---pallas表
SELECT tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric FROM t_session_var_pallas LIMIT &numeric_variable;

---外部表
SELECT tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric FROM t_session_var_external LIMIT &numeric_variable;

---dblink
SELECT tnumeric,tvarchar,tnumeric,tdecimal,
       tdate,ttimestamp,tsmallnumeric,tbignumeric,tchar,
       tnumeric,tnumeric,tnumeric FROM link_oracle_session_var.t_session_var LIMIT &numeric_variable;

--变量作为动态表名

CREATE TABLE &numeric_variable(id NUMERIC(20,5),name VARCHAR(200));


CREATE TABLE &"NUMERIC(20,5)_variable"(id NUMERIC(20,5),name VARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &numeric浮点型变量(id INT,name VARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名
DROP TABLE IF EXISTS t_session_variable1;

CREATE TABLE t_session_variable1(&numeric浮点型变量 NUMERIC(20,5));

--变量不加&符

SELECT numeric_var1 FROM t_session_var_dfs LIMIT 1;

SELECT numeric_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;