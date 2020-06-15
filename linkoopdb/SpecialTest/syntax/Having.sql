-- Description：
--             LDB专项测试
--             1.having 全部类型
--             2.insert 到其他表
--             3.直接返回结果
-- Date：2020-05-09
-- Author：李爱敏

SET ECHO ON
SET TIMING ON

-- HAVING语法
-- 穷举所有数据类型进行having查询
SELECT TSMALLINT FROM P1000 GROUP BY TSMALLINT HAVING TSMALLINT > 8498 ORDER BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_SMALLINT表中
DROP TABLE T_TYPE_SMALLINT IF EXISTS;
CREATE TABLE T_TYPE_SMALLINT AS (SELECT TSMALLINT FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_SMALLINT (SELECT TSMALLINT FROM P1000 GROUP BY TSMALLINT HAVING TSMALLINT > 8498);
-- 查看返回结果
SELECT * FROM T_TYPE_SMALLINT ORDER BY TSMALLINT LIMIT 10;

SELECT TINTEGER FROM P1000 GROUP BY TINTEGER HAVING TINTEGER < 94523070 ORDER BY TINTEGER LIMIT 10;
-- 把查询出的数据insert到T_TYPE_INTEGER表中
DROP TABLE T_TYPE_INTEGER IF EXISTS;
CREATE TABLE T_TYPE_INTEGER AS (SELECT TINTEGER FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_INTEGER (SELECT TINTEGER FROM P1000 GROUP BY TINTEGER HAVING TINTEGER < 94523070);
-- 查看返回结果
SELECT * FROM T_TYPE_INTEGER ORDER BY TINTEGER LIMIT 10;

SELECT TBIGINT FROM P1000 GROUP BY TBIGINT HAVING TBIGINT < 977486944212 ORDER BY TBIGINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_BIGINT表中
DROP TABLE T_TYPE_BIGINT IF EXISTS;
CREATE TABLE T_TYPE_BIGINT AS (SELECT TBIGINT FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_BIGINT (SELECT TBIGINT FROM P1000 GROUP BY TBIGINT HAVING TBIGINT < 977486944212);
-- 查看返回结果
SELECT * FROM T_TYPE_BIGINT ORDER BY TBIGINT LIMIT 10;

SELECT TREAL FROM P1000 GROUP BY TREAL HAVING TREAL < 9812.82 ORDER BY TREAL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_REAL表中
DROP TABLE T_TYPE_REAL IF EXISTS;
CREATE TABLE T_TYPE_REAL AS (SELECT TREAL FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_REAL (SELECT TREAL FROM P1000 GROUP BY TREAL HAVING TREAL < 9812.82);
-- 查看返回结果
SELECT * FROM T_TYPE_REAL ORDER BY TREAL LIMIT 10;

SELECT TDOUBLE FROM P1000 GROUP BY TDOUBLE HAVING TDOUBLE > 47.95 ORDER BY TDOUBLE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DOUBLE表中
DROP TABLE T_TYPE_DOUBLE IF EXISTS;
CREATE TABLE T_TYPE_DOUBLE AS (SELECT TDOUBLE FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_DOUBLE (SELECT TDOUBLE FROM P1000 GROUP BY TDOUBLE HAVING TDOUBLE > 47.95);
-- 查看返回结果
SELECT * FROM T_TYPE_DOUBLE ORDER BY TDOUBLE LIMIT 10;

SELECT TFLOAT FROM P1000 GROUP BY TFLOAT HAVING TFLOAT > 52.8899 ORDER BY TFLOAT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_FLOAT表中
DROP TABLE T_TYPE_FLOAT IF EXISTS;
CREATE TABLE T_TYPE_FLOAT AS (SELECT TFLOAT FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_FLOAT (SELECT TFLOAT FROM P1000 GROUP BY TFLOAT HAVING TFLOAT > 52.8899);
-- 查看返回结果
SELECT * FROM T_TYPE_FLOAT ORDER BY TFLOAT LIMIT 10;

SELECT TDECIMAL FROM P1000 GROUP BY TDECIMAL HAVING TDECIMAL < 9934.32 ORDER BY TDECIMAL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DECIMAL表中
DROP TABLE T_TYPE_DECIMAL IF EXISTS;
CREATE TABLE T_TYPE_DECIMAL AS (SELECT TDECIMAL FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_DECIMAL (SELECT TDECIMAL FROM P1000 GROUP BY TDECIMAL HAVING TDECIMAL < 9934.32);
-- 查看返回结果
SELECT * FROM T_TYPE_DECIMAL ORDER BY TDECIMAL LIMIT 10;

SELECT TNUMERIC FROM P1000 GROUP BY TNUMERIC HAVING TNUMERIC > 43.1703 ORDER BY TNUMERIC LIMIT 10;
-- 把查询出的数据insert到T_TYPE_NUMERIC表中
DROP TABLE T_TYPE_NUMERIC IF EXISTS;
CREATE TABLE T_TYPE_NUMERIC AS (SELECT TNUMERIC FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_NUMERIC (SELECT TNUMERIC FROM P1000 GROUP BY TNUMERIC HAVING TNUMERIC > 43.1703);
-- 查看返回结果
SELECT * FROM T_TYPE_NUMERIC ORDER BY TNUMERIC LIMIT 10;

SELECT TDATE FROM P1000 GROUP BY TDATE HAVING TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-02-19','YYYY-MM-DD') ORDER BY TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DATE表中
DROP TABLE T_TYPE_DATE IF EXISTS;
CREATE TABLE T_TYPE_DATE AS (SELECT TDATE FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_DATE (SELECT TDATE FROM P1000 GROUP BY TDATE HAVING TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-02-19','YYYY-MM-DD'));
-- 查看返回结果
SELECT * FROM T_TYPE_DATE ORDER BY TDATE LIMIT 10;

SELECT TTIMESTAMP FROM P1000 GROUP BY TTIMESTAMP HAVING TTIMESTAMP < TO_TIMESTAMP('2049-08-05 05:40:39.000000','YYYY-MM-DD HH24:MI:SS.FF') ORDER BY TTIMESTAMP LIMIT 10;
-- 把查询出的数据insert到T_TYPE_TIMESTAMP表中
DROP TABLE T_TYPE_TIMESTAMP IF EXISTS;
CREATE TABLE T_TYPE_TIMESTAMP AS (SELECT TTIMESTAMP FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_TIMESTAMP (SELECT TTIMESTAMP FROM P1000 GROUP BY TTIMESTAMP HAVING TTIMESTAMP < TO_TIMESTAMP('2049-08-05 05:40:39.000000','YYYY-MM-DD HH24:MI:SS.FF'));
-- 查看返回结果
SELECT * FROM T_TYPE_TIMESTAMP ORDER BY TTIMESTAMP LIMIT 10;

SELECT TBOOL FROM P1000 GROUP BY TBOOL HAVING TBOOL = True ORDER BY TBOOL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_BOOL表中
DROP TABLE T_TYPE_BOOL IF EXISTS;
CREATE TABLE T_TYPE_BOOL AS (SELECT TBOOL FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_BOOL (SELECT TBOOL FROM P1000 GROUP BY TBOOL HAVING TBOOL = True);
-- 查看返回结果
SELECT * FROM T_TYPE_BOOL ORDER BY TBOOL LIMIT 10;

SELECT TCHAR FROM P1000 GROUP BY TCHAR HAVING TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6' ORDER BY TCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_CHAR表中
DROP TABLE T_TYPE_CHAR IF EXISTS;
CREATE TABLE T_TYPE_CHAR AS (SELECT TCHAR FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_CHAR (SELECT TCHAR FROM P1000 GROUP BY TCHAR HAVING TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6');
-- 查看返回结果
SELECT * FROM T_TYPE_CHAR ORDER BY TCHAR LIMIT 10;

SELECT TVARCHAR FROM P1000 GROUP BY TVARCHAR HAVING TVARCHAR IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME') ORDER BY TVARCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_VARCHAR表中
DROP TABLE T_TYPE_VARCHAR IF EXISTS;
CREATE TABLE T_TYPE_VARCHAR AS (SELECT TVARCHAR FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_VARCHAR (SELECT TVARCHAR FROM P1000 GROUP BY TVARCHAR HAVING TVARCHAR IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME'));
-- 查看返回结果
SELECT * FROM T_TYPE_VARCHAR ORDER BY TVARCHAR LIMIT 10;


-- 不同数据类型组合进行having查询
-- 3种整型数据类型组合
SELECT TSMALLINT,TINTEGER,TBIGINT
FROM P1000
GROUP BY TSMALLINT, TINTEGER,TBIGINT
HAVING TSMALLINT > 300 AND TINTEGER > 400 AND TBIGINT > 500
ORDER BY TSMALLINT,TINTEGER,TBIGINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_INTS表中
DROP TABLE T_TYPE_INTS IF EXISTS;
CREATE TABLE T_TYPE_INTS AS (SELECT TSMALLINT,TINTEGER,TBIGINT FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_INTS (SELECT TSMALLINT,TINTEGER,TBIGINT FROM P1000 GROUP BY TSMALLINT, TINTEGER,TBIGINT HAVING TSMALLINT > 300 AND TINTEGER > 400 AND TBIGINT > 500);
-- 查看返回结果
SELECT * FROM T_TYPE_INTS ORDER BY TSMALLINT,TINTEGER,TBIGINT LIMIT 10;

-- 5种浮点型数据类型组合
SELECT TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC
FROM P1000
GROUP BY TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC
HAVING TREAL > 400.22 OR TDOUBLE > 200.22 OR TDECIMAL > 400.11 OR TNUMERIC > 800.11
ORDER BY TREAL,TDOUBLE,TFLOAT LIMIT 10;

-- 把查询出的数据insert到T_TYPE_FLOATS表中
DROP TABLE T_TYPE_FLOATS IF EXISTS;
CREATE TABLE T_TYPE_FLOATS AS (SELECT TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_FLOATS (SELECT TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC FROM P1000 GROUP BY TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC HAVING TREAL > 400.22 OR TDOUBLE > 200.22 OR TDECIMAL > 400.11 OR TNUMERIC > 800.11);
-- 查看返回结果
SELECT * FROM T_TYPE_FLOATS ORDER BY TREAL,TDOUBLE,TFLOAT LIMIT 10;

-- 2种日期数据类型组合
SELECT TDATE,TTIMESTAMP FROM P1000 GROUP BY TDATE,TTIMESTAMP HAVING TDATE > TO_DATE('1979-02-19','YYYY-MM-DD') AND TTIMESTAMP > TO_TIMESTAMP('1979-01-21 21:45:16.000000','YYYY-MM-DD HH24:MI:SS.FF') ORDER BY TTIMESTAMP LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DATES表中
DROP TABLE T_TYPE_DATES IF EXISTS;
CREATE TABLE T_TYPE_DATES AS (SELECT TCHAR,TVARCHAR FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_DATES (SELECT TDATE,TTIMESTAMP FROM P1000 GROUP BY TDATE,TTIMESTAMP HAVING TDATE > TO_DATE('1979-02-19','YYYY-MM-DD') AND TTIMESTAMP > TO_TIMESTAMP('1979-01-21 21:45:16.000000','YYYY-MM-DD HH24:MI:SS.FF'));
-- 查看返回结果
SELECT * FROM T_TYPE_DATES ORDER BY TCHAR,TVARCHAR LIMIT 10;

-- 2种字符数据类型组合
SELECT TCHAR,TVARCHAR FROM P1000 GROUP BY TCHAR, TVARCHAR HAVING TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6' OR TVARCHAR IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME') ORDER BY TCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_CHARS表中
DROP TABLE T_TYPE_CHARS IF EXISTS;
CREATE TABLE T_TYPE_CHARS AS (SELECT TDATE,TTIMESTAMP FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_CHARS (SELECT TCHAR,TVARCHAR FROM P1000 GROUP BY TCHAR, TVARCHAR HAVING TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6' OR TVARCHAR IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME'));
-- 查看返回结果
SELECT * FROM T_TYPE_CHARS ORDER BY TDATE,TTIMESTAMP LIMIT 10;

-- 整型，浮点型，字符型，日期类型4种数据类型组合
SELECT TBIGINT,TDOUBLE,TCHAR,TDATE
FROM P1000
GROUP BY TBIGINT, TDOUBLE, TCHAR,TDATE HAVING TBIGINT > 500 OR TDOUBLE < 400.22
OR TCHAR IN ('NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6','EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU')
AND TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-11-21','YYYY-MM-DD')
ORDER BY TBIGINT,TDOUBLE,TCHAR LIMIT 10;

-- 把查询出的数据insert到T_TYPE_ARRAY4表中
DROP TABLE T_TYPE_ARRAY4 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY4 AS (SELECT TBIGINT,TDOUBLE,TCHAR,TDATE FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_ARRAY4 (SELECT TBIGINT,TDOUBLE,TCHAR,TDATE FROM P1000 GROUP BY TBIGINT, TDOUBLE, TCHAR,TDATE HAVING TBIGINT > 500 OR TDOUBLE < 400.22 OR TCHAR IN ('NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6','EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU') AND TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-11-21','YYYY-MM-DD'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY4 ORDER BY TBIGINT,TDOUBLE,TCHAR LIMIT 10;

-- 整型，浮点型2种数据类型组合
SELECT TSMALLINT,TREAL FROM P1000 GROUP BY TSMALLINT, TREAL HAVING TSMALLINT >30 AND TREAL > 40.34
ORDER BY TSMALLINT,TREAL LIMIT 10;

-- 把查询出的数据insert到T_TYPE_ARRAY21表中
DROP TABLE T_TYPE_ARRAY21 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY21 AS (SELECT TSMALLINT,TREAL FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_ARRAY21 (SELECT TSMALLINT,TREAL FROM P1000 GROUP BY TSMALLINT, TREAL HAVING TSMALLINT >30 AND TREAL > 40.34);
SELECT * FROM T_TYPE_ARRAY21
ORDER BY TSMALLINT,TREAL LIMIT 10;

-- 整型，字符型2种数据类型组合
SELECT TINTEGER,TVARCHAR
FROM P1000
GROUP BY TINTEGER, TVARCHAR HAVING TINTEGER > 200
AND TVARCHAR NOT IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME')
ORDER BY TINTEGER,TVARCHAR LIMIT 10;

-- 把查询出的数据insert到T_TYPE_ARRAY22表中
DROP TABLE T_TYPE_ARRAY22 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY22 AS (SELECT TINTEGER,TVARCHAR FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_ARRAY22 (SELECT TINTEGER,TVARCHAR FROM P1000 GROUP BY TINTEGER, TVARCHAR HAVING TINTEGER > 200 AND TVARCHAR NOT IN ('1SGYlFg5qlxYSOJm3RZF9KyGeIYMnIx8hJTWtG2Z4ABSpWlDN7pszRqJ2ujWLHfUJIR0UXPxFIDk3SrvURGL0P6qf375DfNyC9nO','LXFlGmwOWyAn4FaGV9xc5KkhInSWCOdM8n6o9PFmInF1w4Z1bnzRK78h2e2PoG83835E4t85ArAyLvIVkBvPnISZSFiG1aR4oeME'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY22 ORDER BY TINTEGER,TVARCHAR LIMIT 10;

-- 整型，日期型2种数据类型组合
SELECT TBIGINT,TDATE FROM P1000 GROUP BY TBIGINT, TDATE HAVING TBIGINT > 400 AND TDATE > TO_DATE('1979-02-19','YYYY-MM-DD HH24:MI:SS') ORDER BY TBIGINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY23表中
DROP TABLE T_TYPE_ARRAY23 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY23 AS (SELECT TBIGINT,TDATE FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_ARRAY23 (SELECT TBIGINT,TDATE FROM P1000 GROUP BY TBIGINT, TDATE HAVING TBIGINT > 400 AND TDATE > TO_DATE('1979-02-19','YYYY-MM-DD HH24:MI:SS'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY23 ORDER BY TBIGINT LIMIT 10;

-- 整型，浮点型，字符型3种数据类型组合
SELECT TSMALLINT,TREAL,TCHAR
FROM P1000 GROUP BY TSMALLINT, TREAL, TCHAR HAVING TSMALLINT > 300
AND TREAL<100.33 OR TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6'
ORDER BY TSMALLINT,TREAL,TCHAR LIMIT 10;

-- 把查询出的数据insert到T_TYPE_ARRAY31表中
DROP TABLE T_TYPE_ARRAY31 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY31 AS (SELECT TSMALLINT,TREAL,TCHAR FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_ARRAY31 (SELECT TSMALLINT,TREAL,TCHAR FROM P1000 GROUP BY TSMALLINT, TREAL, TCHAR HAVING TSMALLINT > 300 AND TREAL<100.33 OR TCHAR = 'NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6');
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY31 ORDER BY TSMALLINT,TREAL,TCHAR LIMIT 10;

-- 整型，浮点型，日期型3种数据类型组合
SELECT TSMALLINT,TREAL,TDATE FROM P1000 GROUP BY TSMALLINT, TREAL, TDATE HAVING TSMALLINT> 40 AND TREAL >4000.23 AND TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-11-21','YYYY-MM-DD') ORDER BY TSMALLINT,TREAL,TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY32表中
DROP TABLE T_TYPE_ARRAY32 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY32 AS (SELECT TSMALLINT,TREAL,TDATE FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_ARRAY32 (SELECT TSMALLINT,TREAL,TDATE FROM P1000 GROUP BY TSMALLINT, TREAL, TDATE HAVING TSMALLINT> 40 AND TREAL >4000.23  AND TDATE BETWEEN TO_DATE('1979-02-19','YYYY-MM-DD') AND TO_DATE('2010-11-21','YYYY-MM-DD'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY32 ORDER BY TSMALLINT,TREAL,TDATE LIMIT 10;

-- 浮点型，字符型，日期型3种数据类型组合
SELECT TREAL,TCHAR,TDATE FROM P1000 GROUP BY TREAL,TCHAR, TDATE HAVING TREAL >300.22 AND TCHAR IN ('NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6','EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU') AND TDATE >TO_DATE('1979-02-19','YYYY-MM-DD') ORDER BY TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY33表中
DROP TABLE T_TYPE_ARRAY33 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY33 AS (SELECT TREAL,TCHAR,TDATE FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_ARRAY33 (SELECT TREAL,TCHAR,TDATE FROM P1000 GROUP BY TREAL,TCHAR, TDATE HAVING TREAL >300.22 AND TCHAR IN ('NBr2nMF7JorJ9LKRZefRKlWj9vR3G8IRC5Wg86OeYzfuMBV7f6','EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU') AND TDATE >TO_DATE('1979-02-19','YYYY-MM-DD'));
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY33 ORDER BY TDATE LIMIT 10;

-- 因为布尔型的数据在数据库表里只有一种数据：True，timestamp类型的数据在数据库表里没有重复数据，所以选取余下的11种类型的数据进行组合查询
SELECT TSMALLINT,TINTEGER,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC,TDATE,TCHAR,TVARCHAR
FROM P1000
GROUP BY TSMALLINT, TINTEGER, TBIGINT, TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC, TDATE, TCHAR, TVARCHAR
HAVING (TSMALLINT>12 OR TINTEGER>30 OR TBIGINT>400)
AND (TREAL>1.1 OR TDOUBLE>2.3 OR TFLOAT>1.2 OR TDECIMAL>2.3 OR TNUMERIC>4.4)
AND TDATE >TO_DATE('1999-01-01','YYYY-MM-DD')
OR TCHAR ='EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU'
OR TVARCHAR ='jFSa9VH11qZFwAlKFd7ya9TMC6mGmIZIk4jM8rFP8RPXAuFFY1qD3CW08B6ySGqHsKGucfEU7r8KHWmyP3VBnnN0A1PEir6JCSNE'
ORDER BY TSMALLINT,TINTEGER, TBIGINT LIMIT 10;

-- 把查询出的数据insert到T_TYPE_ALL表中
DROP TABLE T_TYPE_ALL IF EXISTS;
CREATE TABLE T_TYPE_ALL AS (SELECT TSMALLINT,TINTEGER,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC,TDATE,TCHAR,TVARCHAR FROM P1000) WITH NO DATA;
INSERT INTO T_TYPE_ALL (SELECT TSMALLINT,TINTEGER,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC,TDATE,TCHAR,TVARCHAR FROM P1000 GROUP BY TSMALLINT, TINTEGER, TBIGINT, TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC, TDATE, TCHAR, TVARCHAR HAVING (TSMALLINT>12 OR TINTEGER>30 OR TBIGINT>400) AND (TREAL>1.1 OR TDOUBLE>2.3 OR TFLOAT>1.2 OR TDECIMAL>2.3 OR TNUMERIC>4.4) AND TDATE >TO_DATE('1999-01-01','YYYY-MM-DD') OR TCHAR ='EicGCMKTtawEbtLLWkJuECm9ywDONiUgBqKMS45rfj947v7hAU' OR TVARCHAR ='jFSa9VH11qZFwAlKFd7ya9TMC6mGmIZIk4jM8rFP8RPXAuFFY1qD3CW08B6ySGqHsKGucfEU7r8KHWmyP3VBnnN0A1PEir6JCSNE');
-- 查看返回结果
SELECT * FROM T_TYPE_ALL ORDER BY TSMALLINT,TINTEGER, TBIGINT LIMIT 10;


-- HAVING+函数组合
SELECT TSMALLINT,SUM(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING SUM(TBIGINT) > 50000 ORDER BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_HAV1表中
DROP TABLE T_TYPE_HAV1 IF EXISTS;
CREATE TABLE T_TYPE_HAV1 AS (SELECT TSMALLINT,SUM(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING SUM(TBIGINT) > 50000) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_HAV1 ORDER BY TSMALLINT LIMIT 10;

SELECT TSMALLINT,MAX(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING TSMALLINT > 5000 ORDER BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_HAV2表中
DROP TABLE T_TYPE_HAV2 IF EXISTS;
CREATE TABLE T_TYPE_HAV2 AS (SELECT TSMALLINT,MAX(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING TSMALLINT > 5000) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_HAV2 ORDER BY TSMALLINT LIMIT 10;

SELECT TSMALLINT,AVG(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING AVG(TBIGINT) > 500000 ORDER BY 1,2 LIMIT 10;
-- 把查询出的数据insert到T_TYPE_HAV2表中
DROP TABLE T_TYPE_HAV3 IF EXISTS;
CREATE TABLE T_TYPE_HAV3 AS (SELECT TSMALLINT,AVG(TBIGINT) FROM P1000 GROUP BY TSMALLINT HAVING AVG(TBIGINT) > 500000) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_HAV3 ORDER BY 1,2 LIMIT 10;

SELECT TSMALLINT,TDATE,COUNT (*),SUM (TINTEGER),MAX (TINTEGER),MIN (TINTEGER),AVG (TINTEGER) FROM P1000 GROUP BY TSMALLINT,TDATE HAVING AVG (TINTEGER) < 200000000 AND TDATE > TO_DATE('2019-09-11','YYYY-MM-DD') ORDER BY TSMALLINT,TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_HAV3表中
DROP TABLE T_TYPE_HAV4 IF EXISTS;
CREATE TABLE T_TYPE_HAV4 AS (SELECT TSMALLINT,TDATE,COUNT (*),SUM (TINTEGER),MAX (TINTEGER),MIN (TINTEGER),AVG (TINTEGER) FROM P1000 GROUP BY TSMALLINT,TDATE HAVING AVG (TINTEGER) < 200000000 AND TDATE > TO_DATE('2019-09-11','YYYY-MM-DD')) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_HAV4 ORDER BY TSMALLINT,TDATE LIMIT 10;




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
DROP TABLE T_TYPE_HAV4 IF EXISTS;