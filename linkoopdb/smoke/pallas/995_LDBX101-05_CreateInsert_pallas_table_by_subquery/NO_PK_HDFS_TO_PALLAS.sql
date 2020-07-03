--Description: 测试no primary key and the original table is dfs and create pallas table by subquery
--Date:         2020-07-03
--Author:       丁婷

set echo on
DROP TABLE T_NO_PK_HDFS_TO_PALLAS_001 IF EXISTS CASCADE;
DROP TABLE T_NO_PK_HDFS_TO_PALLAS_002 IF EXISTS CASCADE;
DROP TABLE T_NO_PK_HDFS_TO_PALLAS_003 IF EXISTS CASCADE;

 CREATE TABLE T_NO_PK_HDFS_TO_PALLAS_001(
    tsmallint SMALLINT,
    tint int,
    tbigint bigint,
    treal REAL,
    tdouble double,
    tfloat float,
    tdecimal decimal(6,2),
    tnumeric numeric(6,2),
    tdate date,
    ttimestamp timestamp,
    tvarchar varchar(50),
    tchar char(50)     
 );

INSERT INTO T_NO_PK_HDFS_TO_PALLAS_001 VALUES(1,1,1,1.1,1.1,1.1,1.11,1.11,'2015-04-02',timestamp '2034-06-09 11:20:03','dsd','fdfd');
INSERT INTO T_NO_PK_HDFS_TO_PALLAS_001 VALUES(2,2,2,2.2,2.2,2.2,2.22,2.22,'2016-08-12',timestamp '2012-12-09 11:21:23','hjhj','osjjs');
INSERT INTO T_NO_PK_HDFS_TO_PALLAS_001 VALUES(3,3,3,3.3,3.3,3.3,3.33,3.33,'2017-11-30',timestamp '2109-07-12 09:00:03','biiyq','noone');
 
CREATE TABLE T_NO_PK_HDFS_TO_PALLAS_002 AS(SELECT * FROM T_NO_PK_HDFS_TO_PALLAS_001) WITH DATA engine pallas;

show create table T_NO_PK_HDFS_TO_PALLAS_002;
 
SELECT count(*) FROM T_NO_PK_HDFS_TO_PALLAS_002;
 
CREATE TABLE T_NO_PK_HDFS_TO_PALLAS_003 AS(SELECT * FROM T_NO_PK_HDFS_TO_PALLAS_001) WITH NO DATA engine pallas;
 
INSERT INTO T_NO_PK_HDFS_TO_PALLAS_003(tsmallint,ttimestamp) 
  SELECT tsmallint,ttimestamp FROM T_NO_PK_HDFS_TO_PALLAS_001;
  
 SELECT COUNT(*) FROM T_NO_PK_HDFS_TO_PALLAS_003; 
 
 show create table T_NO_PK_HDFS_TO_PALLAS_003