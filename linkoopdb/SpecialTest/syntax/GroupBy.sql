-- Description：
--             LDB专项测试
--             1.group by 全部类型
--             2.insert 到其他表
--             3.直接返回结果
-- Date：2020-05-09
-- Author：李爱敏

SET ECHO ON
SET TIMING ON

-- GROUP BY语法
-- 穷举所有数据类型进行group by查询
SELECT TSMALLINT FROM P1000 GROUP BY TSMALLINT ORDER BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_SMALLINT表中
DROP TABLE T_TYPE_SMALLINT IF EXISTS;
CREATE TABLE T_TYPE_SMALLINT AS (SELECT TSMALLINT FROM P1000 GROUP BY TSMALLINT) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_SMALLINT ORDER BY TSMALLINT LIMIT 10;

SELECT TINTEGER FROM P1000 GROUP BY TINTEGER ORDER BY TINTEGER LIMIT 10;
-- 把查询出的数据insert到T_TYPE_INTEGER表中
DROP TABLE T_TYPE_INTEGER IF EXISTS;
CREATE TABLE T_TYPE_INTEGER AS (SELECT TINTEGER FROM P1000 GROUP BY TINTEGER) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_INTEGER ORDER BY TINTEGER LIMIT 10;

SELECT TBIGINT FROM P1000 GROUP BY TBIGINT ORDER BY TBIGINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_BIGINT表中
DROP TABLE T_TYPE_BIGINT IF EXISTS;
CREATE TABLE T_TYPE_BIGINT AS (SELECT TBIGINT FROM P1000 GROUP BY TBIGINT)  WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_BIGINT ORDER BY TBIGINT LIMIT 10;

SELECT TREAL FROM P1000 GROUP BY TREAL ORDER BY TREAL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_REAL表中
DROP TABLE T_TYPE_REAL IF EXISTS;
CREATE TABLE T_TYPE_REAL AS (SELECT TREAL FROM P1000 GROUP BY TREAL) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_REAL ORDER BY TREAL LIMIT 10;

SELECT TDOUBLE FROM P1000 GROUP BY TDOUBLE ORDER BY TDOUBLE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DOUBLE表中
DROP TABLE T_TYPE_DOUBLE IF EXISTS;
CREATE TABLE T_TYPE_DOUBLE AS (SELECT TDOUBLE FROM P1000 GROUP BY TDOUBLE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_DOUBLE ORDER BY TDOUBLE LIMIT 10;

SELECT TFLOAT FROM P1000 GROUP BY TFLOAT ORDER BY TFLOAT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_FLOAT表中
DROP TABLE T_TYPE_FLOAT IF EXISTS;
CREATE TABLE T_TYPE_FLOAT AS (SELECT TFLOAT FROM P1000 GROUP BY TFLOAT) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_FLOAT ORDER BY TFLOAT LIMIT 10;

SELECT TDECIMAL FROM P1000 GROUP BY TDECIMAL ORDER BY TDECIMAL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DECIMAL表中
DROP TABLE T_TYPE_DECIMAL IF EXISTS;
CREATE TABLE T_TYPE_DECIMAL AS (SELECT TDECIMAL FROM P1000 GROUP BY TDECIMAL) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_DECIMAL ORDER BY TDECIMAL LIMIT 10;

SELECT TNUMERIC FROM P1000 GROUP BY TNUMERIC ORDER BY TNUMERIC LIMIT 10;
-- 把查询出的数据insert到T_TYPE_NUMERIC表中
DROP TABLE T_TYPE_NUMERIC IF EXISTS;
CREATE TABLE T_TYPE_NUMERIC AS (SELECT TNUMERIC FROM P1000 GROUP BY TNUMERIC) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_NUMERIC ORDER BY TNUMERIC LIMIT 10;

SELECT TDATE FROM P1000 GROUP BY TDATE ORDER BY TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DATE表中
DROP TABLE T_TYPE_DATE IF EXISTS;
CREATE TABLE T_TYPE_DATE AS (SELECT TDATE FROM P1000 GROUP BY TDATE) WITH DATA;
SELECT * FROM T_TYPE_DATE ORDER BY TDATE LIMIT 10;

SELECT TTIMESTAMP FROM P1000 GROUP BY TTIMESTAMP ORDER BY TTIMESTAMP LIMIT 10;
-- 把查询出的数据insert到T_TYPE_TIMESTAMP表中
DROP TABLE T_TYPE_TIMESTAMP IF EXISTS;
CREATE TABLE T_TYPE_TIMESTAMP AS (SELECT TTIMESTAMP FROM P1000 GROUP BY TTIMESTAMP) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_TIMESTAMP ORDER BY TTIMESTAMP LIMIT 10;

SELECT TBOOL FROM P1000 GROUP BY TBOOL ORDER BY TBOOL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_BOOL表中
DROP TABLE T_TYPE_BOOL IF EXISTS;
CREATE TABLE T_TYPE_BOOL AS (SELECT TBOOL FROM P1000 GROUP BY TBOOL) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_BOOL ORDER BY TBOOL LIMIT 10;

SELECT TCHAR FROM P1000 GROUP BY TCHAR ORDER BY TCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_CHAR表中
DROP TABLE T_TYPE_CHAR IF EXISTS;
CREATE TABLE T_TYPE_CHAR AS (SELECT TCHAR FROM P1000 GROUP BY TCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_CHAR ORDER BY TCHAR LIMIT 10;

SELECT TVARCHAR FROM P1000 GROUP BY TVARCHAR ORDER BY TVARCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_VARCHAR表中
DROP TABLE T_TYPE_VARCHAR IF EXISTS;
CREATE TABLE T_TYPE_VARCHAR AS (SELECT TVARCHAR FROM P1000 GROUP BY TVARCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_VARCHAR ORDER BY TVARCHAR LIMIT 10;


-- 不同数据类型组合进行group by查询
-- 3种整型数据类型组合
SELECT TSMALLINT,TINTEGER,TBIGINT FROM P1000 GROUP BY TSMALLINT, TINTEGER,TBIGINT ORDER BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_INTS表中
DROP TABLE T_TYPE_INTS IF EXISTS;
CREATE TABLE T_TYPE_INTS AS (SELECT TSMALLINT,TINTEGER,TBIGINT FROM P1000 GROUP BY TSMALLINT, TINTEGER,TBIGINT) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_INTS ORDER BY TSMALLINT LIMIT 10;

-- 5种浮点型数据类型组合
SELECT TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC FROM P1000 GROUP BY TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC ORDER BY TREAL LIMIT 10;
-- 把查询出的数据insert到T_TYPE_FLOATS表中
DROP TABLE T_TYPE_FLOATS IF EXISTS;
CREATE TABLE T_TYPE_FLOATS AS (SELECT TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC FROM P1000 GROUP BY TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_FLOATS ORDER BY TREAL LIMIT 10;

-- 2种字符型数据类型组合
SELECT TCHAR,TVARCHAR FROM P1000 GROUP BY TCHAR, TVARCHAR ORDER BY TCHAR LIMIT 10;
-- 把查询出的数据insert到T_TYPE_CHARS表中
DROP TABLE T_TYPE_CHARS IF EXISTS;
CREATE TABLE T_TYPE_CHARS AS (SELECT TCHAR,TVARCHAR FROM P1000 GROUP BY TCHAR, TVARCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_CHARS ORDER BY TCHAR LIMIT 10;

-- 2种日期类型数据类型组合
SELECT TDATE,TTIMESTAMP FROM P1000 GROUP BY TDATE,TTIMESTAMP ORDER BY TTIMESTAMP LIMIT 10;
-- 把查询出的数据insert到T_TYPE_DATES表中
DROP TABLE T_TYPE_DATES IF EXISTS;
CREATE TABLE T_TYPE_DATES AS (SELECT TDATE,TTIMESTAMP FROM P1000 GROUP BY TDATE,TTIMESTAMP) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_DATES ORDER BY TTIMESTAMP LIMIT 10;

-- 整型，浮点型，字符型，日期型4种数据类型组合
SELECT TBIGINT,TDOUBLE,TCHAR,TDATE FROM P1000 GROUP BY TBIGINT, TDOUBLE, TCHAR,TDATE ORDER BY TBIGINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY4表中
DROP TABLE T_TYPE_ARRAY4 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY4 AS (SELECT TBIGINT,TDOUBLE,TCHAR,TDATE FROM P1000 GROUP BY TBIGINT, TDOUBLE, TCHAR,TDATE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY4 ORDER BY TBIGINT LIMIT 10;

-- 整型，浮点型2种数据类型组合
SELECT TSMALLINT,TREAL FROM P1000 GROUP BY TSMALLINT, TREAL ORDER BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY21表中
DROP TABLE T_TYPE_ARRAY21 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY21 AS (SELECT TSMALLINT,TREAL FROM P1000 GROUP BY TSMALLINT, TREAL) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY21 ORDER BY TSMALLINT LIMIT 10;

-- 整型，字符型2种数据类型组合
SELECT TINTEGER,TVARCHAR FROM P1000 GROUP BY TINTEGER, TVARCHAR ORDER BY TINTEGER LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY22表中
DROP TABLE T_TYPE_ARRAY22 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY22 AS (SELECT TINTEGER,TVARCHAR FROM P1000 GROUP BY TINTEGER, TVARCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY22 ORDER BY TINTEGER LIMIT 10;

-- 整型，日期型2种数据类型组合
SELECT TBIGINT,TDATE FROM P1000 GROUP BY TBIGINT, TDATE ORDER BY TBIGINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY23表中
DROP TABLE T_TYPE_ARRAY23 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY23 AS (SELECT TBIGINT,TDATE FROM P1000 GROUP BY TBIGINT, TDATE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY23 ORDER BY TBIGINT LIMIT 10;

-- 整型，浮点型，字符型3种数据类型组合
SELECT TSMALLINT,TREAL,TCHAR FROM P1000 GROUP BY TSMALLINT, TREAL, TCHAR ORDER BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY31表中
DROP TABLE T_TYPE_ARRAY31 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY31 AS (SELECT TSMALLINT,TREAL,TCHAR FROM P1000 GROUP BY TSMALLINT, TREAL, TCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY31 ORDER BY TSMALLINT LIMIT 10;

-- 整型，浮点型，日期型3种数据类型组合
SELECT TSMALLINT,TREAL,TDATE FROM P1000 GROUP BY TSMALLINT, TREAL, TDATE ORDER BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY32表中
DROP TABLE T_TYPE_ARRAY32 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY32 AS (SELECT TSMALLINT,TREAL,TDATE FROM P1000 GROUP BY TSMALLINT, TREAL, TDATE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY32 ORDER BY TSMALLINT LIMIT 10;

-- 浮点型，字符型，日期型3种数据类型组合
SELECT TREAL,TCHAR,TDATE FROM P1000 GROUP BY TREAL,TCHAR, TDATE ORDER BY TDATE LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ARRAY33表中
DROP TABLE T_TYPE_ARRAY33 IF EXISTS;
CREATE TABLE T_TYPE_ARRAY33 AS (SELECT TREAL,TCHAR,TDATE FROM P1000 GROUP BY TREAL,TCHAR, TDATE) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ARRAY33 ORDER BY TDATE LIMIT 10;

-- 因为布尔型的数据在数据库表里只有一种数据：True，timestamp类型的数据在数据库表里没有重复数据，所以选取余下的11种类型的数据进行组合查询
SELECT TSMALLINT,TINTEGER,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC,TDATE,TCHAR,TVARCHAR FROM P1000 GROUP BY TSMALLINT, TINTEGER, TBIGINT, TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC, TDATE, TCHAR, TVARCHAR ORDER BY TSMALLINT LIMIT 10;
-- 把查询出的数据insert到T_TYPE_ALL表中
DROP TABLE T_TYPE_ALL IF EXISTS;
CREATE TABLE T_TYPE_ALL AS (SELECT TSMALLINT,TINTEGER,TBIGINT,TREAL,TDOUBLE,TFLOAT,TDECIMAL,TNUMERIC,TDATE,TCHAR,TVARCHAR FROM P1000 GROUP BY TSMALLINT, TINTEGER, TBIGINT, TREAL, TDOUBLE, TFLOAT, TDECIMAL, TNUMERIC, TDATE, TCHAR, TVARCHAR) WITH DATA;
-- 查看返回结果
SELECT * FROM T_TYPE_ALL ORDER BY TSMALLINT LIMIT 10;


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