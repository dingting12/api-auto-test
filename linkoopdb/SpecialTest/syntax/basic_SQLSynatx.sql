-- Description
--       LDB专项测试
--          1. select list +函数组合
--          2. from 表，子查询
--          3. 操作符（数学，逻辑，比较）
--          4. 函数（全部类型组合）
--          5. where 表达式
--          6. insert 到其他表
--          7. 直接返回结果
--
-- Date：2020-06-10
-- Author：赵石

SET ECHO ON
SET TIMING ON

-- 测试各种数据类型的函数支持
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 
	    TUNIQUE,
		ABS(TSMALLINT-5000),
		ABS(TINTEGER-50000000),
		ABS(TBIGINT-50000000),
		CEIL(TINTEGER/TSMALLINT),
		BROUND(TBIGINT/TSMALLINT,4),
		CEIL(TREAL),
		CEIL(TDOUBLE),
		CEIL(TFLOAT),
		CEIL(TNUMERIC),
		BROUND(TREAL,1),
		BROUND(TDOUBLE,1) BROUND_DOUBLE,
		BROUND(TFLOAT,1) BROUND_FLOAT,
		BROUND(TNUMERIC,1),
		DATE_FORMAT(TDATE, 'YYYY-MM-DD'),
		DATE_FORMAT(TTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS'),
		DATE_FORMAT(DATE_ADD(TDATE, 10), 'YYYY-MM-DD'),
		DATE_FORMAT(DATE_ADD(TTIMESTAMP,10), 'YYYY-MM-DD HH24:MI:SS'),
		DATE_FORMAT(DATE_ADD(TDATE, 10), 'YYYY-MM-DD'),
		DATEDIFF(TDATE, TTIMESTAMP),
		CAST(TBOOL AS INTEGER),
		CAST(TBOOL AS VARCHAR),
	    SUBSTR(TCHAR,10),
	    SUBSTR(TVARCHAR,-10),
	    SUBSTR(TCHARIDX1,100),
	    SUBSTR(TCHARIDX2,-100),
		REPLACE(TVARCHAR,'a','b'),
		REPLACE(TVARCHARIDX1,'c','d'),
	    SUBSTR(TVARCHARIDX1,100),
	    SUBSTR(TVARCHARIDX1,-100),
	    REVERSE(TVARCHARIDX2),
		UPPER(TCHAR||TCHARIDX1),LOWER(TCHAR||TCHARIDX1),
		UPPER(TVARCHARIDX1),LOWER(TVARCHARIDX1)
	FROM H1000
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 
	    TUNIQUE,
		ABS(TSMALLINT-5000),
		ABS(TINTEGER-50000000),
		ABS(TBIGINT-50000000),
		CEIL(TINTEGER/TSMALLINT),
		BROUND(TBIGINT/TSMALLINT,4),
		CEIL(TREAL),
		CEIL(TDOUBLE),
		CEIL(TFLOAT),
		CEIL(TNUMERIC),
		BROUND(TREAL,1),
		BROUND(TDOUBLE,1) BROUND_DOUBLE,
		BROUND(TFLOAT,1) BROUND_FLOAT,
		BROUND(TNUMERIC,1),
		DATE_FORMAT(TDATE, 'YYYY-MM-DD'),
		DATE_FORMAT(TTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS'),
		DATE_FORMAT(DATE_ADD(TDATE, 10), 'YYYY-MM-DD'),
		DATE_FORMAT(DATE_ADD(TTIMESTAMP,10), 'YYYY-MM-DD HH24:MI:SS'),
		DATE_FORMAT(DATE_ADD(TDATE, 10), 'YYYY-MM-DD'),
		DATEDIFF(TDATE, TTIMESTAMP),
		CAST(TBOOL AS INTEGER),
		CAST(TBOOL AS VARCHAR),
	    SUBSTR(TCHAR,10),
	    SUBSTR(TVARCHAR,-10),
	    SUBSTR(TCHARIDX1,100),
	    SUBSTR(TCHARIDX2,-100),
		REPLACE(TVARCHAR,'a','b'),
		REPLACE(TVARCHARIDX1,'c','d'),
	    SUBSTR(TVARCHARIDX1,100),
	    SUBSTR(TVARCHARIDX1,-100),
	    REVERSE(TVARCHARIDX2),
		UPPER(TCHAR||TCHARIDX1),LOWER(TCHAR||TCHARIDX1),
		UPPER(TVARCHARIDX1),LOWER(TVARCHARIDX1)
	FROM (SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;

-- 测试操作符,Like
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE 	TCHAR LIKE 'wwCPj24BEI6e2j8%E3AABkSslALAD'
	OR TVARCHAR LIKE 'gJ5Bs1JHciwrfT70m%3Rl3xENSSO7xWV'
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE 	TCHAR LIKE 'wwCPj24BEI6e2j8%E3AABkSslALAD'
	OR TVARCHAR LIKE 'gJ5Bs1JHciwrfT70m%3Rl3xENSSO7xWV'
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

-- 测试操作符BETWEEN， 日期类型，时间戳类型，整数类型
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE TDATE BETWEEN TO_DATE('2018-01-01','YYYY-MM-DD') AND TO_DATE('2049-01-01','YYYY-MM-DD')
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE TTIMESTAMP BETWEEN TO_TIMESTAMP('2018-01-01','YYYY-MM-DD') AND TO_TIMESTAMP('2049-01-01','YYYY-MM-DD')
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE TSMALLINT BETWEEN 3000 AND 5000
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;

DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE TDATE BETWEEN TO_DATE('2018-01-01','YYYY-MM-DD') AND TO_DATE('2049-01-01','YYYY-MM-DD')
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE TTIMESTAMP BETWEEN TO_TIMESTAMP('2018-01-01','YYYY-MM-DD') AND TO_TIMESTAMP('2049-01-01','YYYY-MM-DD')
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE TSMALLINT BETWEEN 3000 AND 5000
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;

-- 数字运算符, 类型的隐性转换
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	TSMALLINT + TINTEGER + TDOUBLE - TFLOAT - TDECIMAL - TNUMERIC
	FROM 	H1000 
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY 1 LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	TSMALLINT + TINTEGER + TDOUBLE - TFLOAT - TDECIMAL - TNUMERIC
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY 1 LIMIT 3;

-- 数字运算符
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE   TSMALLINT > 4000
	OR      TINTEGER  < 80000000
	OR      TDOUBLE   > 3000
	OR      TFLOAT    < 6500
	OR      TDECIMAL  > 5000
	OR      TNUMERIC  < 5000
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE   TSMALLINT > 4000
	OR      TINTEGER  < 80000000
	OR      TDOUBLE   > 3000
	OR      TFLOAT    < 6500
	OR      TDECIMAL  > 5000
	OR      TNUMERIC  < 5000
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE   TINTEGER / TSMALLINT > 300
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE   TDOUBLE / TFLOAT  > 300
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE   TNUMERIC / TDECIMAL > 300
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

-- 字符串等值判断
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT * 
	FROM 	H1000 
	WHERE 	TCHAR = 'wwCPj24BEI6e2j8EktHZF9G18ENcBaoUrfWcRE3AABkSslALAD'
	    OR  TVARCHARIDX2 = 'kZNR5JkD89cEBo4FR3tU2vsZptbYZr9NzHydbp5Niyoq1dUnddvdKsmwuoxvEx4dz23JcjR9bGtzrxPD2sp13NBsgSiekmBVMpvB'
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT * 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE 	TCHAR = 'wwCPj24BEI6e2j8EktHZF9G18ENcBaoUrfWcRE3AABkSslALAD'
	    OR  TVARCHARIDX2 = 'kZNR5JkD89cEBo4FR3tU2vsZptbYZr9NzHydbp5Niyoq1dUnddvdKsmwuoxvEx4dz23JcjR9bGtzrxPD2sp13NBsgSiekmBVMpvB'
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

-- 字符串IN判断
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT * 
	FROM 	H1000 
	WHERE 	TCHAR IN 
		(
			'wwCPj24BEI6e2j8EktHZF9G18ENcBaoUrfWcRE3AABkSslALAD',
			'NKlW25jgZxhIcCcpGMfgPzdjaTVRxDLK5PMmeuOlW4WkFKnRT3'
		)
	OR    	TSMALLINT IN (2404, 4625)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT * 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE 	TCHAR IN 
		(
			'wwCPj24BEI6e2j8EktHZF9G18ENcBaoUrfWcRE3AABkSslALAD',
			'NKlW25jgZxhIcCcpGMfgPzdjaTVRxDLK5PMmeuOlW4WkFKnRT3'
		)
	OR    	TSMALLINT IN (2404, 4625)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

-- 字符串反向IN判断
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE 	TCHAR NOT IN 
		(
			'wwCPj24BEI6e2j8EktHZF9G18ENcBaoUrfWcRE3AABkSslALAD',
			'NKlW25jgZxhIcCcpGMfgPzdjaTVRxDLK5PMmeuOlW4WkFKnRT3'
		)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE 	TCHAR NOT IN 
		(
			'wwCPj24BEI6e2j8EktHZF9G18ENcBaoUrfWcRE3AABkSslALAD',
			'NKlW25jgZxhIcCcpGMfgPzdjaTVRxDLK5PMmeuOlW4WkFKnRT3'
		)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

-- 日期类型IN判断
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 
	WHERE 	TDATE IN (TO_DATE('2013-01-02','YYYY-MM-DD'))
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000) 
	WHERE 	TDATE IN (TO_DATE('2013-01-02','YYYY-MM-DD'))
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

-- EXISTS 子查询判断
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000 E 
	WHERE EXISTS 
		(
			SELECT * 
			FROM 	H1000 D 
			WHERE 	D.TBIGINT  = E.TBIGINT 
		)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)  E 
	WHERE EXISTS 
		(
			SELECT * 
			FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)  D 
			WHERE 	D.TBIGINT  = E.TBIGINT 
		)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

-- 子查询判断
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000
	WHERE 	TSMALLINT IN 
		(
			SELECT TSMALLINT FROM H1000 ORDER BY TSMALLINT,TDOUBLE LIMIT 30000
		)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE 	TSMALLINT IN 
		(
			SELECT TSMALLINT FROM (SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000) ORDER BY TSMALLINT,TDOUBLE LIMIT 30000
		)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

-- 多字段IN查询，数字类型
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000
	WHERE 	(TINTEGER,TDOUBLE) 
		IN (
			SELECT 		TINTEGER,TDOUBLE 
			FROM 		H1000  
			ORDER BY TSMALLINT,TDOUBLE
			LIMIT 30000
			)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE 	(TINTEGER,TDOUBLE) 
		IN (
			SELECT 		TINTEGER,TDOUBLE 
			FROM 		(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)  
			ORDER BY TSMALLINT,TDOUBLE
			LIMIT 30000
			)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

-- 多字段IN查询，字符串类型
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	H1000
	WHERE 	(TCHAR,TVARCHAR) 
		IN (
			SELECT 	TCHAR,TVARCHAR 
			FROM 	H1000  
			ORDER BY TSMALLINT,TVARCHAR LIMIT 30000
			)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;
DROP TABLE SHI_TEST_QUERY IF EXISTS;
CREATE TABLE SHI_TEST_QUERY 
AS 
(
	SELECT 	* 
	FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)
	WHERE 	(TCHAR,TVARCHAR) 
		IN (
			SELECT 	TCHAR,TVARCHAR 
			FROM 	(SELECT * FROM H1000 ORDER BY TUNIQUE LIMIT 10000)  
			ORDER BY TSMALLINT,TVARCHAR LIMIT 30000
			)
)
WITH DATA;
SELECT COUNT(*) FROM SHI_TEST_QUERY;
SELECT * FROM SHI_TEST_QUERY ORDER BY TUNIQUE LIMIT 3;

DROP TABLE SHI_TEST_QUERY IF EXISTS;
