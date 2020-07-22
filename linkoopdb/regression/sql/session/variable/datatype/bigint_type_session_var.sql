--Description:bigint type session variable test
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
DECLARE bigint_variable BIGINT;

SHOW SESSION_VARIABLES;

DECLARE "BIGINT_variable" BIGINT;

SHOW SESSION_VARIABLES;

DECLARE 123_bigint_var BIGINT;

SHOW SESSION_VARIABLES;

DECLARE "123_BIGINT_var" BIGINT;

SHOW SESSION_VARIABLES;

DECLARE _bigint_var BIGINT;

SHOW SESSION_VARIABLES;

DECLARE "_bigint_VAR" BIGINT;

SHOW SESSION_VARIABLES;

---中文名
DECLARE 长整型变量 BIGINT;

SHOW SESSION_VARIABLES;

DECLARE 长整型_变量 BIGINT;

SHOW SESSION_VARIABLES;

DECLARE _长整型_变量 BIGINT;

SHOW SESSION_VARIABLES;

DECLARE "_长整型_变量" BIGINT;

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅长整型变量 BIGINT;

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE 长整型变量_bigintvar BIGINT;

SHOW SESSION_VARIABLES;

DECLARE 整bigint型var变bigint量var BIGINT;

SHOW SESSION_VARIABLES;

DECLARE "整BIGINT型var变bigint量VAR" BIGINT;

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&BIGINT_VAR" BIGINT;

SHOW SESSION_VARIABLES;

DECLARE "&长整型变量" BIGINT;

SHOW SESSION_VARIABLES;

DECLARE biginteger&长整型变量 BIGINT;

SHOW SESSION_VARIABLES;

DECLARE "biginteger&长整型变量" BIGINT;

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE bigint_var1 BIGINT DEFAULT 0;

DECLARE bigint_var2 BIGINT DEFAULT -9223372036854775808;

DECLARE bigint_var3 BIGINT DEFAULT 9223372036854775807;

DECLARE bigint_var4 BIGINT DEFAULT -9223372036854775809;

DECLARE bigint_var5 BIGINT DEFAULT 9223372036854775808;

DECLARE bigint_var6 BIGINT DEFAULT 100;

---默认值与该类型不符
DECLARE bigint_var7 BIGINT DEFAULT "23123";

DECLARE bigint_var8 BIGINT DEFAULT "dvfg";

DECLARE bigint_var9 BIGINT DEFAULT TRUE;

DECLARE bigint_var10 BIGINT DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE bigint_var11 BIGINT DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE bigint_var12 BIGINT DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET bigint_variable = -9223372036854775808 ;

SET "BIGINT_variable" = 9223372036854775807 ;

SET 123_bigint_var = 2323 ;

SET "123_BIGINT_var" = -9223372036854775809 ;

SET _bigint_var = 1223 ;

SET "_bigint_VAR" = 9223372036854775808 ;

SET 长整型变量 = 0 ;

SET 长整型_变量 = 1 ;

SET _长整型_变量 = 2 ;

SET "_长整型_变量" = 3 ;

SET 耄耋貔貅长整型变量 = 4 ;

SET 长整型变量_bigintvar = 5 ;

SET 整bigint型var变bigint量var = 6 ;

SET "整BIGINT型var变bigint量VAR" = 7 ;

SET "&BIGINT_VAR"  = 8 ;

SET "&长整型变量" = 9 ;

SET biginteger&长整型变量 = 43565 ;

SET "biginteger&长整型变量" = 10 ;

---赋的值与该类型不符
SET bigint_var1 = "23123";

SET bigint_var2 = "dvfg";

SET bigint_var3 = TRUE;

SET bigint_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET 长整型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &bigint_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"BIGINT_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_BIGINT_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_bigint_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &长整型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &长整型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_长整型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅长整型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &长整型变量_bigintvar FROM t_session_var_dfs LIMIT 1;

SELECT &整bigint型var变bigint量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整BIGINT型var变bigint量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&BIGINT_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&长整型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"biginteger&长整型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &bigint_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &bigint_variable,&"BIGINT_variable",&"123_BIGINT_var",&"_bigint_VAR",
       &长整型变量,&长整型_变量,&"_长整型_变量",&耄耋貔貅长整型变量,&长整型变量_bigintvar,
       &整bigint型var变bigint量var,&"整BIGINT型var变bigint量VAR",&"&BIGINT_VAR",&"&长整型变量",
       &"biginteger&长整型变量",&bigint_var1,&bigint_var2,&bigint_var3,&bigint_var4,
       &bigint_var5,&bigint_var6,&bigint_var7,&bigint_var8,&bigint_var9,
       &bigint_var10,&bigint_var11,&bigint_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &长整型变量,tunique,&耄耋貔貅长整型变量,ttimestamp,
       &整bigint型var变bigint量var,tboolean,&bigint_var3,tnumeric FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &bigint_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"BIGINT_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_BIGINT_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_bigint_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &长整型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &长整型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_长整型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅长整型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &长整型变量_bigintvar FROM t_session_var_pallas LIMIT 1;

SELECT &整bigint型var变bigint量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整BIGINT型var变bigint量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&BIGINT_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&长整型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"biginteger&长整型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &bigint_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &bigint_variable,&"BIGINT_variable",&"123_BIGINT_var",&"_bigint_VAR",
       &长整型变量,&长整型_变量,&"_长整型_变量",&耄耋貔貅长整型变量,&长整型变量_bigintvar,
       &整bigint型var变bigint量var,&"整BIGINT型var变bigint量VAR",&"&BIGINT_VAR",&"&长整型变量",
       &"biginteger&长整型变量",&bigint_var1,&bigint_var2,&bigint_var3,&bigint_var4,
       &bigint_var5,&bigint_var6,&bigint_var7,&bigint_var8,&bigint_var9,
       &bigint_var10,&bigint_var11,&bigint_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &长整型变量,tunique,&耄耋貔貅长整型变量,ttimestamp,
       &整bigint型var变bigint量var,tboolean,&bigint_var3,tnumeric FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &bigint_variable FROM t_session_var_external LIMIT 1;

SELECT &"BIGINT_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_BIGINT_var" FROM t_session_var_external LIMIT 1;

SELECT &"_bigint_VAR" FROM t_session_var_external LIMIT 1;

SELECT &长整型变量 FROM t_session_var_external LIMIT 1;

SELECT &长整型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_长整型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅长整型变量 FROM t_session_var_external LIMIT 1;

SELECT &长整型变量_bigintvar FROM t_session_var_external LIMIT 1;

SELECT &整bigint型var变bigint量var FROM t_session_var_external LIMIT 1;

SELECT &"整BIGINT型var变bigint量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&BIGINT_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&长整型变量" FROM t_session_var_external LIMIT 1;

SELECT &"biginteger&长整型变量" FROM t_session_var_external LIMIT 1;

SELECT &bigint_var1 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var2 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var3 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var4 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var5 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var6 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var7 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var8 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var9 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var10 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var11 FROM t_session_var_external LIMIT 1;

SELECT &bigint_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &bigint_variable,&"BIGINT_variable",&"123_BIGINT_var",&"_bigint_VAR",
       &长整型变量,&长整型_变量,&"_长整型_变量",&耄耋貔貅长整型变量,&长整型变量_bigintvar,
       &整bigint型var变bigint量var,&"整BIGINT型var变bigint量VAR",&"&BIGINT_VAR",&"&长整型变量",
       &"biginteger&长整型变量",&bigint_var1,&bigint_var2,&bigint_var3,&bigint_var4,
       &bigint_var5,&bigint_var6,&bigint_var7,&bigint_var8,&bigint_var9,
       &bigint_var10,&bigint_var11,&bigint_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &长整型变量,tbigint,&耄耋貔貅长整型变量,ttimestamp,
       &整bigint型var变bigint量var,tboolean,&bigint_var3,tnumeric FROM t_session_var_external
ORDER BY tbigint LIMIT 5;

---dblink

----单列会话变量查询

SELECT &bigint_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"BIGINT_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_BIGINT_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_bigint_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &长整型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &长整型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_长整型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅长整型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &长整型变量_bigintvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整bigint型var变bigint量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整BIGINT型var变bigint量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&BIGINT_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&长整型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"biginteger&长整型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &bigint_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &bigint_variable,&"BIGINT_variable",&"123_BIGINT_var",&"_bigint_VAR",
       &长整型变量,&长整型_变量,&"_长整型_变量",&耄耋貔貅长整型变量,&长整型变量_bigintvar,
       &整bigint型var变bigint量var,&"整BIGINT型var变bigint量VAR",&"&BIGINT_VAR",&"&长整型变量",
       &"biginteger&长整型变量",&bigint_var1,&bigint_var2,&bigint_var3,&bigint_var4,
       &bigint_var5,&bigint_var6,&bigint_var7,&bigint_var8,&bigint_var9,
       &bigint_var10,&bigint_var11,&bigint_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &长整型变量,tunique,&耄耋貔貅长整型变量,ttimestamp,
       &整bigint型var变bigint量var,tboolean,&bigint_var3,tnumeric FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &bigint_variable OR tbigint >= &"BIGINT_variable"
       OR tsmallbigint>= &"123_BIGINT_var" AND tbigbigint <= &"_bigint_VAR";

SELECT tunique,tbigint,tvarchar,tdouble,tdecimal FROM t_session_var_dfs
WHERE tbigint IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &bigint_variable OR tunique <= &bigint_variable);

---pallas表

SELECT tunique,tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &bigint_variable OR tbigint >= &"BIGINT_variable"
       OR tsmallbigint>= &"123_BIGINT_var" AND tbigbigint <= &"_bigint_VAR";

SELECT tunique,tbigint,tvarchar,tdouble,tdecimal FROM t_session_var_pallas
WHERE tbigint IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &bigint_variable OR tunique <= &bigint_variable);

---外部表

SELECT tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tbigint >= &bigint_variable OR tbigint >= &"BIGINT_variable"
       OR tsmallbigint>= &"123_BIGINT_var" AND tbigbigint <= &"_bigint_VAR";

SELECT tbigint,tvarchar,tdouble,tdecimal FROM t_session_var_external
WHERE tbigint IN (SELECT tbigint FROM t_session_var_external WHERE tbigint >= &bigint_variable OR tbigint <= &bigint_variable);

---dblink

SELECT tunique,tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &bigint_variable OR tbigint >= &"BIGINT_variable"
       OR tsmallbigint>= &"123_BIGINT_var" AND tbigbigint <= &"_bigint_VAR";

SELECT tunique,tbigint,tvarchar,tdouble,tdecimal FROM link_oracle_session_var.t_session_var
WHERE tbigint IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &bigint_variable OR tunique <= &bigint_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &bigint_variable OR SUM(tdecimal) <= "BIGINT_variable" LIMIT 5;

---pallas表
SELECT tunique,tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &bigint_variable OR SUM(tdecimal) <= "BIGINT_variable" LIMIT 5;

---外部表
SELECT tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_external
       WHERE tbigint >= 100146364 AND tbigint <=2100146364
       GROUP BY tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &bigint_variable OR SUM(tdecimal) <= "BIGINT_variable" LIMIT 5;

---dblink
SELECT tunique,tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &bigint_variable OR SUM(tdecimal) <= "BIGINT_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal FROM t_session_var_dfs LIMIT &bigint_variable;

---pallas表
SELECT tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal FROM t_session_var_pallas LIMIT &bigint_variable;

---外部表
SELECT tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal FROM t_session_var_external LIMIT &bigint_variable;

---dblink
SELECT tbigint,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallbigint,tbigbigint,tchar,
       tnumeric,tfloat,treal FROM link_oracle_session_var.t_session_var LIMIT &bigint_variable;

--变量作为动态表名

CREATE TABLE &bigint_variable(id BIGINT,name VARCHAR(200));


CREATE TABLE &"BIGINT_variable"(id BIGINT,name VARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &长整型变量(id BIGINT,name VARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名
DROP TABLE IF EXISTS t_session_variable1;

CREATE TABLE t_session_variable1(&长整型变量 BIGINT);

--变量不加&符

SELECT bigint_var1 FROM t_session_var_dfs LIMIT 1;

SELECT bigint_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;