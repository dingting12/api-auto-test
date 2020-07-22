--Description:real type session variable test
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
DECLARE real_variable REAL;

SHOW SESSION_VARIABLES;

DECLARE "REAL_variable" REAL;

SHOW SESSION_VARIABLES;

DECLARE 123_real_var REAL;

SHOW SESSION_VARIABLES;

DECLARE "123_REAL_var" REAL;

SHOW SESSION_VARIABLES;

DECLARE _real_var REAL;

SHOW SESSION_VARIABLES;

DECLARE "_real_VAR" REAL;

SHOW SESSION_VARIABLES;

---中文名
DECLARE real浮点型变量 REAL;

SHOW SESSION_VARIABLES;

DECLARE real浮点型_变量 REAL;

SHOW SESSION_VARIABLES;

DECLARE _real浮点型_变量 REAL;

SHOW SESSION_VARIABLES;

DECLARE "_real浮点型_变量" REAL;

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅real浮点型变量 REAL;

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE real浮点型变量_realvar REAL;

SHOW SESSION_VARIABLES;

DECLARE 整real型var变real量var REAL;

SHOW SESSION_VARIABLES;

DECLARE "整REAL型var变real量VAR" REAL;

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&REAL_VAR" REAL;

SHOW SESSION_VARIABLES;

DECLARE "&real浮点型变量" REAL;

SHOW SESSION_VARIABLES;

DECLARE realeger&real浮点型变量 REAL;

SHOW SESSION_VARIABLES;

DECLARE "realeger&real浮点型变量" REAL;

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE real_var1 REAL DEFAULT 0;

DECLARE real_var2 REAL DEFAULT -1.79769313486231E+308;

DECLARE real_var3 REAL DEFAULT -2.22507385850720E-308;

DECLARE real_var4 REAL DEFAULT 2.22507385850720E-308;

DECLARE real_var5 REAL DEFAULT 1.79769313486231E+308;

DECLARE real_var6 REAL DEFAULT 100;

---默认值与该类型不符
DECLARE real_var7 REAL DEFAULT "23123";

DECLARE real_var8 REAL DEFAULT "dvfg";

DECLARE real_var9 REAL DEFAULT TRUE;

DECLARE real_var10 REAL DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE real_var11 REAL DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE real_var12 REAL DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET real_variable = -1.79769313486231E+308 ;

SET "REAL_variable" = -2.22507385850720E-308 ;

SET 123_real_var = 2323 ;

SET "123_REAL_var" = 2.22507385850720E-308 ;

SET _real_var = 1223 ;

SET "_real_VAR" = 1.79769313486231E+308 ;

SET real浮点型变量 = 0 ;

SET real浮点型_变量 = 1 ;

SET _real浮点型_变量 = 2 ;

SET "_real浮点型_变量" = 3 ;

SET 耄耋貔貅real浮点型变量 = 4 ;

SET real浮点型变量_realvar = 5 ;

SET 整real型var变real量var = 6 ;

SET "整REAL型var变real量VAR" = 7 ;

SET "&REAL_VAR"  = 8 ;

SET "&real浮点型变量" = 9 ;

SET realeger&real浮点型变量 = 43565 ;

SET "realeger&real浮点型变量" = 10 ;

---赋的值与该类型不符
SET real_var1 = "23123";

SET real_var2 = "dvfg";

SET real_var3 = TRUE;

SET real_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET real浮点型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &real_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"REAL_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_REAL_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_real_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &real浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &real浮点型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_real浮点型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅real浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &real浮点型变量_realvar FROM t_session_var_dfs LIMIT 1;

SELECT &整real型var变real量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整REAL型var变real量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&REAL_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&real浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"realeger&real浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &real_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &real_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &real_variable,&"REAL_variable",&"123_REAL_var",&"_real_VAR",
       &real浮点型变量,&real浮点型_变量,&"_real浮点型_变量",&耄耋貔貅real浮点型变量,&real浮点型变量_realvar,
       &整real型var变real量var,&"整REAL型var变real量VAR",&"&REAL_VAR",&"&real浮点型变量",
       &"realeger&real浮点型变量",&real_var1,&real_var2,&real_var3,&real_var4,
       &real_var5,&real_var6,&real_var7,&real_var8,&real_var9,
       &real_var10,&real_var11,&real_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &real浮点型变量,tunique,&耄耋貔貅real浮点型变量,ttimestamp,
       &整real型var变real量var,tboolean,&real_var3,tnumeric FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &real_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"REAL_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_REAL_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_real_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &real浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &real浮点型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_real浮点型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅real浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &real浮点型变量_realvar FROM t_session_var_pallas LIMIT 1;

SELECT &整real型var变real量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整REAL型var变real量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&REAL_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&real浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"realeger&real浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &real_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &real_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &real_variable,&"REAL_variable",&"123_REAL_var",&"_real_VAR",
       &real浮点型变量,&real浮点型_变量,&"_real浮点型_变量",&耄耋貔貅real浮点型变量,&real浮点型变量_realvar,
       &整real型var变real量var,&"整REAL型var变real量VAR",&"&REAL_VAR",&"&real浮点型变量",
       &"realeger&real浮点型变量",&real_var1,&real_var2,&real_var3,&real_var4,
       &real_var5,&real_var6,&real_var7,&real_var8,&real_var9,
       &real_var10,&real_var11,&real_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &real浮点型变量,tunique,&耄耋貔貅real浮点型变量,ttimestamp,
       &整real型var变real量var,tboolean,&real_var3,tnumeric FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &real_variable FROM t_session_var_external LIMIT 1;

SELECT &"REAL_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_REAL_var" FROM t_session_var_external LIMIT 1;

SELECT &"_real_VAR" FROM t_session_var_external LIMIT 1;

SELECT &real浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &real浮点型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_real浮点型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅real浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &real浮点型变量_realvar FROM t_session_var_external LIMIT 1;

SELECT &整real型var变real量var FROM t_session_var_external LIMIT 1;

SELECT &"整REAL型var变real量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&REAL_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&real浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &"realeger&real浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &real_var1 FROM t_session_var_external LIMIT 1;

SELECT &real_var2 FROM t_session_var_external LIMIT 1;

SELECT &real_var3 FROM t_session_var_external LIMIT 1;

SELECT &real_var4 FROM t_session_var_external LIMIT 1;

SELECT &real_var5 FROM t_session_var_external LIMIT 1;

SELECT &real_var6 FROM t_session_var_external LIMIT 1;

SELECT &real_var7 FROM t_session_var_external LIMIT 1;

SELECT &real_var8 FROM t_session_var_external LIMIT 1;

SELECT &real_var9 FROM t_session_var_external LIMIT 1;

SELECT &real_var10 FROM t_session_var_external LIMIT 1;

SELECT &real_var11 FROM t_session_var_external LIMIT 1;

SELECT &real_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &real_variable,&"REAL_variable",&"123_REAL_var",&"_real_VAR",
       &real浮点型变量,&real浮点型_变量,&"_real浮点型_变量",&耄耋貔貅real浮点型变量,&real浮点型变量_realvar,
       &整real型var变real量var,&"整REAL型var变real量VAR",&"&REAL_VAR",&"&real浮点型变量",
       &"realeger&real浮点型变量",&real_var1,&real_var2,&real_var3,&real_var4,
       &real_var5,&real_var6,&real_var7,&real_var8,&real_var9,
       &real_var10,&real_var11,&real_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &real浮点型变量,treal,&耄耋貔貅real浮点型变量,ttimestamp,
       &整real型var变real量var,tboolean,&real_var3,tnumeric FROM t_session_var_external
ORDER BY treal LIMIT 5;

---dblink

----单列会话变量查询

SELECT &real_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"REAL_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_REAL_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_real_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real浮点型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_real浮点型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅real浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real浮点型变量_realvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整real型var变real量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整REAL型var变real量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&REAL_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&real浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"realeger&real浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &real_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &real_variable,&"REAL_variable",&"123_REAL_var",&"_real_VAR",
       &real浮点型变量,&real浮点型_变量,&"_real浮点型_变量",&耄耋貔貅real浮点型变量,&real浮点型变量_realvar,
       &整real型var变real量var,&"整REAL型var变real量VAR",&"&REAL_VAR",&"&real浮点型变量",
       &"realeger&real浮点型变量",&real_var1,&real_var2,&real_var3,&real_var4,
       &real_var5,&real_var6,&real_var7,&real_var8,&real_var9,
       &real_var10,&real_var11,&real_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &real浮点型变量,tunique,&耄耋貔貅real浮点型变量,ttimestamp,
       &整real型var变real量var,tboolean,&real_var3,tnumeric FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &real_variable OR treal >= &"REAL_variable"
       OR tsmallreal>= &"123_REAL_var" AND tbigreal <= &"_real_VAR";

SELECT tunique,treal,tvarchar,tdouble,tdecimal FROM t_session_var_dfs
WHERE treal IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &real_variable OR tunique <= &real_variable);

---pallas表

SELECT tunique,treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &real_variable OR treal >= &"REAL_variable"
       OR tsmallreal>= &"123_REAL_var" AND tbigreal <= &"_real_VAR";

SELECT tunique,treal,tvarchar,tdouble,tdecimal FROM t_session_var_pallas
WHERE treal IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &real_variable OR tunique <= &real_variable);

---外部表

SELECT treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE treal >= &real_variable OR treal >= &"REAL_variable"
       OR tsmallreal>= &"123_REAL_var" AND tbigreal <= &"_real_VAR";

SELECT treal,tvarchar,tdouble,tdecimal FROM t_session_var_external
WHERE treal IN (SELECT treal FROM t_session_var_external WHERE treal >= &real_variable OR treal <= &real_variable);

---dblink

SELECT tunique,treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &real_variable OR treal >= &"REAL_variable"
       OR tsmallreal>= &"123_REAL_var" AND tbigreal <= &"_real_VAR";

SELECT tunique,treal,tvarchar,tdouble,tdecimal FROM link_oracle_session_var.t_session_var
WHERE treal IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &real_variable OR tunique <= &real_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &real_variable OR SUM(tdecimal) <= "REAL_variable" LIMIT 5;

---pallas表
SELECT tunique,treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &real_variable OR SUM(tdecimal) <= "REAL_variable" LIMIT 5;

---外部表
SELECT treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_external
       WHERE treal >= 100146364 AND treal <=2100146364
       GROUP BY treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &real_variable OR SUM(tdecimal) <= "REAL_variable" LIMIT 5;

---dblink
SELECT tunique,treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &real_variable OR SUM(tdecimal) <= "REAL_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal FROM t_session_var_dfs LIMIT &real_variable;

---pallas表
SELECT treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal FROM t_session_var_pallas LIMIT &real_variable;

---外部表
SELECT treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal FROM t_session_var_external LIMIT &real_variable;

---dblink
SELECT treal,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallreal,tbigreal,tchar,
       tnumeric,tfloat,treal FROM link_oracle_session_var.t_session_var LIMIT &real_variable;

--变量作为动态表名

CREATE TABLE &real_variable(id REAL,name VARCHAR(200));


CREATE TABLE &"REAL_variable"(id REAL,name VARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &real浮点型变量(id REAL,name VARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名

CREATE TABLE t_session_variable1(&real浮点型变量 REAL);

--变量不加&符

SELECT real_var1 FROM t_session_var_dfs LIMIT 1;

SELECT real_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;