--    Description: 测试pallas create table
--    Date:         2020-07-01
--    Author:       丁婷

set echo on

DROP SCHEMA S_PALLAS_SCHEMA_001 IF EXISTS CASCADE;

CREATE SCHEMA S_PALLAS_SCHEMA_001 engine pallas;

--创建除lob与binary类型外的所有数据类型的表，检查是否为pallas表

DROP TABLE S_PALLAS_SCHEMA_001.T_PALLAS_TABLE_001 IF EXISTS CASCADE;


CREATE TABLE S_PALLAS_SCHEMA_001.T_PALLAS_TABLE_001(
tid SMALLINT,
eid INTEGER,
tbigint BIGINT,
treal REAL,
tdouble DOUBLE,
tfloat FLOAT,
tdecimal DECIMAL(20,2),
tnumeric NUMERIC(38,30),
tdate DATE,
ttimestamp TIMESTAMP,
tvarchar VARCHAR(200),
tchar CHAR(200),
tboolean BOOLEAN,
PRIMARY KEY(tid,eid,tvarchar)
);


INSERT INTO S_PALLAS_SCHEMA_001.T_PALLAS_TABLE_001 VALUES(1,1,1,1.234,1.23456,1.234567,123456789012345678.12,12345678.123456,'2010-08-07','1999-09-09 11:11:11','才能到交付给dsbjbdu%^&$^的保时捷的csdjhk','ddsajk打算北京你78678^&**第三年 dsda sd',true);

show CREATE TABLE S_PALLAS_SCHEMA_001.T_PALLAS_TABLE_001;