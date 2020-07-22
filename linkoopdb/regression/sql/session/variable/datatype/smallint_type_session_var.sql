--Description:smallint type session variable test
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
DECLARE smallint_variable SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE "SMALLINT_variable" SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE 123_smallint_var SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE "123_SMALLINT_var" SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE _smallint_var SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE "_smallint_VAR" SMALLINT;

SHOW SESSION_VARIABLES;

---中文名
DECLARE 短整型变量 SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE 短整型_变量 SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE _短整型_变量 SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE "_短整型_变量" SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅短整型变量 SMALLINT;

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE 短整型变量_smallintvar SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE 整smallint型var变smallint量var SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE "整SMALLINT型var变smallint量VAR" SMALLINT;

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&SMALLINT_VAR" SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE "&短整型变量" SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE smallinteger&短整型变量 SMALLINT;

SHOW SESSION_VARIABLES;

DECLARE "smallinteger&短整型变量" SMALLINT;

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE smallint_var1 SMALLINT DEFAULT 0;

DECLARE smallint_var2 SMALLINT DEFAULT -32768;

DECLARE smallint_var3 SMALLINT DEFAULT 32767;

DECLARE smallint_var4 SMALLINT DEFAULT -32769;

DECLARE smallint_var5 SMALLINT DEFAULT 32768;

DECLARE smallint_var6 SMALLINT DEFAULT 100;

---默认值与该类型不符
DECLARE smallint_var7 SMALLINT DEFAULT "23123";

DECLARE smallint_var8 SMALLINT DEFAULT "dvfg";

DECLARE smallint_var9 SMALLINT DEFAULT TRUE;

DECLARE smallint_var10 SMALLINT DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE smallint_var11 SMALLINT DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE smallint_var12 SMALLINT DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET smallint_variable = -32768 ;

SET "SMALLINT_variable" = 32767 ;

SET 123_smallint_var = 2323 ;

SET "123_SMALLINT_var" = -32769 ;

SET _smallint_var = 1223 ;

SET "_smallint_VAR" = 32768 ;

SET 短整型变量 = 0 ;

SET 短整型_变量 = 1 ;

SET _短整型_变量 = 2 ;

SET "_短整型_变量" = 3 ;

SET 耄耋貔貅短整型变量 = 4 ;

SET 短整型变量_smallintvar = 5 ;

SET 整smallint型var变smallint量var = 6 ;

SET "整SMALLINT型var变smallint量VAR" = 7 ;

SET "&SMALLINT_VAR"  = 8 ;

SET "&短整型变量" = 9 ;

SET smallinteger&短整型变量 = 43565 ;

SET "smallinteger&短整型变量" = 10 ;

---赋的值与该类型不符
SET smallint_var1 = "23123";

SET smallint_var2 = "dvfg";

SET smallint_var3 = TRUE;

SET smallint_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET 短整型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &smallint_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"SMALLINT_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_SMALLINT_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_smallint_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &短整型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &短整型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_短整型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅短整型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &短整型变量_smallintvar FROM t_session_var_dfs LIMIT 1;

SELECT &整smallint型var变smallint量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整SMALLINT型var变smallint量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&SMALLINT_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&短整型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"smallinteger&短整型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &smallint_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &smallint_variable,&"SMALLINT_variable",&"123_SMALLINT_var",&"_smallint_VAR",
       &短整型变量,&短整型_变量,&"_短整型_变量",&耄耋貔貅短整型变量,&短整型变量_smallintvar,
       &整smallint型var变smallint量var,&"整SMALLINT型var变smallint量VAR",&"&SMALLINT_VAR",&"&短整型变量",
       &"smallinteger&短整型变量",&smallint_var1,&smallint_var2,&smallint_var3,&smallint_var4,
       &smallint_var5,&smallint_var6,&smallint_var7,&smallint_var8,&smallint_var9,
       &smallint_var10,&smallint_var11,&smallint_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &短整型变量,tunique,&耄耋貔貅短整型变量,ttimestamp,
       &整smallint型var变smallint量var,tboolean,&smallint_var3,tnumeric FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &smallint_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"SMALLINT_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_SMALLINT_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_smallint_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &短整型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &短整型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_短整型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅短整型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &短整型变量_smallintvar FROM t_session_var_pallas LIMIT 1;

SELECT &整smallint型var变smallint量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整SMALLINT型var变smallint量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&SMALLINT_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&短整型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"smallinteger&短整型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &smallint_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &smallint_variable,&"SMALLINT_variable",&"123_SMALLINT_var",&"_smallint_VAR",
       &短整型变量,&短整型_变量,&"_短整型_变量",&耄耋貔貅短整型变量,&短整型变量_smallintvar,
       &整smallint型var变smallint量var,&"整SMALLINT型var变smallint量VAR",&"&SMALLINT_VAR",&"&短整型变量",
       &"smallinteger&短整型变量",&smallint_var1,&smallint_var2,&smallint_var3,&smallint_var4,
       &smallint_var5,&smallint_var6,&smallint_var7,&smallint_var8,&smallint_var9,
       &smallint_var10,&smallint_var11,&smallint_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &短整型变量,tunique,&耄耋貔貅短整型变量,ttimestamp,
       &整smallint型var变smallint量var,tboolean,&smallint_var3,tnumeric FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &smallint_variable FROM t_session_var_external LIMIT 1;

SELECT &"SMALLINT_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_SMALLINT_var" FROM t_session_var_external LIMIT 1;

SELECT &"_smallint_VAR" FROM t_session_var_external LIMIT 1;

SELECT &短整型变量 FROM t_session_var_external LIMIT 1;

SELECT &短整型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_短整型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅短整型变量 FROM t_session_var_external LIMIT 1;

SELECT &短整型变量_smallintvar FROM t_session_var_external LIMIT 1;

SELECT &整smallint型var变smallint量var FROM t_session_var_external LIMIT 1;

SELECT &"整SMALLINT型var变smallint量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&SMALLINT_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&短整型变量" FROM t_session_var_external LIMIT 1;

SELECT &"smallinteger&短整型变量" FROM t_session_var_external LIMIT 1;

SELECT &smallint_var1 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var2 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var3 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var4 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var5 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var6 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var7 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var8 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var9 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var10 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var11 FROM t_session_var_external LIMIT 1;

SELECT &smallint_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &smallint_variable,&"SMALLINT_variable",&"123_SMALLINT_var",&"_smallint_VAR",
       &短整型变量,&短整型_变量,&"_短整型_变量",&耄耋貔貅短整型变量,&短整型变量_smallintvar,
       &整smallint型var变smallint量var,&"整SMALLINT型var变smallint量VAR",&"&SMALLINT_VAR",&"&短整型变量",
       &"smallinteger&短整型变量",&smallint_var1,&smallint_var2,&smallint_var3,&smallint_var4,
       &smallint_var5,&smallint_var6,&smallint_var7,&smallint_var8,&smallint_var9,
       &smallint_var10,&smallint_var11,&smallint_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &短整型变量,tsmallint,&耄耋貔貅短整型变量,ttimestamp,
       &整smallint型var变smallint量var,tboolean,&smallint_var3,tnumeric FROM t_session_var_external
ORDER BY tsmallint LIMIT 5;

---dblink

----单列会话变量查询

SELECT &smallint_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"SMALLINT_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_SMALLINT_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_smallint_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &短整型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &短整型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_短整型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅短整型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &短整型变量_smallintvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整smallint型var变smallint量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整SMALLINT型var变smallint量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&SMALLINT_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&短整型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"smallinteger&短整型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &smallint_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &smallint_variable,&"SMALLINT_variable",&"123_SMALLINT_var",&"_smallint_VAR",
       &短整型变量,&短整型_变量,&"_短整型_变量",&耄耋貔貅短整型变量,&短整型变量_smallintvar,
       &整smallint型var变smallint量var,&"整SMALLINT型var变smallint量VAR",&"&SMALLINT_VAR",&"&短整型变量",
       &"smallinteger&短整型变量",&smallint_var1,&smallint_var2,&smallint_var3,&smallint_var4,
       &smallint_var5,&smallint_var6,&smallint_var7,&smallint_var8,&smallint_var9,
       &smallint_var10,&smallint_var11,&smallint_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &短整型变量,tunique,&耄耋貔貅短整型变量,ttimestamp,
       &整smallint型var变smallint量var,tboolean,&smallint_var3,tnumeric FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &smallint_variable OR tsmallint >= &"SMALLINT_variable"
       OR tsmallsmallint>= &"123_SMALLINT_var" AND tbigsmallint <= &"_smallint_VAR";

SELECT tunique,tsmallint,tvarchar,tdouble,tdecimal FROM t_session_var_dfs
WHERE tsmallint IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &smallint_variable OR tunique <= &smallint_variable);

---pallas表

SELECT tunique,tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &smallint_variable OR tsmallint >= &"SMALLINT_variable"
       OR tsmallsmallint>= &"123_SMALLINT_var" AND tbigsmallint <= &"_smallint_VAR";

SELECT tunique,tsmallint,tvarchar,tdouble,tdecimal FROM t_session_var_pallas
WHERE tsmallint IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &smallint_variable OR tunique <= &smallint_variable);

---外部表

SELECT tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tsmallint >= &smallint_variable OR tsmallint >= &"SMALLINT_variable"
       OR tsmallsmallint>= &"123_SMALLINT_var" AND tbigsmallint <= &"_smallint_VAR";

SELECT tsmallint,tvarchar,tdouble,tdecimal FROM t_session_var_external
WHERE tsmallint IN (SELECT tsmallint FROM t_session_var_external WHERE tsmallint >= &smallint_variable OR tsmallint <= &smallint_variable);

---dblink

SELECT tunique,tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &smallint_variable OR tsmallint >= &"SMALLINT_variable"
       OR tsmallsmallint>= &"123_SMALLINT_var" AND tbigsmallint <= &"_smallint_VAR";

SELECT tunique,tsmallint,tvarchar,tdouble,tdecimal FROM link_oracle_session_var.t_session_var
WHERE tsmallint IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &smallint_variable OR tunique <= &smallint_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &smallint_variable OR SUM(tdecimal) <= "SMALLINT_variable" LIMIT 5;

---pallas表
SELECT tunique,tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &smallint_variable OR SUM(tdecimal) <= "SMALLINT_variable" LIMIT 5;

---外部表
SELECT tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_external
       WHERE tsmallint >= 100146364 AND tsmallint <=2100146364
       GROUP BY tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &smallint_variable OR SUM(tdecimal) <= "SMALLINT_variable" LIMIT 5;

---dblink
SELECT tunique,tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &smallint_variable OR SUM(tdecimal) <= "SMALLINT_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal FROM t_session_var_dfs LIMIT &smallint_variable;

---pallas表
SELECT tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal FROM t_session_var_pallas LIMIT &smallint_variable;

---外部表
SELECT tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal FROM t_session_var_external LIMIT &smallint_variable;

---dblink
SELECT tsmallint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallsmallint,tbigsmallint,tchar,
       tnumeric,tfloat,treal FROM link_oracle_session_var.t_session_var LIMIT &smallint_variable;

--变量作为动态表名

CREATE TABLE &smallint_variable(id SMALLINT,name VARCHAR(200));


CREATE TABLE &"SMALLINT_variable"(id SMALLINT,name VARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &短整型变量(id SMALLINT,name VARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名

CREATE TABLE t_session_variable1(&短整型变量 SMALLINT);

--变量不加&符

SELECT smallint_var1 FROM t_session_var_dfs LIMIT 1;

SELECT smallint_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;