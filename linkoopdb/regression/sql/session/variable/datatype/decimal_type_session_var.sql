--Description:decimal type session variable test
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
DECLARE decimal_variable DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE "DECIMAL_variable" DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE 123_decimal_var DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE "123_DECIMAL_var" DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE _decimal_var DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE "_decimal_VAR" DECIMAL(20,5);

SHOW SESSION_VARIABLES;

---中文名
DECLARE decimal浮点型变量 DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE decimal浮点型_变量 DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE _decimal浮点型_变量 DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE "_decimal浮点型_变量" DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅decimal浮点型变量 DECIMAL(20,5);

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE decimal浮点型变量_decimalvar DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE 整decimal型var变decimal量var DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE "整DECIMAL型var变decimal量VAR" DECIMAL(20,5);

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&DECIMAL_VAR" DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE "&decimal浮点型变量" DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE decimaleger&decimal浮点型变量 DECIMAL(20,5);

SHOW SESSION_VARIABLES;

DECLARE "decimaleger&decimal浮点型变量" DECIMAL(20,5);

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE decimal_var1 DECIMAL(20,5) DEFAULT 0;

DECLARE decimal_var2 DECIMAL(20,5) DEFAULT -999999999999999.99999;

DECLARE decimal_var3 DECIMAL(20,5) DEFAULT 999999999999999.99999;

DECLARE decimal_var4 DECIMAL(20,5) DEFAULT 9999999999999999.99999;

DECLARE decimal_var5 DECIMAL(20,5) DEFAULT -9999999999999999.99999;

DECLARE decimal_var6 DECIMAL(20,5) DEFAULT 100;

---默认值与该类型不符
DECLARE decimal_var7 DECIMAL(20,5) DEFAULT "23123";

DECLARE decimal_var8 DECIMAL(20,5) DEFAULT "dvfg";

DECLARE decimal_var9 DECIMAL(20,5) DEFAULT TRUE;

DECLARE decimal_var10 DECIMAL(20,5) DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE decimal_var11 DECIMAL(20,5) DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE decimal_var12 DECIMAL(20,5) DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET decimal_variable = -999999999999999.99999 ;

SET "DECIMAL_variable" = 999999999999999.99999 ;

SET 123_decimal_var = 2323 ;

SET "123_DECIMAL_var" = 9999999999999999.99999 ;

SET _decimal_var = 1223 ;

SET "_decimal_VAR" = -9999999999999999.99999 ;

SET decimal浮点型变量 = 0 ;

SET decimal浮点型_变量 = 1 ;

SET _decimal浮点型_变量 = 2 ;

SET "_decimal浮点型_变量" = 3 ;

SET 耄耋貔貅decimal浮点型变量 = 4 ;

SET decimal浮点型变量_decimalvar = 5 ;

SET 整decimal型var变decimal量var = 6 ;

SET "整DECIMAL型var变decimal量VAR" = 7 ;

SET "&DECIMAL_VAR"  = 8 ;

SET "&decimal浮点型变量" = 9 ;

SET decimaleger&decimal浮点型变量 = 43565 ;

SET "decimaleger&decimal浮点型变量" = 10 ;

---赋的值与该类型不符
SET decimal_var1 = "23123";

SET decimal_var2 = "dvfg";

SET decimal_var3 = TRUE;

SET decimal_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET decimal浮点型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &decimal_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"DECIMAL_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_DECIMAL_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_decimal_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &decimal浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal浮点型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_decimal浮点型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅decimal浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal浮点型变量_decimalvar FROM t_session_var_dfs LIMIT 1;

SELECT &整decimal型var变decimal量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整DECIMAL型var变decimal量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&DECIMAL_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&decimal浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"decimaleger&decimal浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &decimal_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &decimal_variable,&"DECIMAL_variable",&"123_DECIMAL_var",&"_decimal_VAR",
       &decimal浮点型变量,&decimal浮点型_变量,&"_decimal浮点型_变量",&耄耋貔貅decimal浮点型变量,&decimal浮点型变量_decimalvar,
       &整decimal型var变decimal量var,&"整DECIMAL型var变decimal量VAR",&"&DECIMAL_VAR",&"&decimal浮点型变量",
       &"decimaleger&decimal浮点型变量",&decimal_var1,&decimal_var2,&decimal_var3,&decimal_var4,
       &decimal_var5,&decimal_var6,&decimal_var7,&decimal_var8,&decimal_var9,
       &decimal_var10,&decimal_var11,&decimal_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &decimal浮点型变量,tunique,&耄耋貔貅decimal浮点型变量,ttimestamp,
       &整decimal型var变decimal量var,tboolean,&decimal_var3,tdecimal FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &decimal_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"DECIMAL_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_DECIMAL_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_decimal_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &decimal浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal浮点型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_decimal浮点型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅decimal浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal浮点型变量_decimalvar FROM t_session_var_pallas LIMIT 1;

SELECT &整decimal型var变decimal量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整DECIMAL型var变decimal量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&DECIMAL_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&decimal浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"decimaleger&decimal浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &decimal_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &decimal_variable,&"DECIMAL_variable",&"123_DECIMAL_var",&"_decimal_VAR",
       &decimal浮点型变量,&decimal浮点型_变量,&"_decimal浮点型_变量",&耄耋貔貅decimal浮点型变量,&decimal浮点型变量_decimalvar,
       &整decimal型var变decimal量var,&"整DECIMAL型var变decimal量VAR",&"&DECIMAL_VAR",&"&decimal浮点型变量",
       &"decimaleger&decimal浮点型变量",&decimal_var1,&decimal_var2,&decimal_var3,&decimal_var4,
       &decimal_var5,&decimal_var6,&decimal_var7,&decimal_var8,&decimal_var9,
       &decimal_var10,&decimal_var11,&decimal_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &decimal浮点型变量,tunique,&耄耋貔貅decimal浮点型变量,ttimestamp,
       &整decimal型var变decimal量var,tboolean,&decimal_var3,tdecimal FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &decimal_variable FROM t_session_var_external LIMIT 1;

SELECT &"DECIMAL_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_DECIMAL_var" FROM t_session_var_external LIMIT 1;

SELECT &"_decimal_VAR" FROM t_session_var_external LIMIT 1;

SELECT &decimal浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &decimal浮点型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_decimal浮点型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅decimal浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &decimal浮点型变量_decimalvar FROM t_session_var_external LIMIT 1;

SELECT &整decimal型var变decimal量var FROM t_session_var_external LIMIT 1;

SELECT &"整DECIMAL型var变decimal量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&DECIMAL_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&decimal浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &"decimaleger&decimal浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &decimal_var1 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var2 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var3 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var4 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var5 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var6 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var7 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var8 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var9 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var10 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var11 FROM t_session_var_external LIMIT 1;

SELECT &decimal_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &decimal_variable,&"DECIMAL_variable",&"123_DECIMAL_var",&"_decimal_VAR",
       &decimal浮点型变量,&decimal浮点型_变量,&"_decimal浮点型_变量",&耄耋貔貅decimal浮点型变量,&decimal浮点型变量_decimalvar,
       &整decimal型var变decimal量var,&"整DECIMAL型var变decimal量VAR",&"&DECIMAL_VAR",&"&decimal浮点型变量",
       &"decimaleger&decimal浮点型变量",&decimal_var1,&decimal_var2,&decimal_var3,&decimal_var4,
       &decimal_var5,&decimal_var6,&decimal_var7,&decimal_var8,&decimal_var9,
       &decimal_var10,&decimal_var11,&decimal_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &decimal浮点型变量,tdecimal,&耄耋貔貅decimal浮点型变量,ttimestamp,
       &整decimal型var变decimal量var,tboolean,&decimal_var3,tdecimal FROM t_session_var_external
ORDER BY tdecimal LIMIT 5;

---dblink

----单列会话变量查询

SELECT &decimal_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"DECIMAL_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_DECIMAL_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_decimal_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal浮点型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_decimal浮点型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅decimal浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal浮点型变量_decimalvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整decimal型var变decimal量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整DECIMAL型var变decimal量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&DECIMAL_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&decimal浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"decimaleger&decimal浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &decimal_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &decimal_variable,&"DECIMAL_variable",&"123_DECIMAL_var",&"_decimal_VAR",
       &decimal浮点型变量,&decimal浮点型_变量,&"_decimal浮点型_变量",&耄耋貔貅decimal浮点型变量,&decimal浮点型变量_decimalvar,
       &整decimal型var变decimal量var,&"整DECIMAL型var变decimal量VAR",&"&DECIMAL_VAR",&"&decimal浮点型变量",
       &"decimaleger&decimal浮点型变量",&decimal_var1,&decimal_var2,&decimal_var3,&decimal_var4,
       &decimal_var5,&decimal_var6,&decimal_var7,&decimal_var8,&decimal_var9,
       &decimal_var10,&decimal_var11,&decimal_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &decimal浮点型变量,tunique,&耄耋貔貅decimal浮点型变量,ttimestamp,
       &整decimal型var变decimal量var,tboolean,&decimal_var3,tdecimal FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &decimal_variable OR tdecimal >= &"DECIMAL_variable"
       OR tsmalldecimal>= &"123_DECIMAL_var" AND tbigdecimal <= &"_decimal_VAR";

SELECT tunique,tdecimal,tvarchar,tdecimal,tdecimal FROM t_session_var_dfs
WHERE tdecimal IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &decimal_variable OR tunique <= &decimal_variable);

---pallas表

SELECT tunique,tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &decimal_variable OR tdecimal >= &"DECIMAL_variable"
       OR tsmalldecimal>= &"123_DECIMAL_var" AND tbigdecimal <= &"_decimal_VAR";

SELECT tunique,tdecimal,tvarchar,tdecimal,tdecimal FROM t_session_var_pallas
WHERE tdecimal IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &decimal_variable OR tunique <= &decimal_variable);

---外部表

SELECT tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tdecimal >= &decimal_variable OR tdecimal >= &"DECIMAL_variable"
       OR tsmalldecimal>= &"123_DECIMAL_var" AND tbigdecimal <= &"_decimal_VAR";

SELECT tdecimal,tvarchar,tdecimal,tdecimal FROM t_session_var_external
WHERE tdecimal IN (SELECT tdecimal FROM t_session_var_external WHERE tdecimal >= &decimal_variable OR tdecimal <= &decimal_variable);

---dblink

SELECT tunique,tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &decimal_variable OR tdecimal >= &"DECIMAL_variable"
       OR tsmalldecimal>= &"123_DECIMAL_var" AND tbigdecimal <= &"_decimal_VAR";

SELECT tunique,tdecimal,tvarchar,tdecimal,tdecimal FROM link_oracle_session_var.t_session_var
WHERE tdecimal IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &decimal_variable OR tunique <= &decimal_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdecimal) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdecimal) >= &decimal_variable OR SUM(tdecimal) <= "DECIMAL_variable" LIMIT 5;

---pallas表
SELECT tunique,tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdecimal) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdecimal) >= &decimal_variable OR SUM(tdecimal) <= "DECIMAL_variable" LIMIT 5;

---外部表
SELECT tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdecimal) FROM t_session_var_external
       WHERE tdecimal >= 100146364 AND tdecimal <=2100146364
       GROUP BY tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdecimal) >= &decimal_variable OR SUM(tdecimal) <= "DECIMAL_variable" LIMIT 5;

---dblink
SELECT tunique,tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tbinary,
       tvarbinary,tvarbinary,SUM(tdecimal) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdecimal) >= &decimal_variable OR SUM(tdecimal) <= "DECIMAL_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal FROM t_session_var_dfs LIMIT &decimal_variable;

---pallas表
SELECT tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal FROM t_session_var_pallas LIMIT &decimal_variable;

---外部表
SELECT tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal FROM t_session_var_external LIMIT &decimal_variable;

---dblink
SELECT tdecimal,tvarchar,tdecimal,tdecimal,
       tdate,ttimestamp,tsmalldecimal,tbigdecimal,tchar,
       tdecimal,tdecimal,tdecimal FROM link_oracle_session_var.t_session_var LIMIT &decimal_variable;

--变量作为动态表名

CREATE TABLE &decimal_variable(id DECIMAL(20,5),name VARCHAR(200));


CREATE TABLE &"DECIMAL(20,5)_variable"(id DECIMAL(20,5),name VARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &decimal浮点型变量(id INT,name VARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名
DROP TABLE IF EXISTS t_session_variable1;

CREATE TABLE t_session_variable1(&decimal浮点型变量 DECIMAL(20,5));

--变量不加&符

SELECT decimal_var1 FROM t_session_var_dfs LIMIT 1;

SELECT decimal_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;