--Description:varchar type session variable test
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
DECLARE varchar_variable VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "VARCHAR_variable" VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE 123_varchar_var VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "123_VARCHAR_var" VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE _varchar_var VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "_varchar_VAR" VARCHAR(50);

SHOW SESSION_VARIABLES;

---中文名
DECLARE 可变长字符型变量 VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE 可变长字符型_变量 VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE _可变长字符型_变量 VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "_可变长字符型_变量" VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅可变长字符型变量 VARCHAR(50);

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE 可变长字符型变量_varcharvar VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE 整varchar型var变varchar量var VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "整VARCHAR型var变varchar量VAR" VARCHAR(50);

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&VARCHAR_VAR" VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "&可变长字符型变量" VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE varchareger&可变长字符型变量 VARCHAR(50);

SHOW SESSION_VARIABLES;

DECLARE "varchareger&可变长字符型变量" VARCHAR(50);

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE varchar_var1 VARCHAR(50) DEFAULT '如果云是天空的一封信';

DECLARE varchar_var2 VARCHAR(50) DEFAULT 'cbkjxdijsad';

DECLARE varchar_var3 VARCHAR(50) DEFAULT 'RTVsdhkSD';

DECLARE varchar_var4 VARCHAR(50) DEFAULT '^&GH*G23.\';

DECLARE varchar_var5 VARCHAR(50) DEFAULT '';

DECLARE varchar_var6 VARCHAR(50) DEFAULT '"哈哈哈哈" "呵呵呵"';

---默认值与该类型不符
DECLARE varchar_var7 VARCHAR(50) DEFAULT 123.45556;

DECLARE varchar_var8 VARCHAR(50) DEFAULT 1256;

DECLARE varchar_var9 VARCHAR(50) DEFAULT TRUE;

DECLARE varchar_var10 VARCHAR(50) DEFAULT TO_DATE('2020-07-20','yyyy-mm-dd');

DECLARE varchar_var11 VARCHAR(50) DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE varchar_var12 VARCHAR(50) DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET varchar_variable = '空山新雨后' ;

SET "VARCHAR_variable" = '天气晚来秋' ;

SET 123_varchar_var = '明月松间照' ;

SET "123_VARCHAR_var" = '清泉石上流' ;

SET _varchar_var = '东风夜放花千树' ;

SET "_varchar_VAR" = '更吹落，星如雨' ;

SET 可变长字符型变量 = '接天莲叶无穷碧' ;

SET 可变长字符型_变量 = '映日荷花别样红' ;

SET _可变长字符型_变量 = '君不见高堂明镜悲白发' ;

SET "_可变长字符型_变量" = '朝如青丝暮成雪' ;

SET 耄耋貔貅可变长字符型变量 = '不以物喜，不以己悲' ;

SET 可变长字符型变量_varcharvar = '子不语 怪力乱神' ;

SET 整varchar型var变varchar量var = '世间安得两全法' ;

SET "整VARCHAR型var变varchar量VAR" = '不负如来不负卿' ;

SET "&VARCHAR_VAR"  = '久旱逢甘雨' ;

SET "&可变长字符型变量" = '他乡遇故知' ;

SET varchareger&可变长字符型变量 = '洞房花烛夜' ;

SET "varchareger&可变长字符型变量" = '金榜题名时' ;

---赋的值与该类型不符
SET varchar_var1 = 123;

SET varchar_var2 = 123.5745;

SET varchar_var3 = TRUE;

SET varchar_var6 = TO_DATE('2020-07-20','yyyy-mm-dd');

---赋的 错值为null
SET 可变长字符型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &varchar_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"VARCHAR_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_VARCHAR_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_varchar_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &可变长字符型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &可变长字符型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_可变长字符型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅可变长字符型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &可变长字符型变量_varcharvar FROM t_session_var_dfs LIMIT 1;

SELECT &整varchar型var变varchar量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整VARCHAR型var变varchar量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&VARCHAR_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&可变长字符型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"varchareger&可变长字符型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &varchar_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &varchar_variable,&"VARCHAR_variable",&"123_VARCHAR_var",&"_varchar_VAR",
       &可变长字符型变量,&可变长字符型_变量,&"_可变长字符型_变量",&耄耋貔貅可变长字符型变量,&可变长字符型变量_varcharvar,
       &整varchar型var变varchar量var,&"整VARCHAR型var变varchar量VAR",&"&VARCHAR_VAR",&"&可变长字符型变量",
       &"varchareger&可变长字符型变量",&varchar_var1,&varchar_var2,&varchar_var3,&varchar_var4,
       &varchar_var5,&varchar_var6,&varchar_var7,&varchar_var8,&varchar_var9,
       &varchar_var10,&varchar_var11,&varchar_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &可变长字符型变量,tunique,&耄耋貔貅可变长字符型变量,ttimestamp,
       &整varchar型var变varchar量var,tboolean,&varchar_var3,tvarchar FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &varchar_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"VARCHAR_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_VARCHAR_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_varchar_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &可变长字符型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &可变长字符型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_可变长字符型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅可变长字符型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &可变长字符型变量_varcharvar FROM t_session_var_pallas LIMIT 1;

SELECT &整varchar型var变varchar量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整VARCHAR型var变varchar量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&VARCHAR_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&可变长字符型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"varchareger&可变长字符型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &varchar_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &varchar_variable,&"VARCHAR_variable",&"123_VARCHAR_var",&"_varchar_VAR",
       &可变长字符型变量,&可变长字符型_变量,&"_可变长字符型_变量",&耄耋貔貅可变长字符型变量,&可变长字符型变量_varcharvar,
       &整varchar型var变varchar量var,&"整VARCHAR型var变varchar量VAR",&"&VARCHAR_VAR",&"&可变长字符型变量",
       &"varchareger&可变长字符型变量",&varchar_var1,&varchar_var2,&varchar_var3,&varchar_var4,
       &varchar_var5,&varchar_var6,&varchar_var7,&varchar_var8,&varchar_var9,
       &varchar_var10,&varchar_var11,&varchar_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &可变长字符型变量,tunique,&耄耋貔貅可变长字符型变量,ttimestamp,
       &整varchar型var变varchar量var,tboolean,&varchar_var3,tvarchar FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &varchar_variable FROM t_session_var_external LIMIT 1;

SELECT &"VARCHAR_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_VARCHAR_var" FROM t_session_var_external LIMIT 1;

SELECT &"_varchar_VAR" FROM t_session_var_external LIMIT 1;

SELECT &可变长字符型变量 FROM t_session_var_external LIMIT 1;

SELECT &可变长字符型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_可变长字符型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅可变长字符型变量 FROM t_session_var_external LIMIT 1;

SELECT &可变长字符型变量_varcharvar FROM t_session_var_external LIMIT 1;

SELECT &整varchar型var变varchar量var FROM t_session_var_external LIMIT 1;

SELECT &"整VARCHAR型var变varchar量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&VARCHAR_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&可变长字符型变量" FROM t_session_var_external LIMIT 1;

SELECT &"varchareger&可变长字符型变量" FROM t_session_var_external LIMIT 1;

SELECT &varchar_var1 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var2 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var3 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var4 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var5 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var6 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var7 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var8 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var9 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var10 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var11 FROM t_session_var_external LIMIT 1;

SELECT &varchar_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &varchar_variable,&"VARCHAR_variable",&"123_VARCHAR_var",&"_varchar_VAR",
       &可变长字符型变量,&可变长字符型_变量,&"_可变长字符型_变量",&耄耋貔貅可变长字符型变量,&可变长字符型变量_varcharvar,
       &整varchar型var变varchar量var,&"整VARCHAR型var变varchar量VAR",&"&VARCHAR_VAR",&"&可变长字符型变量",
       &"varchareger&可变长字符型变量",&varchar_var1,&varchar_var2,&varchar_var3,&varchar_var4,
       &varchar_var5,&varchar_var6,&varchar_var7,&varchar_var8,&varchar_var9,
       &varchar_var10,&varchar_var11,&varchar_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &可变长字符型变量,tvarchar,&耄耋貔貅可变长字符型变量,ttimestamp,
       &整varchar型var变varchar量var,tboolean,&varchar_var3,tvarchar FROM t_session_var_external
ORDER BY tvarchar LIMIT 5;

---dblink

----单列会话变量查询

SELECT &varchar_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"VARCHAR_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_VARCHAR_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_varchar_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &可变长字符型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &可变长字符型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_可变长字符型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅可变长字符型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &可变长字符型变量_varcharvar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整varchar型var变varchar量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整VARCHAR型var变varchar量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&VARCHAR_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&可变长字符型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"varchareger&可变长字符型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &varchar_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &varchar_variable,&"VARCHAR_variable",&"123_VARCHAR_var",&"_varchar_VAR",
       &可变长字符型变量,&可变长字符型_变量,&"_可变长字符型_变量",&耄耋貔貅可变长字符型变量,&可变长字符型变量_varcharvar,
       &整varchar型var变varchar量var,&"整VARCHAR型var变varchar量VAR",&"&VARCHAR_VAR",&"&可变长字符型变量",
       &"varchareger&可变长字符型变量",&varchar_var1,&varchar_var2,&varchar_var3,&varchar_var4,
       &varchar_var5,&varchar_var6,&varchar_var7,&varchar_var8,&varchar_var9,
       &varchar_var10,&varchar_var11,&varchar_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &可变长字符型变量,tunique,&耄耋貔貅可变长字符型变量,ttimestamp,
       &整varchar型var变varchar量var,tboolean,&varchar_var3,tvarchar FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &varchar_variable OR tvarchar >= &"VARCHAR_variable"
       OR tsmallvarchar>= &"123_VARCHAR_var" AND tbigvarchar <= &"_varchar_VAR";

SELECT tunique,tvarchar,tvarvarchar,tvarchar,tvarchar FROM t_session_var_dfs
WHERE tvarchar IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &varchar_variable OR tunique <= &varchar_variable);

---pallas表

SELECT tunique,tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &varchar_variable OR tvarchar >= &"VARCHAR_variable"
       OR tsmallvarchar>= &"123_VARCHAR_var" AND tbigvarchar <= &"_varchar_VAR";

SELECT tunique,tvarchar,tvarvarchar,tvarchar,tvarchar FROM t_session_var_pallas
WHERE tvarchar IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &varchar_variable OR tunique <= &varchar_variable);

---外部表

SELECT tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tvarchar >= &varchar_variable OR tvarchar >= &"VARCHAR_variable"
       OR tsmallvarchar>= &"123_VARCHAR_var" AND tbigvarchar <= &"_varchar_VAR";

SELECT tvarchar,tvarvarchar,tvarchar,tvarchar FROM t_session_var_external
WHERE tvarchar IN (SELECT tvarchar FROM t_session_var_external WHERE tvarchar >= &varchar_variable OR tvarchar <= &varchar_variable);

---dblink

SELECT tunique,tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &varchar_variable OR tvarchar >= &"VARCHAR_variable"
       OR tsmallvarchar>= &"123_VARCHAR_var" AND tbigvarchar <= &"_varchar_VAR";

SELECT tunique,tvarchar,tvarvarchar,tvarchar,tvarchar FROM link_oracle_session_var.t_session_var
WHERE tvarchar IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &varchar_variable OR tunique <= &varchar_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(tvarchar) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tvarchar) >= &varchar_variable OR MAX(tvarchar) <= "VARCHAR_variable" LIMIT 5;

---pallas表
SELECT tunique,tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(tvarchar) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tvarchar) >= &varchar_variable OR MAX(tvarchar) <= "VARCHAR_variable" LIMIT 5;

---外部表
SELECT tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(tvarchar) FROM t_session_var_external
       WHERE tvarchar >= 100146364 AND tvarchar <=2100146364
       GROUP BY tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tvarchar) >= &varchar_variable OR MAX(tvarchar) <= "VARCHAR_variable" LIMIT 5;

---dblink
SELECT tunique,tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tbinary,
       tvarbinary,tvarbinary,MAX(tvarchar) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tvarchar) >= &varchar_variable OR MAX(tvarchar) <= "VARCHAR_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar FROM t_session_var_dfs LIMIT &varchar_variable;

---pallas表
SELECT tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar FROM t_session_var_pallas LIMIT &varchar_variable;

---外部表
SELECT tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar FROM t_session_var_external LIMIT &varchar_variable;

---dblink
SELECT tvarchar,tvarvarchar,tvarchar,tvarchar,
       tdate,ttimestamp,tsmallvarchar,tbigvarchar,tvarchar,
       tvarchar,tvarchar,tvarchar FROM link_oracle_session_var.t_session_var LIMIT &varchar_variable;

--变量作为动态表名

CREATE TABLE &varchar_variable(id VARCHAR(50),name VARVARCHAR(200));


CREATE TABLE &"VARCHAR_variable"(id VARCHAR(50),name VARVARCHAR(200)) engine pallas;


CREATE EXTERNAL TABLE &可变长字符型变量(id INT,name VARVARCHAR(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名
DROP TABLE IF EXISTS t_session_variable1;

CREATE TABLE t_session_variable1(&可变长字符型变量 VARCHAR(50));

--变量不加&符

SELECT varchar_var1 FROM t_session_var_dfs LIMIT 1;

SELECT varchar_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;