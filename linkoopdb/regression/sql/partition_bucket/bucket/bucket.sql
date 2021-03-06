--Description:partition
--Date：2020-06-30
--Author：阮娜

SET ECHO ON
SET TIMING ON

-- 删除视图
DROP VIEW V_BUC IF EXISTS;
DROP VIEW V_BUC_1 IF EXISTS;
-- 删除表
DROP TABLE T_BUC_INT IF EXISTS;
DROP TABLE T_BUC_BOOLEAN IF EXISTS;
DROP TABLE T_BUC_CHAR IF EXISTS;
DROP TABLE T_BUC_DATE IF EXISTS;
DROP TABLE T_BUC_DECIMAL IF EXISTS;
DROP TABLE T_BUC_DOUBLE IF EXISTS;
DROP TABLE T_BUC_FLOAT IF EXISTS;
DROP TABLE T_BUC_NUMERIC IF EXISTS;
DROP TABLE T_BUC_REAL IF EXISTS;
DROP TABLE T_BUC_SMALLINT IF EXISTS;
DROP TABLE T_BUC_TIMESTAMP IF EXISTS;
DROP TABLE T_BUC_VARCHAR IF EXISTS;
DROP TABLE T_BUC_BIGINT IF EXISTS;
DROP TABLE T_BUC_ARRAY IF EXISTS;
DROP TABLE T_BUC2 IF EXISTS;
DROP TABLE T_BUC3 IF EXISTS;
DROP TABLE T_BUC_MONTH IF EXISTS;
DROP TABLE T_BUC_LEN IF EXISTS;
DROP TABLE T_BUC_ABS IF EXISTS;
DROP TABLE T_BUC_MOD IF EXISTS;
DROP TABLE T_BUC_FLOOR IF EXISTS;
DROP TABLE T_BUC_TODATE IF EXISTS;
DROP TABLE T_BUC_DAY IF EXISTS;
DROP TABLE T_BUC_ROUND IF EXISTS;
DROP TABLE T_BUC2_FUNC2 IF EXISTS;
DROP TABLE T_BUC2_FUNC1 IF EXISTS;
DROP TABLE T_BUC_EX1 IF EXISTS;
DROP TABLE T_EX_DATA IF EXISTS;
DROP TABLE T_BUC_PALLAS IF EXISTS;
DROP TABLE T_BUC_1 IF EXISTS;
DROP TABLE T_BUC_2 IF EXISTS;
DROP TABLE EX_PART_BUC IF EXISTS;

-- 创建外部表，10条数据
CREATE EXTERNAL TABLE EX_PART_BUC(TBIGINT BIGINT,TINT INT,TSMALLINT SMALLINT,TREAL REAL,TDOUBLE DOUBLE,TFLOAT FLOAT,TDECIMAL DECIMAL(10,2),TNUMERIC NUMERIC(10,4),TDATE DATE,TTIMESTAMP TIMESTAMP,TBOOL BOOLEAN,TCHAR CHAR(30),TVARCHAR VARCHAR(255))
location ('HDFSRPC_URL/partition_bucket/partition_bucket.csv') FORMAT 'csv' (DELIMITER ',');

-- 创建分桶表，以int类型列分桶
CREATE TABLE T_BUC_INT (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 4 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_INT;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_INT';
-- 插入数据，2个分桶，一个桶有9条数据，一个桶有1条数据
INSERT INTO T_BUC_INT SELECT TINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_INT
SELECT * FROM T_BUC_INT;

-- 创建分桶表，以boolean类型列分桶
CREATE TABLE T_BUC_BOOLEAN (A BOOLEAN, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 3 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_BOOLEAN;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_BOOLEAN';
-- 插入数据，2个分桶，一个桶4条false数据，一个桶6条true数据
INSERT INTO T_BUC_BOOLEAN SELECT TBOOL, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_BOOLEAN
SELECT * FROM T_BUC_BOOLEAN;

-- 创建分桶表，以char类型列分桶
CREATE TABLE T_BUC_CHAR (A CHAR(30), B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 2 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_CHAR;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_CHAR';
-- 插入数据，分桶字段值全都一致，1个分桶
INSERT INTO T_BUC_CHAR SELECT TCHAR, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_CHAR
SELECT * FROM T_BUC_CHAR;

-- 创建分桶表，以date类型列分桶
CREATE TABLE T_BUC_DATE (A DATE, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 1 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_DATE;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_DATE';
-- 插入数据，1个分桶
INSERT INTO T_BUC_DATE SELECT TDATE, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_DATE
SELECT * FROM T_BUC_DATE;

-- 创建分桶表，以decimal类型列分桶
CREATE TABLE T_BUC_DECIMAL (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (B) INTO 5 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_DECIMAL;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_DECIMAL';
-- 插入数据，10条数据平均分到5个桶
INSERT INTO T_BUC_DECIMAL SELECT TINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_DECIMAL
SELECT * FROM T_BUC_DECIMAL;

-- 创建分桶表，以double类型列分桶
CREATE TABLE T_BUC_DOUBLE (A DOUBLE, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 10 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_DOUBLE;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_DOUBLE';
-- 插入数据，10条数据非平均分到5个桶
INSERT INTO T_BUC_DOUBLE SELECT TDOUBLE, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_DOUBLE
SELECT * FROM T_BUC_DOUBLE;

-- 创建分桶表，以float类型列分桶
CREATE TABLE T_BUC_FLOAT (A FLOAT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 6 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_FLOAT;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_FLOAT';
-- 插入数据，10条数据非平均分到5个桶
INSERT INTO T_BUC_FLOAT SELECT TFLOAT, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_FLOAT
SELECT * FROM T_BUC_FLOAT;

-- 创建分桶表，以NUMERIC类型列分桶
CREATE TABLE T_BUC_NUMERIC (A NUMERIC(10,4), B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 7 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_NUMERIC;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_NUMERIC';
-- 插入数据，分桶字段值有null，4个分桶
INSERT INTO T_BUC_NUMERIC SELECT TNUMERIC, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_NUMERIC
SELECT * FROM T_BUC_NUMERIC;

-- 创建分桶表，以REAL类型列分桶
CREATE TABLE T_BUC_REAL (A REAL, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 8 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_REAL;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_REAL';
-- 插入数据，6个分桶
INSERT INTO T_BUC_REAL SELECT TREAL, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_REAL
SELECT * FROM T_BUC_REAL;

-- 创建分桶表，以SMALLINT类型列分桶
CREATE TABLE T_BUC_SMALLINT (A SMALLINT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 9 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_SMALLINT;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_SMALLINT';
-- 插入数据
INSERT INTO T_BUC_SMALLINT SELECT TSMALLINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_SMALLINT
SELECT * FROM T_BUC_SMALLINT;

-- 创建分桶表，以TIMESTAMP类型列分桶
CREATE TABLE T_BUC_TIMESTAMP (A TIMESTAMP, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 13 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_TIMESTAMP;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_TIMESTAMP';
-- 插入数据，8个分桶
INSERT INTO T_BUC_TIMESTAMP SELECT TTIMESTAMP, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_TIMESTAMP
SELECT * FROM T_BUC_TIMESTAMP;

-- 创建分桶表，以VARCHAR类型列分桶
CREATE TABLE T_BUC_VARCHAR (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (C) INTO 997 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_VARCHAR;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_VARCHAR';
-- 插入数据，9个分桶
INSERT INTO T_BUC_VARCHAR SELECT TINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_VARCHAR
SELECT * FROM T_BUC_VARCHAR;

-- 创建分桶表，以BIGINT类型列分桶
CREATE TABLE T_BUC_BIGINT (A BIGINT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 100 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_BIGINT;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_BIGINT';
-- 插入数据，10分桶
INSERT INTO T_BUC_BIGINT SELECT TBIGINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC_BIGINT
SELECT * FROM T_BUC_BIGINT;

-- 创建分桶表，以ARRAY类型列分桶
CREATE TABLE T_BUC_ARRAY (A INT ARRAY, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 2 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_ARRAY;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_ARRAY';
-- 插入数据，3个分桶
INSERT INTO T_BUC_ARRAY VALUES (ARRAY[1,2], 1.1, 'a'), (ARRAY[1,2], 2.2, 'b'), (ARRAY[2,3], 3.3, 'c');
-- 查询表T_BUC_ARRAY
SELECT * FROM T_BUC_ARRAY;

-- 创建以2个字段分桶的分桶表
CREATE TABLE T_BUC2 (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A, C) INTO 4 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC2;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC2';
-- 插入数据，3个分桶
INSERT INTO T_BUC2 SELECT TINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC2
SELECT * FROM T_BUC2;

-- 创建以所有字段分桶的分桶表
CREATE TABLE T_BUC3 (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A, B, C) INTO 4 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC3;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC3';
-- 插入数据，4个分桶
INSERT INTO T_BUC3 SELECT TINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC;
-- 查询表T_BUC3
SELECT * FROM T_BUC3;

-- 创建以func(col)分桶的分桶表
CREATE TABLE T_BUC_MONTH (A DATE, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (MONTH(A)) INTO 4 BUCKETS;
CREATE TABLE T_BUC_LEN (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (LENGTH(C)) INTO 4 BUCKETS;
CREATE TABLE T_BUC_ABS (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (ABS(A)) INTO 4 BUCKETS;
CREATE TABLE T_BUC_MOD (A BIGINT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (MOD(A, 2)) INTO 4 BUCKETS;
CREATE TABLE T_BUC_FLOOR (A FLOAT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (FLOOR(A)) INTO 4 BUCKETS;
CREATE TABLE T_BUC_TODATE (A TIMESTAMP, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (TO_DATE(A)) INTO 4 BUCKETS;
CREATE TABLE T_BUC_DAY (A TIMESTAMP, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (DAY(TO_DATE(A))) INTO 4 BUCKETS;
CREATE TABLE T_BUC_ROUND (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (ROUND(B)) INTO 4 BUCKETS;
-- 创建以多个func(col)分桶的分桶表
CREATE TABLE T_BUC2_FUNC2 (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (ABS(A), LENGTH(C)) INTO 4 BUCKETS;
-- 创建以func(col)和col分桶的分桶表
CREATE TABLE T_BUC2_FUNC1 (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A, LENGTH(C)) INTO 4 BUCKETS;

-- 创建以不存在字段分桶的分桶表
CREATE TABLE T_BUC (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (D) INTO 4 BUCKETS;
-- CLUSTERED拼写错误
CREATE TABLE T_BUC (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTER BY (A) INTO 4 BUCKETS;
-- 缺失括号
CREATE TABLE T_BUC (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY A INTO 4 BUCKETS;
-- 缺失逗号
CREATE TABLE T_BUC (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A C) INTO 4 BUCKETS;
-- 缺失BY
CREATE TABLE T_BUC (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED (A) INTO 4 BUCKETS;
-- 桶个数为负数
CREATE TABLE T_BUC (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO -4 BUCKETS;
-- BUCKETS拼写错误
CREATE TABLE T_BUC (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 4 BUCKET;
-- 缺失INTO
CREATE TABLE T_BUC (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) 4 BUCKETS;

-- 创建外部分桶表T_BUC_EX1
CREATE EXTERNAL TABLE T_BUC_EX1(TINT INT,TDECIMAL DECIMAL(10,2),TVARCHAR VARCHAR(255))
LOCATION ('HDFSRPC_URL/partition_bucket1') FORMAT 'csv' (DELIMITER ',') CLUSTERED BY (TINT) INTO 4 BUCKETS;
-- 查看创建表的ddl
SHOW CREATE TABLE T_BUC_EX1;
-- 查看系统表中该表的分桶字段
select PERIPHERAL_INFO from information_schema.system_tables where TABLE_NAME = 'T_BUC_EX1';
-- 插入数据，2个分桶
INSERT INTO T_BUC_EX1 SELECT TINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC; 
-- 查询表T_BUC_EX1
SELECT * FROM T_BUC_EX1;

-- 全部读出外部分桶表数据到内部表
CREATE TABLE T_EX_DATA (TINT INT,TDECIMAL DECIMAL(10,2),TVARCHAR VARCHAR(255));
INSERT INTO T_EX_DATA SELECT * FROM T_BUC_EX1;
SELECT * FROM T_EX_DATA;

-- 创建分桶pallas表
CREATE TABLE T_BUC_PALLAS (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 4 BUCKETS ENGINE PALLAS;

-- 某个分桶的数据丢失，读出外部分桶表部分数据到内部表

-- 使用分桶表创建视图
CREATE VIEW V_BUC AS SELECT * FROM T_BUC_INT WHERE A = 7566;
-- 查询视图
SELECT * FROM V_BUC;

-- 2个分桶表union
CREATE TABLE T_BUC_1 (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 3 BUCKETS;
CREATE TABLE T_BUC_2 (A INT, B DECIMAL(10,2), C VARCHAR(255)) CLUSTERED BY (A) INTO 2 BUCKETS;
INSERT INTO T_BUC_1 SELECT TINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC WHERE TBIGINT BETWEEN 1000001 AND 1000005; 
INSERT INTO T_BUC_2 SELECT TINT, TDECIMAL, TVARCHAR FROM EX_PART_BUC WHERE TBIGINT BETWEEN 1000006 AND 10000010;
SELECT * FROM T_BUC_1;
SELECT * FROM T_BUC_2;
SELECT A FROM T_BUC_1 UNION SELECT A FROM T_BUC_2;

-- 2个视图union
CREATE VIEW V_BUC_1 AS SELECT * FROM T_BUC_INT WHERE A = 7698;
SELECT * FROM V_BUC UNION SELECT * FROM V_BUC_1;



