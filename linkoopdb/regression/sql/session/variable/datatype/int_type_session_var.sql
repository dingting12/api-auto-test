--Description:int type session variable test
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
DECLARE int_variable INT;

SHOW SESSION_VARIABLES;

DECLARE "INT_variable" INT;

SHOW SESSION_VARIABLES;

DECLARE 123_int_var INT;

SHOW SESSION_VARIABLES;

DECLARE "123_INT_var" INT;

SHOW SESSION_VARIABLES;

DECLARE _int_var INT;

SHOW SESSION_VARIABLES;

DECLARE "_int_VAR" INT;

SHOW SESSION_VARIABLES;

---中文名
DECLARE 整型变量 INT;

SHOW SESSION_VARIABLES;

DECLARE 整型_变量 INT;

SHOW SESSION_VARIABLES;

DECLARE _整型_变量 INT;

SHOW SESSION_VARIABLES;

DECLARE "_整型_变量" INT;

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅整型变量 INT;

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE 整型变量_intvar INT;

SHOW SESSION_VARIABLES;

DECLARE 整int型var变int量var INT;

SHOW SESSION_VARIABLES;

DECLARE "整INT型var变int量VAR" INT;

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&INT_VAR" INT;

SHOW SESSION_VARIABLES;

DECLARE "&整型变量" INT;

SHOW SESSION_VARIABLES;

DECLARE integer&整型变量 INT;

SHOW SESSION_VARIABLES;

DECLARE "integer&整型变量" INT;

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE int_var1 INT DEFAULT 0;

DECLARE int_var2 INT DEFAULT -2147483648;

DECLARE int_var3 INT DEFAULT 2147483647;

DECLARE int_var4 INT DEFAULT -2147483649;

DECLARE int_var5 INT DEFAULT 2147483648;

DECLARE int_var6 INT DEFAULT 100;

---默认值与该类型不符
DECLARE int_var7 INT DEFAULT "23123";

DECLARE int_var8 INT DEFAULT "dvfg";

DECLARE int_var9 INT DEFAULT TRUE;

DECLARE int_var10 INT DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE int_var11 INT DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE int_var12 INT DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET int_variable = -2147483648 ;

SET "INT_variable" = 2147483647 ;

SET 123_int_var = 2323 ;

SET "123_INT_var" = -2147483649 ;

SET _int_var = 1223 ;

SET "_int_VAR" = 2147483648 ;

SET 整型变量 = 0 ;

SET 整型_变量 = 1 ;

SET _整型_变量 = 2 ;

SET "_整型_变量" = 3 ;

SET 耄耋貔貅整型变量 = 4 ;

SET 整型变量_intvar = 5 ;

SET 整int型var变int量var = 6 ;

SET "整INT型var变int量VAR" = 7 ;

SET "&INT_VAR"  = 8 ;

SET "&整型变量" = 9 ;

SET integer&整型变量 = 43565 ;

SET "integer&整型变量" = 10 ;

---赋的值与该类型不符
SET int_var1 = "23123";

SET int_var2 = "dvfg";

SET int_var3 = TRUE;

SET int_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET 整型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &int_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"INT_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_INT_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_int_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &整型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &整型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_整型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅整型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &整型变量_intvar FROM t_session_var_dfs LIMIT 1;

SELECT &整int型var变int量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整INT型var变int量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&INT_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&整型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"integer&整型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &int_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &int_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &int_variable,&"INT_variable",&"123_INT_var",&"_int_VAR",
       &整型变量,&整型_变量,&"_整型_变量",&耄耋貔貅整型变量,&整型变量_intvar,
       &整int型var变int量var,&"整INT型var变int量VAR",&"&INT_VAR",&"&整型变量",
       &"integer&整型变量",&int_var1,&int_var2,&int_var3,&int_var4,
       &int_var5,&int_var6,&int_var7,&int_var8,&int_var9,
       &int_var10,&int_var11,&int_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &整型变量,tunique,&耄耋貔貅整型变量,ttimestamp,
       &整int型var变int量var,tboolean,&int_var3,tnumeric FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &int_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"INT_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_INT_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_int_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &整型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &整型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_整型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅整型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &整型变量_intvar FROM t_session_var_pallas LIMIT 1;

SELECT &整int型var变int量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整INT型var变int量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&INT_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&整型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"integer&整型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &int_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &int_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &int_variable,&"INT_variable",&"123_INT_var",&"_int_VAR",
       &整型变量,&整型_变量,&"_整型_变量",&耄耋貔貅整型变量,&整型变量_intvar,
       &整int型var变int量var,&"整INT型var变int量VAR",&"&INT_VAR",&"&整型变量",
       &"integer&整型变量",&int_var1,&int_var2,&int_var3,&int_var4,
       &int_var5,&int_var6,&int_var7,&int_var8,&int_var9,
       &int_var10,&int_var11,&int_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &整型变量,tunique,&耄耋貔貅整型变量,ttimestamp,
       &整int型var变int量var,tboolean,&int_var3,tnumeric FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &int_variable FROM t_session_var_external LIMIT 1;

SELECT &"INT_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_INT_var" FROM t_session_var_external LIMIT 1;

SELECT &"_int_VAR" FROM t_session_var_external LIMIT 1;

SELECT &整型变量 FROM t_session_var_external LIMIT 1;

SELECT &整型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_整型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅整型变量 FROM t_session_var_external LIMIT 1;

SELECT &整型变量_intvar FROM t_session_var_external LIMIT 1;

SELECT &整int型var变int量var FROM t_session_var_external LIMIT 1;

SELECT &"整INT型var变int量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&INT_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&整型变量" FROM t_session_var_external LIMIT 1;

SELECT &"integer&整型变量" FROM t_session_var_external LIMIT 1;

SELECT &int_var1 FROM t_session_var_external LIMIT 1;

SELECT &int_var2 FROM t_session_var_external LIMIT 1;

SELECT &int_var3 FROM t_session_var_external LIMIT 1;

SELECT &int_var4 FROM t_session_var_external LIMIT 1;

SELECT &int_var5 FROM t_session_var_external LIMIT 1;

SELECT &int_var6 FROM t_session_var_external LIMIT 1;

SELECT &int_var7 FROM t_session_var_external LIMIT 1;

SELECT &int_var8 FROM t_session_var_external LIMIT 1;

SELECT &int_var9 FROM t_session_var_external LIMIT 1;

SELECT &int_var10 FROM t_session_var_external LIMIT 1;

SELECT &int_var11 FROM t_session_var_external LIMIT 1;

SELECT &int_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &int_variable,&"INT_variable",&"123_INT_var",&"_int_VAR",
       &整型变量,&整型_变量,&"_整型_变量",&耄耋貔貅整型变量,&整型变量_intvar,
       &整int型var变int量var,&"整INT型var变int量VAR",&"&INT_VAR",&"&整型变量",
       &"integer&整型变量",&int_var1,&int_var2,&int_var3,&int_var4,
       &int_var5,&int_var6,&int_var7,&int_var8,&int_var9,
       &int_var10,&int_var11,&int_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &整型变量,tint,&耄耋貔貅整型变量,ttimestamp,
       &整int型var变int量var,tboolean,&int_var3,tnumeric FROM t_session_var_external
ORDER BY tint LIMIT 5;

---dblink

----单列会话变量查询

SELECT &int_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"INT_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_INT_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_int_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_整型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅整型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整型变量_intvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整int型var变int量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整INT型var变int量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&INT_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&整型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"integer&整型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &int_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &int_variable,&"INT_variable",&"123_INT_var",&"_int_VAR",
       &整型变量,&整型_变量,&"_整型_变量",&耄耋貔貅整型变量,&整型变量_intvar,
       &整int型var变int量var,&"整INT型var变int量VAR",&"&INT_VAR",&"&整型变量",
       &"integer&整型变量",&int_var1,&int_var2,&int_var3,&int_var4,
       &int_var5,&int_var6,&int_var7,&int_var8,&int_var9,
       &int_var10,&int_var11,&int_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &整型变量,tunique,&耄耋貔貅整型变量,ttimestamp,
       &整int型var变int量var,tboolean,&int_var3,tnumeric FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &int_variable OR tint >= &"INT_variable"
       OR tsmallint>= &"123_INT_var" AND tbigint <= &"_int_VAR";

SELECT tunique,tint,tvarchar,tdouble,tdecimal FROM t_session_var_dfs
WHERE tint IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &int_variable OR tunique <= &int_variable);

---pallas表

SELECT tunique,tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &int_variable OR tint >= &"INT_variable"
       OR tsmallint>= &"123_INT_var" AND tbigint <= &"_int_VAR";

SELECT tunique,tint,tvarchar,tdouble,tdecimal FROM t_session_var_pallas
WHERE tint IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &int_variable OR tunique <= &int_variable);

---外部表

SELECT tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tint >= &int_variable OR tint >= &"INT_variable"
       OR tsmallint>= &"123_INT_var" AND tbigint <= &"_int_VAR";

SELECT tint,tvarchar,tdouble,tdecimal FROM t_session_var_external
WHERE tint IN (SELECT tint FROM t_session_var_external WHERE tint >= &int_variable OR tint <= &int_variable);

---dblink

SELECT tunique,tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &int_variable OR tint >= &"INT_variable"
       OR tsmallint>= &"123_INT_var" AND tbigint <= &"_int_VAR";

SELECT tunique,tint,tvarchar,tdouble,tdecimal FROM link_oracle_session_var.t_session_var
WHERE tint IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &int_variable OR tunique <= &int_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &int_variable OR SUM(tdecimal) <= "INT_variable" LIMIT 5;

---pallas表
SELECT tunique,tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &int_variable OR SUM(tdecimal) <= "INT_variable" LIMIT 5;

---外部表
SELECT tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_external
       WHERE tint >= 100146364 AND tint <=2100146364
       GROUP BY tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &int_variable OR SUM(tdecimal) <= "INT_variable" LIMIT 5;

---dblink
SELECT tunique,tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &int_variable OR SUM(tdecimal) <= "INT_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal FROM t_session_var_dfs LIMIT &int_variable;

---pallas表
SELECT tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal FROM t_session_var_pallas LIMIT &int_variable;

---外部表
SELECT tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal FROM t_session_var_external LIMIT &int_variable;

---dblink
SELECT tint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallint,tbigint,tchar,
       tnumeric,tfloat,treal FROM link_oracle_session_var.t_session_var LIMIT &int_variable;

--变量作为动态表名

CREATE TABLE &int_variable(id INT,name VARCHAR(200));


CREATE TABLE &"INT_variable"(id INT,name VARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &整型变量(id INT,name VARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名

CREATE TABLE t_session_variable1(&整型变量 INT);

--变量不加&符

SELECT int_var1 FROM t_session_var_dfs LIMIT 1;

SELECT int_var2 FROM t_session_var_dfs LIMIT 1;


--session断开后再连接，查看变量是否删除

session save sessionA;

disconnect;

session restore sessionA;

show session_variables;