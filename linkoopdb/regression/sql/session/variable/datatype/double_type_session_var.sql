--Description:double type session variable test
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
DECLARE double_variable DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE "DOUBLE_variable" DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE 123_double_var DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE "123_DOUBLE_var" DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE _double_var DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE "_double_VAR" DOUBLE;

SHOW SESSION_VARIABLES;

---中文名
DECLARE double浮点型变量 DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE double浮点型_变量 DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE _double浮点型_变量 DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE "_double浮点型_变量" DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅double浮点型变量 DOUBLE;

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE double浮点型变量_doublevar DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE 整double型var变double量var DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE "整DOUBLE型var变double量VAR" DOUBLE;

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&DOUBLE_VAR" DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE "&double浮点型变量" DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE doubleeger&double浮点型变量 DOUBLE;

SHOW SESSION_VARIABLES;

DECLARE "doubleeger&double浮点型变量" DOUBLE;

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE double_var1 DOUBLE DEFAULT 0;

DECLARE double_var2 DOUBLE DEFAULT -1.79769313486231E+308;

DECLARE double_var3 DOUBLE DEFAULT -2.22507385850720E-308;

DECLARE double_var4 DOUBLE DEFAULT 2.22507385850720E-308;

DECLARE double_var5 DOUBLE DEFAULT 1.79769313486231E+308;

DECLARE double_var6 DOUBLE DEFAULT 100;

---默认值与该类型不符
DECLARE double_var7 DOUBLE DEFAULT "23123";

DECLARE double_var8 DOUBLE DEFAULT "dvfg";

DECLARE double_var9 DOUBLE DEFAULT TRUE;

DECLARE double_var10 DOUBLE DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE double_var11 DOUBLE DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE double_var12 DOUBLE DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET double_variable = -1.79769313486231E+308 ;

SET "DOUBLE_variable" = -2.22507385850720E-308 ;

SET 123_double_var = 2323 ;

SET "123_DOUBLE_var" = 2.22507385850720E-308 ;

SET _double_var = 1223 ;

SET "_double_VAR" = 1.79769313486231E+308 ;

SET double浮点型变量 = 0 ;

SET double浮点型_变量 = 1 ;

SET _double浮点型_变量 = 2 ;

SET "_double浮点型_变量" = 3 ;

SET 耄耋貔貅double浮点型变量 = 4 ;

SET double浮点型变量_doublevar = 5 ;

SET 整double型var变double量var = 6 ;

SET "整DOUBLE型var变double量VAR" = 7 ;

SET "&DOUBLE_VAR"  = 8 ;

SET "&double浮点型变量" = 9 ;

SET doubleeger&double浮点型变量 = 43565 ;

SET "doubleeger&double浮点型变量" = 10 ;

---赋的值与该类型不符
SET double_var1 = "23123";

SET double_var2 = "dvfg";

SET double_var3 = TRUE;

SET double_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET double浮点型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &double_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"DOUBLE_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_DOUBLE_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_double_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &double浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &double浮点型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_double浮点型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅double浮点型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &double浮点型变量_doublevar FROM t_session_var_dfs LIMIT 1;

SELECT &整double型var变double量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整DOUBLE型var变double量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&DOUBLE_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&double浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"doubleeger&double浮点型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &double_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &double_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &double_variable,&"DOUBLE_variable",&"123_DOUBLE_var",&"_double_VAR",
       &double浮点型变量,&double浮点型_变量,&"_double浮点型_变量",&耄耋貔貅double浮点型变量,&double浮点型变量_doublevar,
       &整double型var变double量var,&"整DOUBLE型var变double量VAR",&"&DOUBLE_VAR",&"&double浮点型变量",
       &"doubleeger&double浮点型变量",&double_var1,&double_var2,&double_var3,&double_var4,
       &double_var5,&double_var6,&double_var7,&double_var8,&double_var9,
       &double_var10,&double_var11,&double_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &double浮点型变量,tunique,&耄耋貔貅double浮点型变量,ttimestamp,
       &整double型var变double量var,tboolean,&double_var3,tnumeric FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &double_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"DOUBLE_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_DOUBLE_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_double_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &double浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &double浮点型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_double浮点型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅double浮点型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &double浮点型变量_doublevar FROM t_session_var_pallas LIMIT 1;

SELECT &整double型var变double量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整DOUBLE型var变double量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&DOUBLE_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&double浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"doubleeger&double浮点型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &double_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &double_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &double_variable,&"DOUBLE_variable",&"123_DOUBLE_var",&"_double_VAR",
       &double浮点型变量,&double浮点型_变量,&"_double浮点型_变量",&耄耋貔貅double浮点型变量,&double浮点型变量_doublevar,
       &整double型var变double量var,&"整DOUBLE型var变double量VAR",&"&DOUBLE_VAR",&"&double浮点型变量",
       &"doubleeger&double浮点型变量",&double_var1,&double_var2,&double_var3,&double_var4,
       &double_var5,&double_var6,&double_var7,&double_var8,&double_var9,
       &double_var10,&double_var11,&double_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &double浮点型变量,tunique,&耄耋貔貅double浮点型变量,ttimestamp,
       &整double型var变double量var,tboolean,&double_var3,tnumeric FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &double_variable FROM t_session_var_external LIMIT 1;

SELECT &"DOUBLE_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_DOUBLE_var" FROM t_session_var_external LIMIT 1;

SELECT &"_double_VAR" FROM t_session_var_external LIMIT 1;

SELECT &double浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &double浮点型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_double浮点型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅double浮点型变量 FROM t_session_var_external LIMIT 1;

SELECT &double浮点型变量_doublevar FROM t_session_var_external LIMIT 1;

SELECT &整double型var变double量var FROM t_session_var_external LIMIT 1;

SELECT &"整DOUBLE型var变double量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&DOUBLE_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&double浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &"doubleeger&double浮点型变量" FROM t_session_var_external LIMIT 1;

SELECT &double_var1 FROM t_session_var_external LIMIT 1;

SELECT &double_var2 FROM t_session_var_external LIMIT 1;

SELECT &double_var3 FROM t_session_var_external LIMIT 1;

SELECT &double_var4 FROM t_session_var_external LIMIT 1;

SELECT &double_var5 FROM t_session_var_external LIMIT 1;

SELECT &double_var6 FROM t_session_var_external LIMIT 1;

SELECT &double_var7 FROM t_session_var_external LIMIT 1;

SELECT &double_var8 FROM t_session_var_external LIMIT 1;

SELECT &double_var9 FROM t_session_var_external LIMIT 1;

SELECT &double_var10 FROM t_session_var_external LIMIT 1;

SELECT &double_var11 FROM t_session_var_external LIMIT 1;

SELECT &double_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &double_variable,&"DOUBLE_variable",&"123_DOUBLE_var",&"_double_VAR",
       &double浮点型变量,&double浮点型_变量,&"_double浮点型_变量",&耄耋貔貅double浮点型变量,&double浮点型变量_doublevar,
       &整double型var变double量var,&"整DOUBLE型var变double量VAR",&"&DOUBLE_VAR",&"&double浮点型变量",
       &"doubleeger&double浮点型变量",&double_var1,&double_var2,&double_var3,&double_var4,
       &double_var5,&double_var6,&double_var7,&double_var8,&double_var9,
       &double_var10,&double_var11,&double_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &double浮点型变量,tdouble,&耄耋貔貅double浮点型变量,ttimestamp,
       &整double型var变double量var,tboolean,&double_var3,tnumeric FROM t_session_var_external
ORDER BY tdouble LIMIT 5;

---dblink

----单列会话变量查询

SELECT &double_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"DOUBLE_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_DOUBLE_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_double_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double浮点型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_double浮点型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅double浮点型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double浮点型变量_doublevar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整double型var变double量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整DOUBLE型var变double量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&DOUBLE_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&double浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"doubleeger&double浮点型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &double_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &double_variable,&"DOUBLE_variable",&"123_DOUBLE_var",&"_double_VAR",
       &double浮点型变量,&double浮点型_变量,&"_double浮点型_变量",&耄耋貔貅double浮点型变量,&double浮点型变量_doublevar,
       &整double型var变double量var,&"整DOUBLE型var变double量VAR",&"&DOUBLE_VAR",&"&double浮点型变量",
       &"doubleeger&double浮点型变量",&double_var1,&double_var2,&double_var3,&double_var4,
       &double_var5,&double_var6,&double_var7,&double_var8,&double_var9,
       &double_var10,&double_var11,&double_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &double浮点型变量,tunique,&耄耋貔貅double浮点型变量,ttimestamp,
       &整double型var变double量var,tboolean,&double_var3,tnumeric FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &double_variable OR tdouble >= &"DOUBLE_variable"
       OR tsmalldouble>= &"123_DOUBLE_var" AND tbigdouble <= &"_double_VAR";

SELECT tunique,tdouble,tvarchar,tdouble,tdecimal FROM t_session_var_dfs
WHERE tdouble IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &double_variable OR tunique <= &double_variable);

---pallas表

SELECT tunique,tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &double_variable OR tdouble >= &"DOUBLE_variable"
       OR tsmalldouble>= &"123_DOUBLE_var" AND tbigdouble <= &"_double_VAR";

SELECT tunique,tdouble,tvarchar,tdouble,tdecimal FROM t_session_var_pallas
WHERE tdouble IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &double_variable OR tunique <= &double_variable);

---外部表

SELECT tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tdouble >= &double_variable OR tdouble >= &"DOUBLE_variable"
       OR tsmalldouble>= &"123_DOUBLE_var" AND tbigdouble <= &"_double_VAR";

SELECT tdouble,tvarchar,tdouble,tdecimal FROM t_session_var_external
WHERE tdouble IN (SELECT tdouble FROM t_session_var_external WHERE tdouble >= &double_variable OR tdouble <= &double_variable);

---dblink

SELECT tunique,tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &double_variable OR tdouble >= &"DOUBLE_variable"
       OR tsmalldouble>= &"123_DOUBLE_var" AND tbigdouble <= &"_double_VAR";

SELECT tunique,tdouble,tvarchar,tdouble,tdecimal FROM link_oracle_session_var.t_session_var
WHERE tdouble IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &double_variable OR tunique <= &double_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &double_variable OR SUM(tdecimal) <= "DOUBLE_variable" LIMIT 5;

---pallas表
SELECT tunique,tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &double_variable OR SUM(tdecimal) <= "DOUBLE_variable" LIMIT 5;

---外部表
SELECT tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tboolean,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM t_session_var_external
       WHERE tdouble >= 100146364 AND tdouble <=2100146364
       GROUP BY tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &double_variable OR SUM(tdecimal) <= "DOUBLE_variable" LIMIT 5;

---dblink
SELECT tunique,tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tbinary,
       tvarbinary,tvarbinary,SUM(tdouble) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble,tbinary,
       tvarbinary,tvarbinary
       HAVING SUM(tdouble) >= &double_variable OR SUM(tdecimal) <= "DOUBLE_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble FROM t_session_var_dfs LIMIT &double_variable;

---pallas表
SELECT tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble FROM t_session_var_pallas LIMIT &double_variable;

---外部表
SELECT tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble FROM t_session_var_external LIMIT &double_variable;

---dblink
SELECT tdouble,tvarchar,tdouble,tdecimal,
       tdate,ttimestamp,tsmalldouble,tbigdouble,tchar,
       tnumeric,tdouble,tdouble FROM link_oracle_session_var.t_session_var LIMIT &double_variable;

--变量作为动态表名

CREATE TABLE &double_variable(id DOUBLE,name VARCHAR(200));


CREATE TABLE &"DOUBLE_variable"(id DOUBLE,name VARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &double浮点型变量(id DOUBLE,name VARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名
DROP TABLE IF EXISTS t_session_variable1;

CREATE TABLE t_session_variable1(&double浮点型变量 DOUBLE);

--变量不加&符

SELECT double_var1 FROM t_session_var_dfs LIMIT 1;

SELECT double_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;