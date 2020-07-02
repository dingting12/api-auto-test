--    Description: 测试Distributed index on pallas
--    Date:         2020-07-02 
--    Author:       丁婷

set echo on

DROP TABLE T_PALLAS_INDEX_TABLE_001 IF EXISTS CASCADE;

DROP INDEX TEST_INDEX_PALLAS_001 IF EXISTS;

DROP INDEX TEST_INDEX_PALLAS_002 IF EXISTS;

CREATE TABLE T_PALLAS_INDEX_TABLE_001(
    tsmallint SMALLINT,
    tint int PRIMARY KEY,
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
) engine pallas; 

--测试int类型
INSERT INTO T_PALLAS_INDEX_TABLE_001 VALUES(1,1,1,1.1,1.1,1.1,1.11,1.11,'2015-04-02','2034-06-09 11:20:03','dsd','fdfd');

SELECT * FROM T_PALLAS_INDEX_TABLE_001 order by tint;

CREATE INDEX TEST_INDEX_PALLAS_001 ON T_PALLAS_INDEX_TABLE_001(tint);

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_PALLAS_INDEX_TABLE_001' 
group by index_name order by index_name ASC;

SELECT ttimestamp,tdate FROM T_PALLAS_INDEX_TABLE_001
WHERE tint=1;

--测试numeric and timestamp and varchar

INSERT INTO T_PALLAS_INDEX_TABLE_001 VALUES(16,16,16,16.6,16.6,16.16,16.16,16.16,'2456-07-03','2004-11-21 12:20:03','dsi98ds','20dsd5');

SELECT * FROM T_PALLAS_INDEX_TABLE_001 order by tint;

CREATE INDEX TEST_INDEX_PALLAS_002 ON T_PALLAS_INDEX_TABLE_001(tnumeric,ttimestamp,tvarchar);

select count(*), GROUP_CONCAT(column_name SEPARATOR ';'), group_concat(ordinal_position separator ';')  
FROM INFORMATION_SCHEMA.SYSTEM_INDEXINFO where table_name='T_PALLAS_INDEX_TABLE_001'  
group by index_name order by index_name ASC;

SELECT ttimestamp,tdate FROM T_PALLAS_INDEX_TABLE_001
WHERE tnumeric=16.16 and ttimestamp='2004-11-21 12:20:03' and tvarchar='dsi98ds';