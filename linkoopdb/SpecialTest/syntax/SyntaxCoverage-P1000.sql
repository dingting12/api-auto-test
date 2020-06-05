-- Description：
--             LDB专项测试
--             1.group by 全部类型
--             2.having 全部类型
--             3.类型转换
--             4.insert 到其他表
--             5.直接返回结果
-- Date：2020-05-09
-- Author：李爱敏

SET ECHO ON
SET TIMING ON

-- GROUP BY语法
-- 穷举所有数据类型进行group by查询

SELECT TSMALLINT FROM P1000 GROUP BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_SMALLINT表中
DROP TABLE T_TYPE_SMALLINT IF EXISTS;
CREATE TABLE T_TYPE_SMALLINT AS (SELECT TSMALLINT FROM P1000 GROUP BY TSMALLINT) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_SMALLINT LIMIT 10;

SELECT TINTEGER FROM P1000 GROUP BY TINTEGER LIMIT 10;
-- 把查询出的数据insert到T_TYPE_INTEGER表中
DROP TABLE T_TYPE_INTEGER IF EXISTS;
CREATE TABLE T_TYPE_INTEGER AS (SELECT TINTEGER FROM P1000 GROUP BY TINTEGER) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_INTEGER LIMIT 10;

SELECT TBIGINT FROM P1000 GROUP BY TBIGINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_BIGINT表中
DROP TABLE T_TYPE_BIGINT IF EXISTS;
CREATE TABLE T_TYPE_BIGINT AS (SELECT TBIGINT FROM P1000 GROUP BY TBIGINT)  WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_BIGINT LIMIT 10;

SELECT TREAL FROM P1000 GROUP BY TREAL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_REAL表中
DROP TABLE T_TYPE_REAL IF EXISTS;
CREATE TABLE T_TYPE_REAL AS (SELECT TREAL FROM P1000 GROUP BY TREAL) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_REAL LIMIT 10;

SELECT TDOUBLE FROM P1000 GROUP BY TDOUBLE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DOUBLE表中
DROP TABLE T_TYPE_DOUBLE IF EXISTS;
CREATE TABLE T_TYPE_DOUBLE AS (SELECT TDOUBLE FROM P1000 GROUP BY TDOUBLE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_DOUBLE LIMIT 10;

SELECT TFLOAT FROM P1000 GROUP BY TFLOAT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_FLOAT表中
DROP TABLE T_TYPE_FLOAT IF EXISTS;
CREATE TABLE T_TYPE_FLOAT AS (SELECT TFLOAT FROM P1000 GROUP BY TFLOAT) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_FLOAT LIMIT 10;

SELECT TDECIMAL FROM P1000 GROUP BY TDECIMAL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DECIMAL表中
DROP TABLE T_TYPE_DECIMAL IF EXISTS;
CREATE TABLE T_TYPE_DECIMAL AS (SELECT TDECIMAL FROM P1000 GROUP BY TDECIMAL) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_DECIMAL LIMIT 10;

SELECT TNUMERIC FROM P1000 GROUP BY TNUMERIC LIMIT 10;
-- 把查询出的数据insert到T_TYPE_NUMERIC表中
DROP TABLE T_TYPE_NUMERIC IF EXISTS;
CREATE TABLE T_TYPE_NUMERIC AS (SELECT TNUMERIC FROM P1000 GROUP BY TNUMERIC) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_NUMERIC LIMIT 10;

SELECT TDATE FROM P1000 GROUP BY TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DATE表中
DROP TABLE T_TYPE_DATE IF EXISTS;
CREATE TABLE T_TYPE_DATE AS (SELECT TDATE FROM P1000 GROUP BY TDATE) WITH DATA;
SELECT * FROM T_TYPE_DATE LIMIT 10;

SELECT TTIMESTAMP FROM P1000 GROUP BY TTIMESTAMP LIMIT 10;
-- 把查询出的数据insert到T_TYPE_TIMESTAMP表中
DROP TABLE T_TYPE_TIMESTAMP IF EXISTS;
CREATE TABLE T_TYPE_TIMESTAMP AS (SELECT TTIMESTAMP FROM P1000 GROUP BY TTIMESTAMP) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_TIMESTAMP LIMIT 10;

SELECT TBOOL FROM P1000 GROUP BY TBOOL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_BOOL表中
DROP TABLE T_TYPE_BOOL IF EXISTS;
CREATE TABLE T_TYPE_BOOL AS (SELECT TBOOL FROM P1000 GROUP BY TBOOL) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_BOOL LIMIT 10;

SELECT TCHAR FROM P1000 GROUP BY TCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_CHAR表中
DROP TABLE T_TYPE_CHAR IF EXISTS;
CREATE TABLE T_TYPE_CHAR AS (SELECT TCHAR FROM P1000 GROUP BY TCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_CHAR LIMIT 10;

SELECT TVARCHAR FROM P1000 GROUP BY TVARCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_VARCHAR表中
DROP TABLE T_TYPE_VARCHAR IF EXISTS;
CREATE TABLE T_TYPE_VARCHAR AS (SELECT TVARCHAR FROM P1000 GROUP BY TVARCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_VARCHAR LIMIT 10;


-- 不同数据类型组合进行group by查询
-- 3种整型数据类型组合
SELECT TSMALLINT,TINTEGER,TBIGINT FROM P1000 GROUP BY TSMALLINT, TINTEGER,TBIGINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_INTS表中
DROP TABLE T_TYPE_INTS IF EXISTS;
CREATE TABLE T_TYPE_INTS AS (SELECT TSMALLINT,TINTEGER,TBIGINT FROM P1000 GROUP BY TSMALLINT, TINTEGER,TBIGINT) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_INTS LIMIT 10;

-- 5种浮点型数据类型组合
SELECT TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC FROM P1000 GROUP BY TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC LIMIT 10;
-- 把查询出的数据insert到T_TYPE_FLOATS表中
DROP TABLE T_TYPE_FLOATS IF EXISTS;
CREATE TABLE T_TYPE_FLOATS AS (SELECT TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC FROM P1000 GROUP BY TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_FLOATS LIMIT 10;

-- 2种字符型数据类型组合
SELECT TCHAR,TVARCHAR FROM P1000 GROUP BY TCHAR, TVARCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_CHARS表中
DROP TABLE T_TYPE_CHARS IF EXISTS;
CREATE TABLE T_TYPE_CHARS AS (SELECT TCHAR,TVARCHAR FROM P1000 GROUP BY TCHAR, TVARCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_CHARS LIMIT 10;

-- 2种日期类型数据类型组合
SELECT TDATE,TTIMESTAMP FROM P1000 GROUP BY TDATE,TTIMESTAMP LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DATES表中
DROP TABLE T_TYPE_DATES IF EXISTS;
CREATE TABLE T_TYPE_DATES AS (SELECT TDATE,TTIMESTAMP FROM P1000 GROUP BY TDATE,TTIMESTAMP) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_DATES LIMIT 10;

-- 整型，浮点型，字符型，日期型4种数据类型组合
SELECT TBIGINT,TDOUBLE,TCHAR,TDATE FROM P1000 GROUP BY TBIGINT, TDOUBLE, TCHAR,TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY4表中
DROP TABLE T_TYPE_ARRAY4 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY4 AS (SELECT TBIGINT,TDOUBLE,TCHAR,TDATE FROM P1000 GROUP BY TBIGINT, TDOUBLE, TCHAR,TDATE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY4 LIMIT 10;

-- 整型，浮点型2种数据类型组合
SELECT TSMALLINT,TREAL FROM P1000 GROUP BY TSMALLINT, TREAL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY21表中
DROP TABLE T_TYPE_ARRAY21 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY21 AS (SELECT TSMALLINT,TREAL FROM P1000 GROUP BY TSMALLINT, TREAL) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY21 LIMIT 10;

-- 整型，字符型2种数据类型组合
SELECT TINTEGER,TVARCHAR FROM P1000 GROUP BY TINTEGER, TVARCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY22表中
DROP TABLE T_TYPE_ARRAY22 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY22 AS (SELECT TINTEGER,TVARCHAR FROM P1000 GROUP BY TINTEGER, TVARCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY22 LIMIT 10;

-- 整型，日期型2种数据类型组合
SELECT TBIGINT,TDATE FROM P1000 GROUP BY TBIGINT, TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY23表中
DROP TABLE T_TYPE_ARRAY23 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY23 AS (SELECT TBIGINT,TDATE FROM P1000 GROUP BY TBIGINT, TDATE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY23 LIMIT 10;

-- 整型，浮点型，字符型3种数据类型组合
SELECT TSMALLINT,TREAL,TCHAR FROM P1000 GROUP BY TSMALLINT, TREAL, TCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY31表中
DROP TABLE T_TYPE_ARRAY31 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY31 AS (SELECT TSMALLINT,TREAL,TCHAR FROM P1000 GROUP BY TSMALLINT, TREAL, TCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY31 LIMIT 10;

-- 整型，浮点型，日期型3种数据类型组合
SELECT TSMALLINT,TREAL,TDATE FROM P1000 GROUP BY TSMALLINT, TREAL, TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY32表中
DROP TABLE T_TYPE_ARRAY32 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY32 AS (SELECT TSMALLINT,TREAL,TDATE FROM P1000 GROUP BY TSMALLINT, TREAL, TDATE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY32 LIMIT 10;

-- 浮点型，字符型，日期型3种数据类型组合
SELECT TREAL,TCHAR,TDATE FROM P1000 GROUP BY TREAL,TCHAR, TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY33表中
DROP TABLE T_TYPE_ARRAY33 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY33 AS (SELECT TREAL,TCHAR,TDATE FROM P1000 GROUP BY TREAL,TCHAR, TDATE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY33 LIMIT 10;

-- 因为布尔型的数据在数据库表里只有一种数据：True，timestamp类型的数据在数据库表里没有重复数据，所以选取余下的11种类型的数据进行组合查询
SELECT TSMALLINT,TINTEGER,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC,TDATE,TCHAR,TVARCHAR FROM P1000 GROUP BY TSMALLINT, TINTEGER, TBIGINT, TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC, TDATE, TCHAR, TVARCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ALL表中
DROP TABLE T_TYPE_ALL IF EXISTS;
CREATE TABLE T_TYPE_ALL AS (SELECT TSMALLINT,TINTEGER,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC,TDATE,TCHAR,TVARCHAR FROM P1000 GROUP BY TSMALLINT, TINTEGER, TBIGINT, TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC, TDATE, TCHAR, TVARCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ALL LIMIT 10;


-- HAVING语法
-- 穷举所有数据类型进行having查询

SELECT TSMALLINT FROM P1000 GROUP BY TSMALLINT HAVING TSMALLINT > 0 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_SMALLINT表中
TRUNCATE TABLE T_TYPE_SMALLINT;
INSERT INTO T_TYPE_SMALLINT (SELECT TSMALLINT FROM P1000 GROUP BY TSMALLINT HAVING TSMALLINT > 0);
-- 查看返回结果
SELECT * FROM T_TYPE_SMALLINT LIMIT 10;

SELECT TINTEGER FROM P1000 GROUP BY TINTEGER HAVING TINTEGER < 99981986 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_INTEGER表中
TRUNCATE TABLE T_TYPE_INTEGER;
INSERT INTO T_TYPE_INTEGER (SELECT TINTEGER FROM P1000 GROUP BY TINTEGER HAVING TINTEGER < 99981986);
-- 查看返回结果
SELECT * FROM T_TYPE_INTEGER LIMIT 10;

SELECT TBIGINT FROM P1000 GROUP BY TBIGINT HAVING TBIGINT > 5109870844 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_BIGINT表中
TRUNCATE TABLE T_TYPE_BIGINT;
INSERT INTO T_TYPE_BIGINT (SELECT TBIGINT FROM P1000 GROUP BY TBIGINT HAVING TBIGINT > 5109870844);
-- 查看返回结果
SELECT * FROM T_TYPE_BIGINT LIMIT 10;

SELECT TREAL FROM P1000 GROUP BY TREAL HAVING TREAL < 9812.82 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_REAL表中
TRUNCATE TABLE T_TYPE_REAL;
INSERT INTO T_TYPE_REAL (SELECT TREAL FROM P1000 GROUP BY TREAL HAVING TREAL < 9812.82);
-- 查看返回结果
SELECT * FROM T_TYPE_REAL LIMIT 10;

SELECT TDOUBLE FROM P1000 GROUP BY TDOUBLE HAVING TDOUBLE > 47.95 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DOUBLE表中
TRUNCATE TABLE T_TYPE_DOUBLE;
INSERT INTO T_TYPE_DOUBLE (SELECT TDOUBLE FROM P1000 GROUP BY TDOUBLE HAVING TDOUBLE > 47.95);
-- 查看返回结果
SELECT * FROM T_TYPE_DOUBLE LIMIT 10;

SELECT TFLOAT FROM P1000 GROUP BY TFLOAT HAVING TFLOAT > 52.88999938964844 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_FLOAT表中
TRUNCATE TABLE T_TYPE_FLOAT;
INSERT INTO T_TYPE_FLOAT (SELECT TFLOAT FROM P1000 GROUP BY TFLOAT HAVING TFLOAT > 52.88999938964844);
-- 查看返回结果
SELECT * FROM T_TYPE_FLOAT LIMIT 10;

SELECT TDECIMAL FROM P1000 GROUP BY TDECIMAL HAVING TDECIMAL < 9934.32 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DECIMAL表中
TRUNCATE TABLE T_TYPE_DECIMAL;
INSERT INTO T_TYPE_DECIMAL (SELECT TDECIMAL FROM P1000 GROUP BY TDECIMAL HAVING TDECIMAL < 9934.32);
-- 查看返回结果
SELECT * FROM T_TYPE_DECIMAL LIMIT 10;

SELECT TNUMERIC FROM P1000 GROUP BY TNUMERIC HAVING TNUMERIC > 43.1703 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_NUMERIC表中
TRUNCATE TABLE T_TYPE_NUMERIC;
INSERT INTO T_TYPE_NUMERIC (SELECT TNUMERIC FROM P1000 GROUP BY TNUMERIC HAVING TNUMERIC > 43.1703);
-- 查看返回结果
SELECT * FROM T_TYPE_NUMERIC LIMIT 10;

SELECT TDATE FROM P1000 GROUP BY TDATE HAVING TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-02-19','YYYY-MM-DD') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DATE表中
TRUNCATE TABLE T_TYPE_DATE;
INSERT INTO T_TYPE_DATE (SELECT TDATE FROM P1000 GROUP BY TDATE HAVING TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-02-19','YYYY-MM-DD'));
-- 查看返回结果
SELECT * FROM T_TYPE_DATE LIMIT 10;

SELECT TTIMESTAMP FROM P1000 GROUP BY TTIMESTAMP HAVING TTIMESTAMP < TO_TIMESTAMP('2049-08-05 05:40:39.000000','YYYY-MM-DD HH24:MI:SS.FF') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_TIMESTAMP表中
TRUNCATE TABLE T_TYPE_TIMESTAMP;
INSERT INTO T_TYPE_TIMESTAMP (SELECT TTIMESTAMP FROM P1000 GROUP BY TTIMESTAMP HAVING TTIMESTAMP < TO_TIMESTAMP('2049-08-05 05:40:39.000000','YYYY-MM-DD HH24:MI:SS.FF'));
-- 查看返回结果
SELECT * FROM T_TYPE_TIMESTAMP LIMIT 10;

SELECT TBOOL FROM P1000 GROUP BY TBOOL HAVING TBOOL = 'True' LIMIT 10;
-- 把查询出的数据insert到T_TYPE_BOOL表中
TRUNCATE TABLE T_TYPE_BOOL;
INSERT INTO T_TYPE_BOOL (SELECT TBOOL FROM P1000 GROUP BY TBOOL HAVING TBOOL = 'True');
-- 查看返回结果
SELECT * FROM T_TYPE_BOOL LIMIT 10;

SELECT TCHAR FROM P1000 GROUP BY TCHAR HAVING TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6' LIMIT 10;
-- 把查询出的数据insert到T_TYPE_CHAR表中
TRUNCATE TABLE T_TYPE_CHAR;
INSERT INTO T_TYPE_CHAR (SELECT TCHAR FROM P1000 GROUP BY TCHAR HAVING TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6');
-- 查看返回结果
SELECT * FROM T_TYPE_CHAR LIMIT 10;

SELECT TVARCHAR FROM P1000 GROUP BY TVARCHAR HAVING TVARCHAR IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_VARCHAR表中
TRUNCATE TABLE T_TYPE_VARCHAR;
INSERT INTO T_TYPE_VARCHAR (SELECT TVARCHAR FROM P1000 GROUP BY TVARCHAR HAVING TVARCHAR IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME'));
-- 查看返回结果
SELECT * FROM T_TYPE_VARCHAR LIMIT 10;


-- 不同数据类型组合进行having查询
-- 3种整型数据类型组合
SELECT TSMALLINT,TINTEGER,TBIGINT FROM P1000 GROUP BY TSMALLINT, TINTEGER,TBIGINT HAVING TSMALLINT > 300 AND TINTEGER > 400 AND TBIGINT > 500 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_INTS表中
TRUNCATE TABLE T_TYPE_INTS;
INSERT INTO T_TYPE_INTS (SELECT TSMALLINT,TINTEGER,TBIGINT FROM P1000 GROUP BY TSMALLINT, TINTEGER,TBIGINT HAVING TSMALLINT > 300 AND TINTEGER > 400 AND TBIGINT > 500);
-- 查看返回结果
SELECT * FROM T_TYPE_INTS LIMIT 10;

-- 5种浮点型数据类型组合
SELECT TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC FROM P1000 GROUP BY TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC HAVING TREAL > 400.22 OR TDOUBLE > 200.22 OR TDECIMAL > 400.11 OR TNUMERIC > 800.11 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_FLOATS表中
TRUNCATE TABLE T_TYPE_FLOATS;
INSERT INTO T_TYPE_FLOATS (SELECT TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC FROM P1000 GROUP BY TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC HAVING TREAL > 400.22 OR TDOUBLE > 200.22 OR TDECIMAL > 400.11 OR TNUMERIC > 800.11);
-- 查看返回结果
SELECT * FROM T_TYPE_FLOATS LIMIT 10;

-- 2种日期数据类型组合
SELECT TDATE,TTIMESTAMP FROM P1000 GROUP BY TDATE,TTIMESTAMP HAVING TDATE > TO_DATE('1979-02-19','YYYY-MM-DD') AND TTIMESTAMP > TO_TIMESTAMP('1979-01-21 21:45:16.000000','YYYY-MM-DD HH24:MI:SS.FF') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DATES表中
TRUNCATE TABLE T_TYPE_DATES;
INSERT INTO T_TYPE_DATES (SELECT TDATE,TTIMESTAMP FROM P1000 GROUP BY TDATE,TTIMESTAMP HAVING TDATE TDATE > TO_DATE('1979-02-19','YYYY-MM-DD') AND TTIMESTAMP > TO_TIMESTAMP('1979-01-21 21:45:16.000000','YYYY-MM-DD HH24:MI:SS.FF'));
-- 查看返回结果
SELECT * FROM T_TYPE_DATES LIMIT 10;

-- 2种字符数据类型组合
SELECT TCHAR,TVARCHAR FROM P1000 GROUP BY TCHAR, TVARCHAR HAVING TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6' OR TVARCHAR IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_CHARS表中
TRUNCATE TABLE T_TYPE_CHARS;
INSERT INTO T_TYPE_CHARS (SELECT TCHAR,TVARCHAR FROM P1000 GROUP BY TCHAR, TVARCHAR HAVING TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6' OR TVARCHAR IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME'));
-- 查看返回结果
SELECT * FROM T_TYPE_CHARS LIMIT 10;

-- 整型，浮点型，字符型，日期类型4种数据类型组合
SELECT TBIGINT,TDOUBLE,TCHAR,TDATE FROM P1000 GROUP BY TBIGINT, TDOUBLE, TCHAR,TDATE HAVING TBIGINT > 500 OR TDOUBLE < 400.22 OR TCHAR IN ('NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6','EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU') AND TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-11-21','YYYY-MM-DD') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY4表中
TRUNCATE TABLE T_TYPE_ARRAY4;
INSERT INTO T_TYPE_ARRAY4 (SELECT TBIGINT,TDOUBLE,TCHAR,TDATE FROM P1000 GROUP BY TBIGINT, TDOUBLE, TCHAR,TDATE HAVING TBIGINT > 500 OR TDOUBLE < 400.22 OR TCHAR IN ('NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6','EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU') AND TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-11-21','YYYY-MM-DD'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY4 LIMIT 10;

-- 整型，浮点型2种数据类型组合
SELECT TSMALLINT,TREAL FROM P1000 GROUP BY TSMALLINT, TREAL HAVING TSMALLINT >30 AND TREAL > 40.34 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY21表中
TRUNCATE TABLE T_TYPE_ARRAY21;
INSERT INTO T_TYPE_ARRAY21 (SELECT TSMALLINT,TREAL FROM P1000 GROUP BY TSMALLINT, TREAL HAVING TSMALLINT >30 AND TREAL > 40.34);
SELECT * FROM T_TYPE_ARRAY21 LIMIT 10;

-- 整型，字符型2种数据类型组合
SELECT TINTEGER,TVARCHAR FROM P1000 GROUP BY TINTEGER, TVARCHAR HAVING TINTEGER > 200 AND TVARCHAR NOT IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY22表中
TRUNCATE TABLE T_TYPE_ARRAY22;
INSERT INTO T_TYPE_ARRAY22 (SELECT TINTEGER,TVARCHAR FROM P1000 GROUP BY TINTEGER, TVARCHAR HAVING TINTEGER > 200 AND TVARCHAR NOT IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY22 LIMIT 10;

-- 整型，日期型2种数据类型组合
SELECT TBIGINT,TDATE FROM P1000 GROUP BY TBIGINT, TDATE HAVING TBIGINT > 400 AND TDATE > TO_DATE('1979-02-19','YYYY-MM-DD HH24:MI:SS') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY23表中
TRUNCATE TABLE T_TYPE_ARRAY23;
INSERT INTO T_TYPE_ARRAY23 (SELECT TBIGINT,TDATE FROM P1000 GROUP BY TBIGINT, TDATE HAVING TBIGINT > 400 AND TDATE > TO_DATE('1979-02-19','YYYY-MM-DD HH24:MI:SS'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY23 LIMIT 10;

-- 整型，浮点型，字符型3种数据类型组合
SELECT TSMALLINT,TREAL,TCHAR FROM P1000 GROUP BY TSMALLINT, TREAL, TCHAR HAVING TSMALLINT > 300 AND TREAL<100.33 OR TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6' LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY31表中
TRUNCATE TABLE T_TYPE_ARRAY31;
INSERT INTO T_TYPE_ARRAY31 (SELECT TSMALLINT,TREAL,TCHAR FROM P1000 GROUP BY TSMALLINT, TREAL, TCHAR HAVING TSMALLINT > 300 AND TREAL<100.33 OR TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6');
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY31 LIMIT 10;

-- 整型，浮点型，日期型3种数据类型组合
SELECT TSMALLINT,TREAL,TDATE FROM P1000 GROUP BY TSMALLINT, TREAL, TDATE HAVING TSMALLINT> 40 AND TREAL >4000.23 AND TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-11-21','YYYY-MM-DD') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY32表中
TRUNCATE TABLE T_TYPE_ARRAY32;
INSERT INTO T_TYPE_ARRAY32 (SELECT TSMALLINT,TREAL,TDATE FROM P1000 GROUP BY TSMALLINT, TREAL, TDATE HAVING TSMALLINT> 40 AND TREAL >4000.23  AND TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-11-21','YYYY-MM-DD'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY32 LIMIT 10;

-- 浮点型，字符型，日期型3种数据类型组合
SELECT TREAL,TCHAR,TDATE FROM P1000 GROUP BY TREAL,TCHAR, TDATE HAVING TREAL >300.22 AND TCHAR IN ('NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6','EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU') AND TDATE >TO_DATE('1979-02-19','YYYY-MM-DD') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY33表中
TRUNCATE TABLE T_TYPE_ARRAY33;
INSERT INTO T_TYPE_ARRAY33 (SELECT TREAL,TCHAR,TDATE FROM P1000 GROUP BY TREAL,TCHAR, TDATE HAVING TREAL >300.22 AND TCHAR IN ('NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6','EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU') AND TDATE >TO_DATE('1979-02-19','YYYY-MM-DD'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY33 LIMIT 10;

-- 因为布尔型的数据在数据库表里只有一种数据：True，timestamp类型的数据在数据库表里没有重复数据，所以选取余下的11种类型的数据进行组合查询
SELECT TSMALLINT,TINTEGER,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC,TDATE,TCHAR,TVARCHAR FROM P1000 GROUP BY TSMALLINT, TINTEGER, TBIGINT, TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC, TDATE, TCHAR, TVARCHAR HAVING (TSMALLINT>12 OR TINTEGER>30 OR TBIGINT>400) AND (TREAL>1.1 OR TDOUBLE>2.3 OR TFLOAT>1.2 OR TDECIMAL>2.3 OR TNUMERIC>4.4) AND TDATE >TO_DATE('1999-01-01','YYYY-MM-DD') OR TCHAR ='EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU' OR TVARCHAR ='jFSa9VH11qZFwAlKFd7ya9TMC6mGmIZIk4jM8rFP8RPXAuFFY1qD3CW08B6ySGqHsKGucfEU7r8KHWmyP3VBnnN0A1PEir6JCSNE' LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ALL表中
TRUNCATE TABLE T_TYPE_ALL;
INSERT INTO T_TYPE_ALL (SELECT TSMALLINT,TINTEGER,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC,TDATE,TCHAR,TVARCHAR FROM P1000 GROUP BY TSMALLINT, TINTEGER, TBIGINT, TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC, TDATE, TCHAR, TVARCHAR HAVING (TSMALLINT>12 OR TINTEGER>30 OR TBIGINT>400) AND (TREAL>1.1 OR TDOUBLE>2.3 OR TFLOAT>1.2 OR TDECIMAL>2.3 OR TNUMERIC>4.4) AND TDATE >TO_DATE('1999-01-01','YYYY-MM-DD') OR TCHAR ='EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU' OR TVARCHAR ='jFSa9VH11qZFwAlKFd7ya9TMC6mGmIZIk4jM8rFP8RPXAuFFY1qD3CW08B6ySGqHsKGucfEU7r8KHWmyP3VBnnN0A1PEir6JCSNE');
-- 查看返回结果
SELECT * FROM T_TYPE_ALL LIMIT 10;


-- HAVING+函数组合
SELECT TSMALLINT,SUM(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING SUM(TBIGINT) > 50000 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_HAV1表中
DROP TABLE T_TYPE_HAV1 IF EXISTS;
CREATE TABLE T_TYPE_HAV1 AS (SELECT TSMALLINT,SUM(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING SUM(TBIGINT) > 50000) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_HAV1 LIMIT 10;

SELECT TSMALLINT,SUM(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING TSMALLINT > 50000 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_HAV2表中
DROP TABLE T_TYPE_HAV2 IF EXISTS;
CREATE TABLE T_TYPE_HAV2 AS (SELECT TSMALLINT,SUM(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING TSMALLINT > 50000) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_HAV2 LIMIT 10;

SELECT TDATE,COUNT (*),SUM (TSMALLINT),MAX (TSMALLINT),MIN (TSMALLINT),AVG (TSMALLINT) FROM EMP GROUP BY TINTEGER HAVING AVG (TSMALLINT) < 200 AND TDATE > TO_DATE('2019-09-11','YYYY-MM-DD') LIMIT 10;
-- 把查询出的数据insert到T_TYPE_HAV3表中
DROP TABLE T_TYPE_HAV3 IF EXISTS;
CREATE TABLE T_TYPE_HAV3 AS (SELECT TDATE,COUNT (*),SUM (TSMALLINT),MAX (TSMALLINT),MIN (TSMALLINT),AVG (TSMALLINT) FROM EMP GROUP BY TINTEGER HAVING AVG (TSMALLINT) < 200 AND TDATE > TO_DATE('2019-09-11','YYYY-MM-DD')) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_HAV3 LIMIT 10;




-- drop创建的表
DROP TABLE T_TYPE_SMALLINT IF EXISTS;
DROP TABLE T_TYPE_INTEGER IF EXISTS;
DROP TABLE T_TYPE_BIGINT IF EXISTS;
DROP TABLE T_TYPE_REAL IF EXISTS;
DROP TABLE T_TYPE_DOUBLE IF EXISTS;
DROP TABLE T_TYPE_FLOAT IF EXISTS;
DROP TABLE T_TYPE_DECIMAL IF EXISTS;
DROP TABLE T_TYPE_NUMERIC IF EXISTS;
DROP TABLE T_TYPE_DATE IF EXISTS;
DROP TABLE T_TYPE_TIMESTAMP IF EXISTS;
DROP TABLE T_TYPE_BOOL IF EXISTS;
DROP TABLE T_TYPE_CHAR IF EXISTS;
DROP TABLE T_TYPE_VARCHAR IF EXISTS;
DROP TABLE T_TYPE_INTS IF EXISTS;
DROP TABLE T_TYPE_FLOATS IF EXISTS;
DROP TABLE T_TYPE_CHARS IF EXISTS;
DROP TABLE T_TYPE_DATES IF EXISTS;
DROP TABLE T_TYPE_ARRAY4 IF EXISTS;
DROP TABLE T_TYPE_ARRAY21 IF EXISTS;
DROP TABLE T_TYPE_ARRAY22 IF EXISTS;
DROP TABLE T_TYPE_ARRAY23 IF EXISTS;
DROP TABLE T_TYPE_ARRAY31 IF EXISTS;
DROP TABLE T_TYPE_ARRAY32 IF EXISTS;
DROP TABLE T_TYPE_ARRAY33 IF EXISTS;
DROP TABLE T_TYPE_ALL IF EXISTS;
DROP TABLE T_TYPE_HAV1 IF EXISTS;
DROP TABLE T_TYPE_HAV2 IF EXISTS;
DROP TABLE T_TYPE_HAV3 IF EXISTS;





-- 数据类型转换：
-- 转换函数：
SELECT TO_DATE(TDATE,'YYYY-MM-DD') FROM P1000 LIMIT 1;
SELECT TO_TIMESTAMP(TTIMESTAMP,'YYYY-MM-DD HH24:MI:SS') FROM P1000 LIMIT 1;
SELECT TO_CHAR(TTIMESTAMP,'YYYY-MM-DD HH24:MI:SS') FROM P1000 LIMIT 1;

-- SMALLINT类型可以转换为INTEGER，BIGINT，REAL，DOUBLE，FLOAT，DECIMAL,NUMERIC,VARCHAR,CHAR,BOOLEAN类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TSMALLINT AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS FLOAT ) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS DECIMAL(10,2) ) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS NUMERIC(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS DATE) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TSMALLINT AS BOOLEAN ) FROM P1000 LIMIT 1;

-- INTEGER类型可以转换为SMALLINT，BIGINT，REAL，DOUBLE，FLOAT，DECIMAL,NUMERIC,VARCHAR,CHAR,BOOLEAN类型的数据，不支持的数据类型给出提示信息
SELECT CAST(INTEGER AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS FLOAT ) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS DECIMAL(10,2) ) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS NUMERIC(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS DATE) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(INTEGER AS BOOLEAN ) FROM P1000 LIMIT 1;

-- BIGINT类型可以转换为SMALLINT，INTEGER，REAL，DOUBLE，FLOAT，DECIMAL,NUMERIC,VARCHAR,CHAR,BOOLEAN类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TBIGINT AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS FLOAT ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS DECIMAL(10,2) ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS NUMERIC(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS DATE) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TBIGINT AS BOOLEAN ) FROM P1000 LIMIT 1;

-- REAL类型可以转换为INTEGER，BIGINT，BIGINT，DOUBLE，FLOAT，DECIMAL,NUMERIC,VARCHAR,CHAR,BOOLEAN类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TREAL AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS FLOAT ) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS DECIMAL(10,2) ) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS NUMERIC(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS DATE) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TREAL AS BOOLEAN ) FROM P1000 LIMIT 1;

-- DOUBLE类型可以转换为INTEGER，BIGINT，BIGINT，REAL，FLOAT，DECIMAL,NUMERIC,VARCHAR,CHAR,BOOLEAN类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TDOUBLE AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS FLOAT ) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS DECIMAL(10,2) ) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS NUMERIC(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS DATE) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TDOUBLE AS BOOLEAN ) FROM P1000 LIMIT 1;

-- FLOAT类型可以转换为INTEGER，BIGINT，BIGINT，REAL，DOUBLE，DECIMAL,NUMERIC,VARCHAR,CHAR,BOOLEAN类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TFLOAT AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS DECIMAL(10,2) ) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS NUMERIC(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS DATE) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TFLOAT AS BOOLEAN ) FROM P1000 LIMIT 1;

-- DECIMAL类型可以转换为INTEGER，BIGINT，BIGINT，REAL，DOUBLE，FLOAT,NUMERIC,VARCHAR,CHAR,BOOLEAN类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TDECIMAL AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS FLOAT) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS NUMERIC(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS DATE) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TDECIMAL AS BOOLEAN ) FROM P1000 LIMIT 1;

-- NUMERIC类型可以转换为INTEGER，BIGINT，BIGINT，REAL，DOUBLE，FLOAT,DECIMAL,VARCHAR,CHAR,BOOLEAN类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TNUMERIC AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS FLOAT) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS DECIMAL(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS DATE) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TNUMERIC AS BOOLEAN ) FROM P1000 LIMIT 1;

-- DATE类型可以转换为TIMEATAMP,VARCHAR,CHAR类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TDATE AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS FLOAT) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS DECIMAL(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS NUMERIC(10,5)) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TDATE AS DOUBLE ) FROM P1000 LIMIT 1;

-- TIMESTAMP类型可以转换为DATE,VARCHAR,CHAR类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TTIMESTAMP AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS FLOAT) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS DECIMAL(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS NUMERIC(10,5)) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS DATE ) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TTIMESTAMP AS BOOLEAN ) FROM P1000 LIMIT 1;

-- VARCHAR类型转换为其他12种数据类型
SELECT CAST(TVARCHAR AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS FLOAT) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS DECIMAL(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS NUMERIC(10,5)) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS DATE ) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS CHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TVARCHAR AS BOOLEAN ) FROM P1000 LIMIT 1;

-- CHAR类型转换为其他12种数据类型
SELECT CAST(TCHAR AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS FLOAT) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS DECIMAL(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS NUMERIC(10,5)) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS DATE ) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TCHAR AS BOOLEAN ) FROM P1000 LIMIT 1;

-- BOOLEAN类型可以转换为CHAR,VARCHAR类型的数据，不支持的数据类型给出提示信息
SELECT CAST(TBOOL AS SMALLINT ) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS INTEGER ) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS BIGINT) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS REAL ) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS DOUBLE ) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS FLOAT) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS DECIMAL(10,5) ) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS NUMERIC(10,5)) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS DATE ) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS TIMESTAMP ) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS VARCHAR ) FROM P1000 LIMIT 1;
SELECT CAST(TBOOL AS BOOLEAN ) FROM P1000 LIMIT 1;