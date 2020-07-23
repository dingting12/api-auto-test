--Description:char type session variable test
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
DECLARE char_variable CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "CHAR_variable" CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE 123_char_var CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "123_CHAR_var" CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE _char_var CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "_char_VAR" CHAR(50);

SHOW SESSION_VARIABLES;

---中文名
DECLARE 字符型变量 CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE 字符型_变量 CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE _字符型_变量 CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "_字符型_变量" CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅字符型变量 CHAR(50);

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE 字符型变量_charvar CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE 整char型var变char量var CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "整CHAR型var变char量VAR" CHAR(50);

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&CHAR_VAR" CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "&字符型变量" CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE chareger&字符型变量 CHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "chareger&字符型变量" CHAR(50);

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE char_var1 CHAR(50) DEFAULT '如果云是天空的一封信';

DECLARE char_var2 CHAR(50) DEFAULT 'cbkjxdijsad';

DECLARE char_var3 CHAR(50) DEFAULT 'RTVsdhkSD';

DECLARE char_var4 CHAR(50) DEFAULT '^&GH*G23.\';

DECLARE char_var5 CHAR(50) DEFAULT '';

DECLARE char_var6 CHAR(50) DEFAULT '"哈哈哈哈" "呵呵呵"';

---默认值与该类型不符
DECLARE char_var7 CHAR(50) DEFAULT 123.45556;

DECLARE char_var8 CHAR(50) DEFAULT 1256;

DECLARE char_var9 CHAR(50) DEFAULT TRUE;

DECLARE char_var10 CHAR(50) DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE char_var11 CHAR(50) DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE char_var12 CHAR(50) DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET char_variable = '空山新雨后' ;

SET "CHAR_variable" = '天气晚来秋' ;

SET 123_char_var = '明月松间照' ;

SET "123_CHAR_var" = '清泉石上流' ;

SET _char_var = '东风夜放花千树' ;

SET "_char_VAR" = '更吹落，星如雨' ;

SET 字符型变量 = '接天莲叶无穷碧' ;

SET 字符型_变量 = '映日荷花别样红' ;

SET _字符型_变量 = '君不见高堂明镜悲白发' ;

SET "_字符型_变量" = '朝如青丝暮成雪' ;

SET 耄耋貔貅字符型变量 = '不以物喜，不以己悲' ;

SET 字符型变量_charvar = '子不语 怪力乱神' ;

SET 整char型var变char量var = '世间安得两全法' ;

SET "整CHAR型var变char量VAR" = '不负如来不负卿' ;

SET "&CHAR_VAR"  = '久旱逢甘雨' ;

SET "&字符型变量" = '他乡遇故知' ;

SET chareger&字符型变量 = '洞房花烛夜' ;

SET "chareger&字符型变量" = '金榜题名时' ;

---赋的值与该类型不符
SET char_var1 = 123;

SET char_var2 = 123.5745;

SET char_var3 = TRUE;

SET char_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET 字符型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &char_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"CHAR_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_CHAR_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_char_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &字符型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &字符型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_字符型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅字符型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &字符型变量_charvar FROM t_session_var_dfs LIMIT 1;

SELECT &整char型var变char量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整CHAR型var变char量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&CHAR_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&字符型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"chareger&字符型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &char_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &char_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &char_variable,&"CHAR_variable",&"123_CHAR_var",&"_char_VAR",
       &字符型变量,&字符型_变量,&"_字符型_变量",&耄耋貔貅字符型变量,&字符型变量_charvar,
       &整char型var变char量var,&"整CHAR型var变char量VAR",&"&CHAR_VAR",&"&字符型变量",
       &"chareger&字符型变量",&char_var1,&char_var2,&char_var3,&char_var4,
       &char_var5,&char_var6,&char_var7,&char_var8,&char_var9,
       &char_var10,&char_var11,&char_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &字符型变量,tunique,&耄耋貔貅字符型变量,ttimestamp,
       &整char型var变char量var,tboolean,&char_var3,tchar FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &char_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"CHAR_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_CHAR_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_char_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &字符型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &字符型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_字符型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅字符型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &字符型变量_charvar FROM t_session_var_pallas LIMIT 1;

SELECT &整char型var变char量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整CHAR型var变char量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&CHAR_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&字符型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"chareger&字符型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &char_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &char_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &char_variable,&"CHAR_variable",&"123_CHAR_var",&"_char_VAR",
       &字符型变量,&字符型_变量,&"_字符型_变量",&耄耋貔貅字符型变量,&字符型变量_charvar,
       &整char型var变char量var,&"整CHAR型var变char量VAR",&"&CHAR_VAR",&"&字符型变量",
       &"chareger&字符型变量",&char_var1,&char_var2,&char_var3,&char_var4,
       &char_var5,&char_var6,&char_var7,&char_var8,&char_var9,
       &char_var10,&char_var11,&char_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &字符型变量,tunique,&耄耋貔貅字符型变量,ttimestamp,
       &整char型var变char量var,tboolean,&char_var3,tchar FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &char_variable FROM t_session_var_external LIMIT 1;

SELECT &"CHAR_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_CHAR_var" FROM t_session_var_external LIMIT 1;

SELECT &"_char_VAR" FROM t_session_var_external LIMIT 1;

SELECT &字符型变量 FROM t_session_var_external LIMIT 1;

SELECT &字符型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_字符型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅字符型变量 FROM t_session_var_external LIMIT 1;

SELECT &字符型变量_charvar FROM t_session_var_external LIMIT 1;

SELECT &整char型var变char量var FROM t_session_var_external LIMIT 1;

SELECT &"整CHAR型var变char量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&CHAR_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&字符型变量" FROM t_session_var_external LIMIT 1;

SELECT &"chareger&字符型变量" FROM t_session_var_external LIMIT 1;

SELECT &char_var1 FROM t_session_var_external LIMIT 1;

SELECT &char_var2 FROM t_session_var_external LIMIT 1;

SELECT &char_var3 FROM t_session_var_external LIMIT 1;

SELECT &char_var4 FROM t_session_var_external LIMIT 1;

SELECT &char_var5 FROM t_session_var_external LIMIT 1;

SELECT &char_var6 FROM t_session_var_external LIMIT 1;

SELECT &char_var7 FROM t_session_var_external LIMIT 1;

SELECT &char_var8 FROM t_session_var_external LIMIT 1;

SELECT &char_var9 FROM t_session_var_external LIMIT 1;

SELECT &char_var10 FROM t_session_var_external LIMIT 1;

SELECT &char_var11 FROM t_session_var_external LIMIT 1;

SELECT &char_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &char_variable,&"CHAR_variable",&"123_CHAR_var",&"_char_VAR",
       &字符型变量,&字符型_变量,&"_字符型_变量",&耄耋貔貅字符型变量,&字符型变量_charvar,
       &整char型var变char量var,&"整CHAR型var变char量VAR",&"&CHAR_VAR",&"&字符型变量",
       &"chareger&字符型变量",&char_var1,&char_var2,&char_var3,&char_var4,
       &char_var5,&char_var6,&char_var7,&char_var8,&char_var9,
       &char_var10,&char_var11,&char_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &字符型变量,tchar,&耄耋貔貅字符型变量,ttimestamp,
       &整char型var变char量var,tboolean,&char_var3,tchar FROM t_session_var_external
ORDER BY tchar LIMIT 5;

---dblink

----单列会话变量查询

SELECT &char_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"CHAR_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_CHAR_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_char_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &字符型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &字符型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_字符型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅字符型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &字符型变量_charvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整char型var变char量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整CHAR型var变char量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&CHAR_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&字符型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"chareger&字符型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &char_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &char_variable,&"CHAR_variable",&"123_CHAR_var",&"_char_VAR",
       &字符型变量,&字符型_变量,&"_字符型_变量",&耄耋貔貅字符型变量,&字符型变量_charvar,
       &整char型var变char量var,&"整CHAR型var变char量VAR",&"&CHAR_VAR",&"&字符型变量",
       &"chareger&字符型变量",&char_var1,&char_var2,&char_var3,&char_var4,
       &char_var5,&char_var6,&char_var7,&char_var8,&char_var9,
       &char_var10,&char_var11,&char_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &字符型变量,tunique,&耄耋貔貅字符型变量,ttimestamp,
       &整char型var变char量var,tboolean,&char_var3,tchar FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &char_variable OR tchar >= &"CHAR_variable"
       OR tsmallchar>= &"123_CHAR_var" AND tbigchar <= &"_char_VAR";

SELECT tunique,tchar,tvarchar,tchar,tchar FROM t_session_var_dfs
WHERE tchar IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &char_variable OR tunique <= &char_variable);

---pallas表

SELECT tunique,tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &char_variable OR tchar >= &"CHAR_variable"
       OR tsmallchar>= &"123_CHAR_var" AND tbigchar <= &"_char_VAR";

SELECT tunique,tchar,tvarchar,tchar,tchar FROM t_session_var_pallas
WHERE tchar IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &char_variable OR tunique <= &char_variable);

---外部表

SELECT tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tchar >= &char_variable OR tchar >= &"CHAR_variable"
       OR tsmallchar>= &"123_CHAR_var" AND tbigchar <= &"_char_VAR";

SELECT tchar,tvarchar,tchar,tchar FROM t_session_var_external
WHERE tchar IN (SELECT tchar FROM t_session_var_external WHERE tchar >= &char_variable OR tchar <= &char_variable);

---dblink

SELECT tunique,tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &char_variable OR tchar >= &"CHAR_variable"
       OR tsmallchar>= &"123_CHAR_var" AND tbigchar <= &"_char_VAR";

SELECT tunique,tchar,tvarchar,tchar,tchar FROM link_oracle_session_var.t_session_var
WHERE tchar IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &char_variable OR tunique <= &char_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(tchar) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tchar) >= &char_variable OR MAX(tchar) <= "CHAR_variable" LIMIT 5;

---pallas表
SELECT tunique,tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(tchar) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tchar) >= &char_variable OR MAX(tchar) <= "CHAR_variable" LIMIT 5;

---外部表
SELECT tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(tchar) FROM t_session_var_external
       WHERE tchar >= 100146364 AND tchar <=2100146364
       GROUP BY tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tchar) >= &char_variable OR MAX(tchar) <= "CHAR_variable" LIMIT 5;

---dblink
SELECT tunique,tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tbinary,
       tvarbinary,tvarbinary,MAX(tchar) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tchar) >= &char_variable OR MAX(tchar) <= "CHAR_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar FROM t_session_var_dfs LIMIT &char_variable;

---pallas表
SELECT tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar FROM t_session_var_pallas LIMIT &char_variable;

---外部表
SELECT tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar FROM t_session_var_external LIMIT &char_variable;

---dblink
SELECT tchar,tvarchar,tchar,tchar,
       tdate,ttimestamp,tsmallchar,tbigchar,tchar,
       tchar,tchar,tchar FROM link_oracle_session_var.t_session_var LIMIT &char_variable;

--变量作为动态表名

CREATE TABLE &char_variable(id CHAR(50),name VARCHAR(200));


CREATE TABLE &"CHAR_variable"(id CHAR(50),name VARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &字符型变量(id INT,name VARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名
DROP TABLE IF EXISTS t_session_variable1;

CREATE TABLE t_session_variable1(&字符型变量 CHAR(50));

--变量不加&符

SELECT char_var1 FROM t_session_var_dfs LIMIT 1;

SELECT char_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;