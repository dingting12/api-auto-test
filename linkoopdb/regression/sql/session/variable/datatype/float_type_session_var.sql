--Description:float type session variable test
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
DECLARE float_variable FLOAT;

SHOW SESSION_VARIABLES;

DECLARE "FLOAT_variable" FLOAT;

SHOW SESSION_VARIABLES;

DECLARE 123_float_var FLOAT;

SHOW SESSION_VARIABLES;

DECLARE "123_FLOAT_var" FLOAT;

SHOW SESSION_VARIABLES;

DECLARE _float_var FLOAT;

SHOW SESSION_VARIABLES;

DECLARE "_float_VAR" FLOAT;

SHOW SESSION_VARIABLES;

---中文名
DECLARE float浮点型变量 FLOAT;

SHOW SESSION_VARIABLES;

DECLARE float浮点型_变量 FLOAT;

SHOW SESSION_VARIABLES;

DECLARE _float浮点型_变量 FLOAT;

SHOW SESSION_VARIABLES;

DECLARE "_float浮点型_变量" FLOAT;

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅float浮点型变量 FLOAT;

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE float浮点型变量_floatvar FLOAT;

SHOW SESSION_VARIABLES;

DECLARE 整float型var变float量var FLOAT;

SHOW SESSION_VARIABLES;

DECLARE "整FLOAT型var变float量VAR" FLOAT;

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&FLOAT_VAR" FLOAT;

SHOW SESSION_VARIABLES;

DECLARE "&float浮点型变量" FLOAT;

SHOW SESSION_VARIABLES;

DECLARE floateger&float浮点型变量 FLOAT;

SHOW SESSION_VARIABLES;

DECLARE "floateger&float浮点型变量" FLOAT;

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE float_var1 FLOAT DEFAULT 0;

DECLARE float_var2 FLOAT DEFAULT -1.79769313486231E+308;

DECLARE float_var3 FLOAT DEFAULT -2.22507385850720E-308;

DECLARE float_var4 FLOAT DEFAULT 2.22507385850720E-308;

DECLARE float_var5 FLOAT DEFAULT 1.79769313486231E+308;

DECLARE float_var6 FLOAT DEFAULT 100;

---默认值与该类型不符
DECLARE float_var7 FLOAT DEFAULT "23123";

DECLARE float_var8 FLOAT DEFAULT "dvfg";

DECLARE float_var9 FLOAT DEFAULT TRUE;

DECLARE float_var10 FLOAT DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE float_var11 FLOAT DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE float_var12 FLOAT DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET float_variable = -1.79769313486231E+308 ;

SET "FLOAT_variable" = -2.22507385850720E-308 ;

SET 123_float_var = 2323 ;

SET "123_FLOAT_var" = 2.22507385850720E-308 ;

SET _float_var = 1223 ;

SET "_float_VAR" = 1.79769313486231E+308 ;

SET float浮点型变量 = 0 ;

SET float浮点型_变量 = 1 ;

SET _float浮点型_变量 = 2 ;

SET "_float浮点型_变量" = 3 ;

SET 耄耋貔貅float浮点型变量 = 4 ;

SET float浮点型变量_floatvar = 5 ;

SET 整float型var变float量var = 6 ;

SET "整FLOAT型var变float量VAR" = 7 ;

SET "&FLOAT_VAR"  = 8 ;

SET "&float浮点型变量" = 9 ;

SET floateger&float浮点型变量 = 43565 ;

SET "floateger&float浮点型变量" = 10 ;

---赋的值与该类型不符
SET float_var1 = "23123";

SET float_var2 = "dvfg";

SET float_var3 = TRUE;

SET float_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET float浮点型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &float_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"FLOAT_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_FLOAT_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_float_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &float浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &float浮点型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_float浮点型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅float浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &float浮点型变量_floatvar FROM t_session_var_dfs LIMIT 1;

SELECT &整float型var变float量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整FLOAT型var变float量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&FLOAT_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&float浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"floateger&float浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &float_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &float_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &float_variable,&"FLOAT_variable",&"123_FLOAT_var",&"_float_VAR",
       &float浮点型变量,&float浮点型_变量,&"_float浮点型_变量",&耄耋貔貅float浮点型变量,&float浮点型变量_floatvar,
       &整float型var变float量var,&"整FLOAT型var变float量VAR",&"&FLOAT_VAR",&"&float浮点型变量",
       &"floateger&float浮点型变量",&float_var1,&float_var2,&float_var3,&float_var4,
       &float_var5,&float_var6,&float_var7,&float_var8,&float_var9,
       &float_var10,&float_var11,&float_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &float浮点型变量,tunique,&耄耋貔貅float浮点型变量,ttimestamp,
       &整float型var变float量var,tboolean,&float_var3,tnumeric FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &float_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"FLOAT_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_FLOAT_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_float_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &float浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &float浮点型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_float浮点型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅float浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &float浮点型变量_floatvar FROM t_session_var_pallas LIMIT 1;

SELECT &整float型var变float量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整FLOAT型var变float量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&FLOAT_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&float浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"floateger&float浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &float_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &float_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &float_variable,&"FLOAT_variable",&"123_FLOAT_var",&"_float_VAR",
       &float浮点型变量,&float浮点型_变量,&"_float浮点型_变量",&耄耋貔貅float浮点型变量,&float浮点型变量_floatvar,
       &整float型var变float量var,&"整FLOAT型var变float量VAR",&"&FLOAT_VAR",&"&float浮点型变量",
       &"floateger&float浮点型变量",&float_var1,&float_var2,&float_var3,&float_var4,
       &float_var5,&float_var6,&float_var7,&float_var8,&float_var9,
       &float_var10,&float_var11,&float_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &float浮点型变量,tunique,&耄耋貔貅float浮点型变量,ttimestamp,
       &整float型var变float量var,tboolean,&float_var3,tnumeric FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &float_variable FROM t_session_var_external LIMIT 1;

SELECT &"FLOAT_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_FLOAT_var" FROM t_session_var_external LIMIT 1;

SELECT &"_float_VAR" FROM t_session_var_external LIMIT 1;

SELECT &float浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &float浮点型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_float浮点型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅float浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &float浮点型变量_floatvar FROM t_session_var_external LIMIT 1;

SELECT &整float型var变float量var FROM t_session_var_external LIMIT 1;

SELECT &"整FLOAT型var变float量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&FLOAT_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&float浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &"floateger&float浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &float_var1 FROM t_session_var_external LIMIT 1;

SELECT &float_var2 FROM t_session_var_external LIMIT 1;

SELECT &float_var3 FROM t_session_var_external LIMIT 1;

SELECT &float_var4 FROM t_session_var_external LIMIT 1;

SELECT &float_var5 FROM t_session_var_external LIMIT 1;

SELECT &float_var6 FROM t_session_var_external LIMIT 1;

SELECT &float_var7 FROM t_session_var_external LIMIT 1;

SELECT &float_var8 FROM t_session_var_external LIMIT 1;

SELECT &float_var9 FROM t_session_var_external LIMIT 1;

SELECT &float_var10 FROM t_session_var_external LIMIT 1;

SELECT &float_var11 FROM t_session_var_external LIMIT 1;

SELECT &float_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &float_variable,&"FLOAT_variable",&"123_FLOAT_var",&"_float_VAR",
       &float浮点型变量,&float浮点型_变量,&"_float浮点型_变量",&耄耋貔貅float浮点型变量,&float浮点型变量_floatvar,
       &整float型var变float量var,&"整FLOAT型var变float量VAR",&"&FLOAT_VAR",&"&float浮点型变量",
       &"floateger&float浮点型变量",&float_var1,&float_var2,&float_var3,&float_var4,
       &float_var5,&float_var6,&float_var7,&float_var8,&float_var9,
       &float_var10,&float_var11,&float_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &float浮点型变量,tfloat,&耄耋貔貅float浮点型变量,ttimestamp,
       &整float型var变float量var,tboolean,&float_var3,tnumeric FROM t_session_var_external
ORDER BY tfloat LIMIT 5;

---dblink

----单列会话变量查询

SELECT &float_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"FLOAT_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_FLOAT_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_float_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float浮点型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_float浮点型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅float浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float浮点型变量_floatvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整float型var变float量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整FLOAT型var变float量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&FLOAT_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&float浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"floateger&float浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &float_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &float_variable,&"FLOAT_variable",&"123_FLOAT_var",&"_float_VAR",
       &float浮点型变量,&float浮点型_变量,&"_float浮点型_变量",&耄耋貔貅float浮点型变量,&float浮点型变量_floatvar,
       &整float型var变float量var,&"整FLOAT型var变float量VAR",&"&FLOAT_VAR",&"&float浮点型变量",
       &"floateger&float浮点型变量",&float_var1,&float_var2,&float_var3,&float_var4,
       &float_var5,&float_var6,&float_var7,&float_var8,&float_var9,
       &float_var10,&float_var11,&float_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &float浮点型变量,tunique,&耄耋貔貅float浮点型变量,ttimestamp,
       &整float型var变float量var,tboolean,&float_var3,tnumeric FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &float_variable OR tfloat >= &"FLOAT_variable"
       OR tsmallfloat>= &"123_FLOAT_var" AND tbigfloat <= &"_float_VAR";

SELECT tunique,tfloat,tvarchar,tdouble,tdecimal FROM t_session_var_dfs
WHERE tfloat IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &float_variable OR tunique <= &float_variable);

---pallas表

SELECT tunique,tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &float_variable OR tfloat >= &"FLOAT_variable"
       OR tsmallfloat>= &"123_FLOAT_var" AND tbigfloat <= &"_float_VAR";

SELECT tunique,tfloat,tvarchar,tdouble,tdecimal FROM t_session_var_pallas
WHERE tfloat IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &float_variable OR tunique <= &float_variable);

---外部表

SELECT tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tfloat >= &float_variable OR tfloat >= &"FLOAT_variable"
       OR tsmallfloat>= &"123_FLOAT_var" AND tbigfloat <= &"_float_VAR";

SELECT tfloat,tvarchar,tdouble,tdecimal FROM t_session_var_external
WHERE tfloat IN (SELECT tfloat FROM t_session_var_external WHERE tfloat >= &float_variable OR tfloat <= &float_variable);

---dblink

SELECT tunique,tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &float_variable OR tfloat >= &"FLOAT_variable"
       OR tsmallfloat>= &"123_FLOAT_var" AND tbigfloat <= &"_float_VAR";

SELECT tunique,tfloat,tvarchar,tdouble,tdecimal FROM link_oracle_session_var.t_session_var
WHERE tfloat IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &float_variable OR tunique <= &float_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &float_variable OR SUM(tdecimal) <= "FLOAT_variable" LIMIT 5;

---pallas表
SELECT tunique,tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &float_variable OR SUM(tdecimal) <= "FLOAT_variable" LIMIT 5;

---外部表
SELECT tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_external
       WHERE tfloat >= 100146364 AND tfloat <=2100146364
       GROUP BY tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &float_variable OR SUM(tdecimal) <= "FLOAT_variable" LIMIT 5;

---dblink
SELECT tunique,tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &float_variable OR SUM(tdecimal) <= "FLOAT_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat FROM t_session_var_dfs LIMIT &float_variable;

---pallas表
SELECT tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat FROM t_session_var_pallas LIMIT &float_variable;

---外部表
SELECT tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat FROM t_session_var_external LIMIT &float_variable;

---dblink
SELECT tfloat,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmallfloat,tbigfloat,tchar,
       tnumeric,tfloat,tfloat FROM link_oracle_session_var.t_session_var LIMIT &float_variable;

--变量作为动态表名

CREATE TABLE &float_variable(id FLOAT,name VARCHAR(200));


CREATE TABLE &"FLOAT_variable"(id FLOAT,name VARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &float浮点型变量(id FLOAT,name VARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名
DROP TABLE IF EXISTS t_session_variable1;

CREATE TABLE t_session_variable1(&float浮点型变量 FLOAT);

--变量不加&符

SELECT float_var1 FROM t_session_var_dfs LIMIT 1;

SELECT float_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;