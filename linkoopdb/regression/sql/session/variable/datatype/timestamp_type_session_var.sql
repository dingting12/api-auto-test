--Description:timestamp type session variable test
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
DECLARE timestamp_variable TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE "TIMESTAMP_variable" TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE 123_timestamp_var TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE "123_TIMESTAMP_var" TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE _timestamp_var TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE "_timestamp_VAR" TIMESTAMP;

SHOW SESSION_VARIABLES;

---中文名
DECLARE 时间戳型变量 TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE 时间戳型_变量 TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE _时间戳型_变量 TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE "_时间戳型_变量" TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅时间戳型变量 TIMESTAMP;

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE 时间戳型变量_timestampvar TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE 整timestamp型var变timestamp量var TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE "整TIMESTAMP型var变timestamp量VAR" TIMESTAMP;

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&TIMESTAMP_VAR" TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE "&时间戳型变量" TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE timestampeger&时间戳型变量 TIMESTAMP;

SHOW SESSION_VARIABLES;

DECLARE "timestampeger&时间戳型变量" TIMESTAMP;

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE timestamp_var1 TIMESTAMP DEFAULT to_timestamp('2020-01-01 12:12:12','yyyy-mm-dd hh24:mi:ss');

DECLARE timestamp_var2 TIMESTAMP DEFAULT to_timestamp('2020-01-02 12:12:12','yyyy-mm-dd hh24:mi:ss');

DECLARE timestamp_var3 TIMESTAMP DEFAULT to_timestamp('2020-01-03 12:12:12','yyyy-mm-dd hh24:mi:ss');

DECLARE timestamp_var4 TIMESTAMP DEFAULT to_timestamp('2020-01-04 12:12:12','yyyy-mm-dd hh24:mi:ss');

DECLARE timestamp_var5 TIMESTAMP DEFAULT to_timestamp('2020-01-05 12:12:12','yyyy-mm-dd hh24:mi:ss');

DECLARE timestamp_var6 TIMESTAMP DEFAULT to_timestamp('2020-01-06 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值与该类型不符
DECLARE timestamp_var7 TIMESTAMP DEFAULT 123.45556;

DECLARE timestamp_var8 TIMESTAMP DEFAULT 1256;

DECLARE timestamp_var9 TIMESTAMP DEFAULT TRUE;

DECLARE timestamp_var10 TIMESTAMP DEFAULT 'dasdsadsad';

DECLARE timestamp_var11 TIMESTAMP DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

---默认值为null
DECLARE timestamp_var12 TIMESTAMP DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET timestamp_variable = to_timestamp('2020-01-07 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET "TIMESTAMP_variable" = to_timestamp('2020-01-08 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET 123_timestamp_var = to_timestamp('2020-01-09 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET "123_TIMESTAMP_var" = to_timestamp('2020-01-10 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET _timestamp_var = to_timestamp('2020-01-11 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET "_timestamp_VAR" = to_timestamp('2020-01-12 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET 时间戳型变量 = to_timestamp('2020-01-13 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET 时间戳型_变量 = to_timestamp('2020-01-14 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET _时间戳型_变量 = to_timestamp('2020-01-15 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET "_时间戳型_变量" = to_timestamp('2020-01-16 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET 耄耋貔貅时间戳型变量 = to_timestamp('2020-01-17 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET 时间戳型变量_timestampvar = to_timestamp('2020-01-18 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET 整timestamp型var变timestamp量var = to_timestamp('2020-01-19 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET "整TIMESTAMP型var变timestamp量VAR" = to_timestamp('2020-01-20 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET "&TIMESTAMP_VAR"  = to_timestamp('2020-01-21 13:13:13','yyyy-mm-dd hh24:mi:ss');

SET "&时间戳型变量" = to_timestamp('2020-01-22 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET timestampeger&时间戳型变量 = to_timestamp('2020-01-23 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

SET "timestampeger&时间戳型变量" = to_timestamp('2020-01-24 13:13:13','yyyy-mm-dd hh24:mi:ss') ;

---赋的值与该类型不符
SET timestamp_var1 = 123;

SET timestamp_var2 = 123.5745;

SET timestamp_var3 = TRUE;

SET timestamp_var6 = 'dsadsd';

---赋的 错值为null
SET 时间戳型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &timestamp_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"TIMESTAMP_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_TIMESTAMP_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_timestamp_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &时间戳型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &时间戳型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_时间戳型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅时间戳型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &时间戳型变量_timestampvar FROM t_session_var_dfs LIMIT 1;

SELECT &整timestamp型var变timestamp量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整TIMESTAMP型var变timestamp量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&TIMESTAMP_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&时间戳型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"timestampeger&时间戳型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &timestamp_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &timestamp_variable,&"TIMESTAMP_variable",&"123_TIMESTAMP_var",&"_timestamp_VAR",
       &时间戳型变量,&时间戳型_变量,&"_时间戳型_变量",&耄耋貔貅时间戳型变量,&时间戳型变量_timestampvar,
       &整timestamp型var变timestamp量var,&"整TIMESTAMP型var变timestamp量VAR",&"&TIMESTAMP_VAR",&"&时间戳型变量",
       &"timestampeger&时间戳型变量",&timestamp_var1,&timestamp_var2,&timestamp_var3,&timestamp_var4,
       &timestamp_var5,&timestamp_var6,&timestamp_var7,&timestamp_var8,&timestamp_var9,
       &timestamp_var10,&timestamp_var11,&timestamp_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &时间戳型变量,tunique,&耄耋貔貅时间戳型变量,ttimestamp,
       &整timestamp型var变timestamp量var,tboolean,&timestamp_var3,ttimestamp FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &timestamp_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"TIMESTAMP_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_TIMESTAMP_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_timestamp_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &时间戳型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &时间戳型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_时间戳型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅时间戳型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &时间戳型变量_timestampvar FROM t_session_var_pallas LIMIT 1;

SELECT &整timestamp型var变timestamp量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整TIMESTAMP型var变timestamp量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&TIMESTAMP_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&时间戳型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"timestampeger&时间戳型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &timestamp_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &timestamp_variable,&"TIMESTAMP_variable",&"123_TIMESTAMP_var",&"_timestamp_VAR",
       &时间戳型变量,&时间戳型_变量,&"_时间戳型_变量",&耄耋貔貅时间戳型变量,&时间戳型变量_timestampvar,
       &整timestamp型var变timestamp量var,&"整TIMESTAMP型var变timestamp量VAR",&"&TIMESTAMP_VAR",&"&时间戳型变量",
       &"timestampeger&时间戳型变量",&timestamp_var1,&timestamp_var2,&timestamp_var3,&timestamp_var4,
       &timestamp_var5,&timestamp_var6,&timestamp_var7,&timestamp_var8,&timestamp_var9,
       &timestamp_var10,&timestamp_var11,&timestamp_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &时间戳型变量,tunique,&耄耋貔貅时间戳型变量,ttimestamp,
       &整timestamp型var变timestamp量var,tboolean,&timestamp_var3,ttimestamp FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &timestamp_variable FROM t_session_var_external LIMIT 1;

SELECT &"TIMESTAMP_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_TIMESTAMP_var" FROM t_session_var_external LIMIT 1;

SELECT &"_timestamp_VAR" FROM t_session_var_external LIMIT 1;

SELECT &时间戳型变量 FROM t_session_var_external LIMIT 1;

SELECT &时间戳型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_时间戳型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅时间戳型变量 FROM t_session_var_external LIMIT 1;

SELECT &时间戳型变量_timestampvar FROM t_session_var_external LIMIT 1;

SELECT &整timestamp型var变timestamp量var FROM t_session_var_external LIMIT 1;

SELECT &"整TIMESTAMP型var变timestamp量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&TIMESTAMP_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&时间戳型变量" FROM t_session_var_external LIMIT 1;

SELECT &"timestampeger&时间戳型变量" FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var1 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var2 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var3 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var4 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var5 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var6 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var7 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var8 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var9 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var10 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var11 FROM t_session_var_external LIMIT 1;

SELECT &timestamp_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &timestamp_variable,&"TIMESTAMP_variable",&"123_TIMESTAMP_var",&"_timestamp_VAR",
       &时间戳型变量,&时间戳型_变量,&"_时间戳型_变量",&耄耋貔貅时间戳型变量,&时间戳型变量_timestampvar,
       &整timestamp型var变timestamp量var,&"整TIMESTAMP型var变timestamp量VAR",&"&TIMESTAMP_VAR",&"&时间戳型变量",
       &"timestampeger&时间戳型变量",&timestamp_var1,&timestamp_var2,&timestamp_var3,&timestamp_var4,
       &timestamp_var5,&timestamp_var6,&timestamp_var7,&timestamp_var8,&timestamp_var9,
       &timestamp_var10,&timestamp_var11,&timestamp_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &时间戳型变量,ttimestamp,&耄耋貔貅时间戳型变量,ttimestamp,
       &整timestamp型var变timestamp量var,tboolean,&timestamp_var3,ttimestamp FROM t_session_var_external
ORDER BY ttimestamp LIMIT 5;

---dblink

----单列会话变量查询

SELECT &timestamp_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"TIMESTAMP_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_TIMESTAMP_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_timestamp_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &时间戳型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &时间戳型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_时间戳型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅时间戳型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &时间戳型变量_timestampvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整timestamp型var变timestamp量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整TIMESTAMP型var变timestamp量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&TIMESTAMP_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&时间戳型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"timestampeger&时间戳型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &timestamp_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &timestamp_variable,&"TIMESTAMP_variable",&"123_TIMESTAMP_var",&"_timestamp_VAR",
       &时间戳型变量,&时间戳型_变量,&"_时间戳型_变量",&耄耋貔貅时间戳型变量,&时间戳型变量_timestampvar,
       &整timestamp型var变timestamp量var,&"整TIMESTAMP型var变timestamp量VAR",&"&TIMESTAMP_VAR",&"&时间戳型变量",
       &"timestampeger&时间戳型变量",&timestamp_var1,&timestamp_var2,&timestamp_var3,&timestamp_var4,
       &timestamp_var5,&timestamp_var6,&timestamp_var7,&timestamp_var8,&timestamp_var9,
       &timestamp_var10,&timestamp_var11,&timestamp_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &时间戳型变量,tunique,&耄耋貔貅时间戳型变量,ttimestamp,
       &整timestamp型var变timestamp量var,tboolean,&timestamp_var3,ttimestamp FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,ttimestamp,tvarchar,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmallint,tbigint,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &timestamp_variable OR ttimestamp >= &"TIMESTAMP_variable"
       OR tsmalltimestamp>= &"123_TIMESTAMP_var" AND tbigtimestamp <= &"_timestamp_VAR";

SELECT tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp FROM t_session_var_dfs
WHERE ttimestamp IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &timestamp_variable OR tunique <= &timestamp_variable);

---pallas表

SELECT tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &timestamp_variable OR ttimestamp >= &"TIMESTAMP_variable"
       OR tsmalltimestamp>= &"123_TIMESTAMP_var" AND tbigtimestamp <= &"_timestamp_VAR";

SELECT tunique,ttimestamp,tvarchar,ttimestamp,ttimestamp FROM t_session_var_pallas
WHERE ttimestamp IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &timestamp_variable OR tunique <= &timestamp_variable);

---外部表

SELECT ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE ttimestamp >= &timestamp_variable OR ttimestamp >= &"TIMESTAMP_variable"
       OR tsmalltimestamp>= &"123_TIMESTAMP_var" AND tbigtimestamp <= &"_timestamp_VAR";

SELECT ttimestamp,tvartimestamp,ttimestamp,ttimestamp FROM t_session_var_external
WHERE ttimestamp IN (SELECT ttimestamp FROM t_session_var_external WHERE ttimestamp >= &timestamp_variable OR ttimestamp <= &timestamp_variable);

---dblink

SELECT tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &timestamp_variable OR ttimestamp >= &"TIMESTAMP_variable"
       OR tsmalltimestamp>= &"123_TIMESTAMP_var" AND tbigtimestamp <= &"_timestamp_VAR";

SELECT tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp FROM link_oracle_session_var.t_session_var
WHERE ttimestamp IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &timestamp_variable OR tunique <= &timestamp_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(ttimestamp) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(ttimestamp) >= &timestamp_variable OR MAX(ttimestamp) <= "TIMESTAMP_variable" LIMIT 5;

---pallas表
SELECT tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(ttimestamp) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(ttimestamp) >= &timestamp_variable OR MAX(ttimestamp) <= "TIMESTAMP_variable" LIMIT 5;

---外部表
SELECT ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(ttimestamp) FROM t_session_var_external
       WHERE ttimestamp >= 100146364 AND ttimestamp <=2100146364
       GROUP BY ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(ttimestamp) >= &timestamp_variable OR MAX(ttimestamp) <= "TIMESTAMP_variable" LIMIT 5;

---dblink
SELECT tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tbinary,
       tvarbinary,tvarbinary,MAX(ttimestamp) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(ttimestamp) >= &timestamp_variable OR MAX(ttimestamp) <= "TIMESTAMP_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp FROM t_session_var_dfs LIMIT &timestamp_variable;

---pallas表
SELECT ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp FROM t_session_var_pallas LIMIT &timestamp_variable;

---外部表
SELECT ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp FROM t_session_var_external LIMIT &timestamp_variable;

---dblink
SELECT ttimestamp,tvartimestamp,ttimestamp,ttimestamp,
       ttimestamp,ttimestamp,tsmalltimestamp,tbigtimestamp,ttimestamp,
       ttimestamp,ttimestamp,ttimestamp FROM link_oracle_session_var.t_session_var LIMIT &timestamp_variable;

--变量作为动态表名

CREATE TABLE &timestamp_variable(id TIMESTAMP,name VARTIMESTAMP(200));


CREATE TABLE &"TIMESTAMP_variable"(id TIMESTAMP,name VARTIMESTAMP(200)) engine pallas;


CREATE EXTERNAL TABLE &时间戳型变量(id INT,name VARTIMESTAMP(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名
DROP TABLE IF EXISTS t_session_variable1;

CREATE TABLE t_session_variable1(&时间戳型变量 TIMESTAMP);

--变量不加&符

SELECT timestamp_var1 FROM t_session_var_dfs LIMIT 1;

SELECT timestamp_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;