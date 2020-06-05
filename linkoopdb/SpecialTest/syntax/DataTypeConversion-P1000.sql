-- Description：
--             LDB专项测试
--             数据类型转换
-- Date：2020-05-09
-- Author：李爱敏

SET ECHO ON
SET TIMING ON

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