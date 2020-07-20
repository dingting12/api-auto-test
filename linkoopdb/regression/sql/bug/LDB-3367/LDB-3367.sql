--Description:验证bug:http://192.168.1.79:8900/browse/LDB-3445
--Date：2020-07-20
--Author：翟坤
connect admin/123456@jdbc:linkoopdb:tcp://node67:9107/ldb
SET ECHO ON
SET TIMING ON

-- 清空测试表
DROP TABLE TEST1 IF EXISTS;
DROP TABLE TEST2 IF EXISTS;

-- 创建pallas表TEST1
CREATE TABLE TEST1 (ID INT, NAME VARCHAR(10)) engine pallas;

-- 向表TEST1插入一条数据，数据中有换行
INSERT INTO TEST1 VALUES(2,'ddd
sdfds');

-- 创建外部表TEST2
CREATE EXTERNAL TABLE TEST2 (ID INT, NAME VARCHAR(10)) LOCATION ('HDFSRPC_URL/666') FORMAT 'csv' (DELIMITER ',' multiLine 'true');

-- 将TEST1中的数据插入到TEST2
INSERT INTO TEST2 SELECT * FROM TEST1;

-- TEST2中只有一条数据
SELECT * FROM TEST2;






