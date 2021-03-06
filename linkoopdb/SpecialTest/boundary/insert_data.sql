--Description:column_number
--Date：2020-06-09
--Author：阮娜

SET ECHO ON
SET TIMING ON

-- 删除P_10W_1S和EX_RN_10W表
DROP TABLE IF EXISTS P_10W_1S;
DROP TABLE IF EXISTS EX_RN_10W;

-- 创建外部表EX_RN_10W
create external table EX_RN_10W
(
antiNucleus     INT,
eventFile       INT,
eventNumber     INT,
eventTime       DOUBLE,
histFile        INT,
multiplicity    INT,
NaboveLb        INT,
NbelowLb        INT,
NLb     INT,
primaryTracks   INT,
prodTime        DOUBLE,
Pt      FLOAT,
runNumber       INT,
vertexX FLOAT,
vertexY FLOAT,
vertexZ FLOAT           
) location ('hdfs://node73:8020/node72/ruanna/file/10w.csv') FORMAT 'csv' (DELIMITER ',') PROPERTIES ('ignoreLeadingWhiteSpace':'true');

-- 创建单个shard pallas表P_10W_1S
CREATE TABLE P_10W_1S(
ANTINUCLEUS INTEGER,EVENTFILE INTEGER,EVENTNUMBER INTEGER,
EVENTTIME DOUBLE,HISTFILE INTEGER,MULTIPLICITY INTEGER,
NABOVELB INTEGER,NBELOWLB INTEGER,NLB INTEGER,PRIMARYTRACKS INTEGER,
PRODTIME DOUBLE,PT FLOAT,RUNNUMBER INTEGER,VERTEXX FLOAT,VERTEXY FLOAT,VERTEXZ FLOAT
) PROPERTIES('linkoopdb.pallas.shard_number':'1') ENGINE PALLAS;

-- 有事务，插入10万条数据到pallas表
INSERT INTO P_10W_1S SELECT * FROM EX_RN_10W;

SELECT COUNT(*) FROM P_10W_1S;

-- 删除P_10W01_1S和EX_RN_10W01表
DROP TABLE IF EXISTS P_10W01_1S;
DROP TABLE IF EXISTS EX_RN_10W01;

-- 创建外部表EX_RN_10W01
create external table EX_RN_10W01
(
antiNucleus     INT,
eventFile       INT,
eventNumber     INT,
eventTime       DOUBLE,
histFile        INT,
multiplicity    INT,
NaboveLb        INT,
NbelowLb        INT,
NLb     INT,
primaryTracks   INT,
prodTime        DOUBLE,
Pt      FLOAT,
runNumber       INT,
vertexX FLOAT,
vertexY FLOAT,
vertexZ FLOAT           
) location ('hdfs://node73:8020/node72/ruanna/file/10w01.csv') FORMAT 'csv' (DELIMITER ',') PROPERTIES ('ignoreLeadingWhiteSpace':'true');

-- 创建单个shard pallas表P_10W01_1S
CREATE TABLE P_10W01_1S(
ANTINUCLEUS INTEGER,EVENTFILE INTEGER,EVENTNUMBER INTEGER,
EVENTTIME DOUBLE,HISTFILE INTEGER,MULTIPLICITY INTEGER,
NABOVELB INTEGER,NBELOWLB INTEGER,NLB INTEGER,PRIMARYTRACKS INTEGER,
PRODTIME DOUBLE,PT FLOAT,RUNNUMBER INTEGER,VERTEXX FLOAT,VERTEXY FLOAT,VERTEXZ FLOAT
) PROPERTIES('linkoopdb.pallas.shard_number':'1') ENGINE PALLAS;

-- 有事务，插入10万01条数据到pallas表
INSERT INTO P_10W01_1S SELECT * FROM EX_RN_10W01;

SELECT COUNT(*) FROM P_10W01_1S;

-- 删除P_40W_4S和EX_RN_40W表
DROP TABLE IF EXISTS P_40W_4S;
DROP TABLE IF EXISTS EX_RN_40W;

-- 创建外部表EX_RN_40W
create external table EX_RN_40W
(
antiNucleus     INT,
eventFile       INT,
eventNumber     INT,
eventTime       DOUBLE,
histFile        INT,
multiplicity    INT,
NaboveLb        INT,
NbelowLb        INT,
NLb     INT,
primaryTracks   INT,
prodTime        DOUBLE,
Pt      FLOAT,
runNumber       INT,
vertexX FLOAT,
vertexY FLOAT,
vertexZ FLOAT           
) location ('hdfs://node73:8020/node72/ruanna/file/40w.csv') FORMAT 'csv' (DELIMITER ',') PROPERTIES ('ignoreLeadingWhiteSpace':'true');

-- 创建4个shard pallas表
CREATE TABLE P_40W_4S(
ANTINUCLEUS INTEGER,EVENTFILE INTEGER,EVENTNUMBER INTEGER,
EVENTTIME DOUBLE,HISTFILE INTEGER,MULTIPLICITY INTEGER,
NABOVELB INTEGER,NBELOWLB INTEGER,NLB INTEGER,PRIMARYTRACKS INTEGER,
PRODTIME DOUBLE,PT FLOAT,RUNNUMBER INTEGER,VERTEXX FLOAT,VERTEXY FLOAT,VERTEXZ FLOAT
) PROPERTIES('linkoopdb.pallas.shard_number':'4') ENGINE PALLAS;

-- 有事务，插入40万条数据到pallas表
INSERT INTO P_40W_4S SELECT * FROM EX_RN_40W;

SELECT COUNT(*) FROM P_40W_4S;

-- 删除P_40W_4S和EX_RN_40W表
DROP TABLE IF EXISTS P_41W_4S;
DROP TABLE IF EXISTS EX_RN_41W;

-- 创建外部表EX_RN_40W
create external table EX_RN_41W
(
antiNucleus     INT,
eventFile       INT,
eventNumber     INT,
eventTime       DOUBLE,
histFile        INT,
multiplicity    INT,
NaboveLb        INT,
NbelowLb        INT,
NLb     INT,
primaryTracks   INT,
prodTime        DOUBLE,
Pt      FLOAT,
runNumber       INT,
vertexX FLOAT,
vertexY FLOAT,
vertexZ FLOAT           
) location ('hdfs://node73:8020/node72/ruanna/file/41w.csv') FORMAT 'csv' (DELIMITER ',') PROPERTIES ('ignoreLeadingWhiteSpace':'true');

-- 创建4个shard pallas表
CREATE TABLE P_41W_4S(
ANTINUCLEUS INTEGER,EVENTFILE INTEGER,EVENTNUMBER INTEGER,
EVENTTIME DOUBLE,HISTFILE INTEGER,MULTIPLICITY INTEGER,
NABOVELB INTEGER,NBELOWLB INTEGER,NLB INTEGER,PRIMARYTRACKS INTEGER,
PRODTIME DOUBLE,PT FLOAT,RUNNUMBER INTEGER,VERTEXX FLOAT,VERTEXY FLOAT,VERTEXZ FLOAT
) PROPERTIES('linkoopdb.pallas.shard_number':'4') ENGINE PALLAS;

-- 有事务，插入41万条数据到pallas表
INSERT INTO P_41W_4S SELECT * FROM EX_RN_41W;

SELECT COUNT(*) FROM P_41W_4S;

-- 删除H_10Y表
DROP TABLE IF EXISTS H_10Y;

-- 创建H_10Y hdfs表
CREATE TABLE H_10Y(TUNIQUE BIGINT,TSMALLINT SMALLINT,TINTEGER INTEGER,TBIGINT BIGINT,TREAL DOUBLE,TDOUBLE DOUBLE,TFLOAT FLOAT,TDECIMAL DECIMAL(10,2),TNUMERIC NUMERIC(10,4),TDATE DATE,TTIMESTAMP TIMESTAMP,TBOOL BOOLEAN,TCHAR CHAR(255),TVARCHAR VARCHAR(4096),TCHARIDX1 CHAR(255),TCHARIDX2 CHAR(255),TCHARIDX3 CHAR(255),TVARCHARIDX1 VARCHAR(4096),TVARCHARIDX2 VARCHAR(4096),TVARCHARIDX3 VARCHAR(4096));

-- 有事务，插入10亿数据到hdfs表
INSERT INTO H_10Y SELECT * FROM T10Y_E;

SELECT COUNT(*) FROM H_10Y;

-- 删除P_10Y表
DROP TABLE IF EXISTS P_10Y;

-- 创建P_10Y pallas表
CREATE TABLE P_10Y(TUNIQUE BIGINT,TSMALLINT SMALLINT,TINTEGER INTEGER,TBIGINT BIGINT,TREAL DOUBLE,TDOUBLE DOUBLE,TFLOAT FLOAT,TDECIMAL DECIMAL(10,2),TNUMERIC NUMERIC(10,4),TDATE DATE,TTIMESTAMP TIMESTAMP,TBOOL BOOLEAN,TCHAR CHAR(255),TVARCHAR VARCHAR(4096),TCHARIDX1 CHAR(255),TCHARIDX2 CHAR(255),TCHARIDX3 CHAR(255),TVARCHARIDX1 VARCHAR(4096),TVARCHARIDX2 VARCHAR(4096),TVARCHARIDX3 VARCHAR(4096))
PROPERTIES('linkoopdb.pallas.shard_number':'256') ENGINE PALLAS;

-- 无事务，插入10亿数据到pallas表
LOAD INTO P_10Y SELECT * FROM T10Y_E;

SELECT COUNT(*) FROM P_10Y;