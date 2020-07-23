--Description:date type session variable test
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
DECLARE date_variable DATE;

SHOW SESSION_VARIABLES;

DECLARE "DATE_variable" DATE;

SHOW SESSION_VARIABLES;

DECLARE 123_date_var DATE;

SHOW SESSION_VARIABLES;

DECLARE "123_DATE_var" DATE;

SHOW SESSION_VARIABLES;

DECLARE _date_var DATE;

SHOW SESSION_VARIABLES;

DECLARE "_date_VAR" DATE;

SHOW SESSION_VARIABLES;

---中文名
DECLARE 日期型变量 DATE;

SHOW SESSION_VARIABLES;

DECLARE 日期型_变量 DATE;

SHOW SESSION_VARIABLES;

DECLARE _日期型_变量 DATE;

SHOW SESSION_VARIABLES;

DECLARE "_日期型_变量" DATE;

SHOW SESSION_VARIABLES;

DECLARE 耄耋貔貅日期型变量 DATE;

SHOW SESSION_VARIABLES;

---中英文混合
DECLARE 日期型变量_datevar DATE;

SHOW SESSION_VARIABLES;

DECLARE 整date型var变date量var DATE;

SHOW SESSION_VARIABLES;

DECLARE "整DATE型var变date量VAR" DATE;

SHOW SESSION_VARIABLES;

---中英文加特殊字符
DECLARE "&DATE_VAR" DATE;

SHOW SESSION_VARIABLES;

DECLARE "&日期型变量" DATE;

SHOW SESSION_VARIABLES;

DECLARE dateeger&日期型变量 DATE;

SHOW SESSION_VARIABLES;

DECLARE "dateeger&日期型变量" DATE;

SHOW SESSION_VARIABLES;

--默认值测试

---默认值与该类型相符
DECLARE date_var1 DATE DEFAULT to_date('2020-01-01','yyyy-mm-dd');

DECLARE date_var2 DATE DEFAULT to_date('2020-01-02','yyyy-mm-dd');

DECLARE date_var3 DATE DEFAULT to_date('2020-01-03','yyyy-mm-dd');

DECLARE date_var4 DATE DEFAULT to_date('2020-01-04','yyyy-mm-dd');

DECLARE date_var5 DATE DEFAULT to_date('2020-01-05','yyyy-mm-dd');

DECLARE date_var6 DATE DEFAULT to_date('2020-01-06','yyyy-mm-dd');

---默认值与该类型不符
DECLARE date_var7 DATE DEFAULT 123.45556;

DECLARE date_var8 DATE DEFAULT 1256;

DECLARE date_var9 DATE DEFAULT TRUE;

DECLARE date_var10 DATE DEFAULT 'dasdsadsad';

DECLARE date_var11 DATE DEFAULT TO_TIMESTAMP('2020-07-20 12:12:12','yyyy-mm-dd hh24:mi:ss');

---默认值为null
DECLARE date_var12 DATE DEFAULT NULL;

--赋值测试

---赋的值与该类型相符
SET date_variable = to_date('2020-01-07','yyyy-mm-dd') ;

SET "DATE_variable" = to_date('2020-01-08','yyyy-mm-dd') ;

SET 123_date_var = to_date('2020-01-09','yyyy-mm-dd') ;

SET "123_DATE_var" = to_date('2020-01-10','yyyy-mm-dd') ;

SET _date_var = to_date('2020-01-11','yyyy-mm-dd') ;

SET "_date_VAR" = to_date('2020-01-12','yyyy-mm-dd') ;

SET 日期型变量 = to_date('2020-01-13','yyyy-mm-dd') ;

SET 日期型_变量 = to_date('2020-01-14','yyyy-mm-dd') ;

SET _日期型_变量 = to_date('2020-01-15','yyyy-mm-dd') ;

SET "_日期型_变量" = to_date('2020-01-16','yyyy-mm-dd') ;

SET 耄耋貔貅日期型变量 = to_date('2020-01-17','yyyy-mm-dd') ;

SET 日期型变量_datevar = to_date('2020-01-18','yyyy-mm-dd') ;

SET 整date型var变date量var = to_date('2020-01-19','yyyy-mm-dd') ;

SET "整DATE型var变date量VAR" = to_date('2020-01-20','yyyy-mm-dd') ;

SET "&DATE_VAR"  = to_date('2020-01-21','yyyy-mm-dd');

SET "&日期型变量" = to_date('2020-01-22','yyyy-mm-dd') ;

SET dateeger&日期型变量 = to_date('2020-01-23','yyyy-mm-dd') ;

SET "dateeger&日期型变量" = to_date('2020-01-24','yyyy-mm-dd') ;

---赋的值与该类型不符
SET date_var1 = 123;

SET date_var2 = 123.5745;

SET date_var3 = TRUE;

SET date_var6 = 'dsadsd';

---赋的 错值为null
SET 日期型变量 = null ;

--变量作为select字段测试

---dfs表

----单列会话变量查询

SELECT &date_variable FROM t_session_var_dfs LIMIT 1;

SELECT &"DATE_variable" FROM t_session_var_dfs LIMIT 1;

SELECT &"123_DATE_var" FROM t_session_var_dfs LIMIT 1;

SELECT &"_date_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &日期型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &日期型_变量 FROM t_session_var_dfs LIMIT 1;

SELECT &"_日期型_变量" FROM t_session_var_dfs LIMIT 1;

SELECT &耄耋貔貅日期型变量 FROM t_session_var_dfs LIMIT 1;

SELECT &日期型变量_datevar FROM t_session_var_dfs LIMIT 1;

SELECT &整date型var变date量var FROM t_session_var_dfs LIMIT 1;

SELECT &"整DATE型var变date量VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&DATE_VAR" FROM t_session_var_dfs LIMIT 1;

SELECT &"&日期型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &"dateeger&日期型变量" FROM t_session_var_dfs LIMIT 1;

SELECT &date_var1 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var2 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var3 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var4 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var5 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var6 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var7 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var8 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var9 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var10 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var11 FROM t_session_var_dfs LIMIT 1;

SELECT &date_var12 FROM t_session_var_dfs LIMIT 1;

----多列会话变量查询

SELECT &date_variable,&"DATE_variable",&"123_DATE_var",&"_date_VAR",
       &日期型变量,&日期型_变量,&"_日期型_变量",&耄耋貔貅日期型变量,&日期型变量_datevar,
       &整date型var变date量var,&"整DATE型var变date量VAR",&"&DATE_VAR",&"&日期型变量",
       &"dateeger&日期型变量",&date_var1,&date_var2,&date_var3,&date_var4,
       &date_var5,&date_var6,&date_var7,&date_var8,&date_var9,
       &date_var10,&date_var11,&date_var12 FROM t_session_var_dfs LIMIT 1;


----多列会话变量加表字段查询

SELECT &日期型变量,tunique,&耄耋貔貅日期型变量,ttimestamp,
       &整date型var变date量var,tboolean,&date_var3,tdate FROM t_session_var_dfs
ORDER BY tunique LIMIT 5;

---pallas表

----单列会话变量查询

SELECT &date_variable FROM t_session_var_pallas LIMIT 1;

SELECT &"DATE_variable" FROM t_session_var_pallas LIMIT 1;

SELECT &"123_DATE_var" FROM t_session_var_pallas LIMIT 1;

SELECT &"_date_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &日期型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &日期型_变量 FROM t_session_var_pallas LIMIT 1;

SELECT &"_日期型_变量" FROM t_session_var_pallas LIMIT 1;

SELECT &耄耋貔貅日期型变量 FROM t_session_var_pallas LIMIT 1;

SELECT &日期型变量_datevar FROM t_session_var_pallas LIMIT 1;

SELECT &整date型var变date量var FROM t_session_var_pallas LIMIT 1;

SELECT &"整DATE型var变date量VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&DATE_VAR" FROM t_session_var_pallas LIMIT 1;

SELECT &"&日期型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &"dateeger&日期型变量" FROM t_session_var_pallas LIMIT 1;

SELECT &date_var1 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var2 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var3 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var4 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var5 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var6 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var7 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var8 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var9 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var10 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var11 FROM t_session_var_pallas LIMIT 1;

SELECT &date_var12 FROM t_session_var_pallas LIMIT 1;

----多列会话变量查询

SELECT &date_variable,&"DATE_variable",&"123_DATE_var",&"_date_VAR",
       &日期型变量,&日期型_变量,&"_日期型_变量",&耄耋貔貅日期型变量,&日期型变量_datevar,
       &整date型var变date量var,&"整DATE型var变date量VAR",&"&DATE_VAR",&"&日期型变量",
       &"dateeger&日期型变量",&date_var1,&date_var2,&date_var3,&date_var4,
       &date_var5,&date_var6,&date_var7,&date_var8,&date_var9,
       &date_var10,&date_var11,&date_var12 FROM t_session_var_pallas LIMIT 1;


----多列会话变量加表字段查询

SELECT &日期型变量,tunique,&耄耋貔貅日期型变量,ttimestamp,
       &整date型var变date量var,tboolean,&date_var3,tdate FROM t_session_var_pallas
ORDER BY tunique LIMIT 5;

---外部表

----单列会话变量查询

SELECT &date_variable FROM t_session_var_external LIMIT 1;

SELECT &"DATE_variable" FROM t_session_var_external LIMIT 1;

SELECT &"123_DATE_var" FROM t_session_var_external LIMIT 1;

SELECT &"_date_VAR" FROM t_session_var_external LIMIT 1;

SELECT &日期型变量 FROM t_session_var_external LIMIT 1;

SELECT &日期型_变量 FROM t_session_var_external LIMIT 1;

SELECT &"_日期型_变量" FROM t_session_var_external LIMIT 1;

SELECT &耄耋貔貅日期型变量 FROM t_session_var_external LIMIT 1;

SELECT &日期型变量_datevar FROM t_session_var_external LIMIT 1;

SELECT &整date型var变date量var FROM t_session_var_external LIMIT 1;

SELECT &"整DATE型var变date量VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&DATE_VAR" FROM t_session_var_external LIMIT 1;

SELECT &"&日期型变量" FROM t_session_var_external LIMIT 1;

SELECT &"dateeger&日期型变量" FROM t_session_var_external LIMIT 1;

SELECT &date_var1 FROM t_session_var_external LIMIT 1;

SELECT &date_var2 FROM t_session_var_external LIMIT 1;

SELECT &date_var3 FROM t_session_var_external LIMIT 1;

SELECT &date_var4 FROM t_session_var_external LIMIT 1;

SELECT &date_var5 FROM t_session_var_external LIMIT 1;

SELECT &date_var6 FROM t_session_var_external LIMIT 1;

SELECT &date_var7 FROM t_session_var_external LIMIT 1;

SELECT &date_var8 FROM t_session_var_external LIMIT 1;

SELECT &date_var9 FROM t_session_var_external LIMIT 1;

SELECT &date_var10 FROM t_session_var_external LIMIT 1;

SELECT &date_var11 FROM t_session_var_external LIMIT 1;

SELECT &date_var12 FROM t_session_var_external LIMIT 1;

----多列会话变量查询

SELECT &date_variable,&"DATE_variable",&"123_DATE_var",&"_date_VAR",
       &日期型变量,&日期型_变量,&"_日期型_变量",&耄耋貔貅日期型变量,&日期型变量_datevar,
       &整date型var变date量var,&"整DATE型var变date量VAR",&"&DATE_VAR",&"&日期型变量",
       &"dateeger&日期型变量",&date_var1,&date_var2,&date_var3,&date_var4,
       &date_var5,&date_var6,&date_var7,&date_var8,&date_var9,
       &date_var10,&date_var11,&date_var12 FROM t_session_var_external LIMIT 1;


----多列会话变量加表字段查询

SELECT &日期型变量,tdate,&耄耋貔貅日期型变量,ttimestamp,
       &整date型var变date量var,tboolean,&date_var3,tdate FROM t_session_var_external
ORDER BY tdate LIMIT 5;

---dblink

----单列会话变量查询

SELECT &date_variable FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"DATE_variable" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"123_DATE_var" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_date_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &日期型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &日期型_变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"_日期型_变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &耄耋貔貅日期型变量 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &日期型变量_datevar FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &整date型var变date量var FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"整DATE型var变date量VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&DATE_VAR" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"&日期型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &"dateeger&日期型变量" FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var1 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var2 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var3 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var4 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var5 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var6 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var7 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var8 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var9 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var10 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var11 FROM link_oracle_session_var.t_session_var LIMIT 1;

SELECT &date_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;

----多列会话变量查询

SELECT &date_variable,&"DATE_variable",&"123_DATE_var",&"_date_VAR",
       &日期型变量,&日期型_变量,&"_日期型_变量",&耄耋貔貅日期型变量,&日期型变量_datevar,
       &整date型var变date量var,&"整DATE型var变date量VAR",&"&DATE_VAR",&"&日期型变量",
       &"dateeger&日期型变量",&date_var1,&date_var2,&date_var3,&date_var4,
       &date_var5,&date_var6,&date_var7,&date_var8,&date_var9,
       &date_var10,&date_var11,&date_var12 FROM link_oracle_session_var.t_session_var LIMIT 1;


----多列会话变量加表字段查询

SELECT &日期型变量,tunique,&耄耋貔貅日期型变量,ttimestamp,
       &整date型var变date量var,tboolean,&date_var3,tdate FROM link_oracle_session_var.t_session_var
ORDER BY tunique LIMIT 5;

--变量作为where条件的测试

---dfs表

SELECT tunique,tdate,tvarchar,tdate,tdate,
       tdate,ttimestamp,tsmallint,tbigint,tdate,
       tdate,tdate,tdate,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_dfs
       WHERE tunique >= &date_variable OR tdate >= &"DATE_variable"
       OR tsmalldate>= &"123_DATE_var" AND tbigdate <= &"_date_VAR";

SELECT tunique,tdate,tvardate,tdate,tdate FROM t_session_var_dfs
WHERE tdate IN (SELECT tunique FROM t_session_var_dfs WHERE tunique >= &date_variable OR tunique <= &date_variable);

---pallas表

SELECT tunique,tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_pallas
       WHERE tunique >= &date_variable OR tdate >= &"DATE_variable"
       OR tsmalldate>= &"123_DATE_var" AND tbigdate <= &"_date_VAR";

SELECT tunique,tdate,tvarchar,tdate,tdate FROM t_session_var_pallas
WHERE tdate IN (SELECT tunique FROM t_session_var_pallas WHERE tunique >= &date_variable OR tunique <= &date_variable);

---外部表

SELECT tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tboolean,tbinary,
       tvarbinary,tvarbinary FROM t_session_var_external
       WHERE tdate >= &date_variable OR tdate >= &"DATE_variable"
       OR tsmalldate>= &"123_DATE_var" AND tbigdate <= &"_date_VAR";

SELECT tdate,tvardate,tdate,tdate FROM t_session_var_external
WHERE tdate IN (SELECT tdate FROM t_session_var_external WHERE tdate >= &date_variable OR tdate <= &date_variable);

---dblink

SELECT tunique,tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tbinary,
       tvarbinary,tvarbinary FROM link_oracle_session_var.t_session_var
       WHERE tunique >= &date_variable OR tdate >= &"DATE_variable"
       OR tsmalldate>= &"123_DATE_var" AND tbigdate <= &"_date_VAR";

SELECT tunique,tdate,tvardate,tdate,tdate FROM link_oracle_session_var.t_session_var
WHERE tdate IN (SELECT tunique FROM link_oracle_session_var.t_session_var WHERE tunique >= &date_variable OR tunique <= &date_variable);

--变量作为having条件的测试

---dfs表
SELECT tunique,tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(tdate) FROM t_session_var_dfs
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tdate) >= &date_variable OR MAX(tdate) <= "DATE_variable" LIMIT 5;

---pallas表
SELECT tunique,tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(tdate) FROM t_session_var_pallas
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tdate) >= &date_variable OR MAX(tdate) <= "DATE_variable" LIMIT 5;

---外部表
SELECT tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tboolean,tbinary,
       tvarbinary,tvarbinary,MAX(tdate) FROM t_session_var_external
       WHERE tdate >= 100146364 AND tdate <=2100146364
       GROUP BY tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tboolean,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tdate) >= &date_variable OR MAX(tdate) <= "DATE_variable" LIMIT 5;

---dblink
SELECT tunique,tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tbinary,
       tvarbinary,tvarbinary,MAX(tdate) FROM link_oracle_session_var.t_session_var
       WHERE tunique >= 0 AND tunique <=100000
       GROUP BY tunique,tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate,tbinary,
       tvarbinary,tvarbinary
       HAVING MAX(tdate) >= &date_variable OR MAX(tdate) <= "DATE_variable" LIMIT 5;

--变量作为limit条件

---dfs表
SELECT tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate FROM t_session_var_dfs LIMIT &date_variable;

---pallas表
SELECT tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate FROM t_session_var_pallas LIMIT &date_variable;

---外部表
SELECT tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate FROM t_session_var_external LIMIT &date_variable;

---dblink
SELECT tdate,tvardate,tdate,tdate,
       tdate,ttimestamp,tsmalldate,tbigdate,tdate,
       tdate,tdate,tdate FROM link_oracle_session_var.t_session_var LIMIT &date_variable;

--变量作为动态表名

CREATE TABLE &date_variable(id DATE,name VARDATE(200));


CREATE TABLE &"DATE_variable"(id DATE,name VARDATE(200)) engine pallas;


CREATE EXTERNAL TABLE &日期型变量(id INT,name VARDATE(200))
LOCATION('ldbdist://192.168.1.73:54322/TEST1.csv') FORMAT 'csv' DELIMITER ',';

--变量作为动态列名
DROP TABLE IF EXISTS t_session_variable1;

CREATE TABLE t_session_variable1(&日期型变量 DATE);

--变量不加&符

SELECT date_var1 FROM t_session_var_dfs LIMIT 1;

SELECT date_var2 FROM t_session_var_dfs LIMIT 1;

--session断开后再连接，查看变量是否删除
disconnect;

connect admin/123456

show session_variables;