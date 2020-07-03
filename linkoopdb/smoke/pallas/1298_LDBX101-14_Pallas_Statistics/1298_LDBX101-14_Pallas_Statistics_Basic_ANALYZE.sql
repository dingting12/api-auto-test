--Description: 测试pallas statistics
--Date:         2020-07-03
--Author:       丁婷

set echo on
drop table T_PALLAS_STATISTICS_001 if exists;
drop table T_PALLAS_STATISTICS_002 if exists;

--测试Basic ANALYZE
create table T_PALLAS_STATISTICS_001(
i1 int, 
d2 double, 
d3 decimal(10,2), 
d4 date, 
t5 timestamp
) engine pallas;

insert into T_PALLAS_STATISTICS_001 values(
(1,1,1,'2008-08-22', '2008-08-08 20:08:08'),
(2,2,2,'2008-08-23', '2008-08-09 20:08:08'),
(3,3,3,'2008-08-24', '2008-08-10 20:08:08'),
(4,4,4,'2008-08-25', '2008-08-11 20:08:08'),
(5,5,5,'2008-08-26', '2008-08-12 20:08:08'),
(6,6,6,'2008-08-27', '2008-08-13 20:08:08'),
(10,10,10,'2008-08-28', '2008-08-14 20:08:08'),
(10,10,10,'2008-08-28', '2008-08-14 20:08:08'),
(10,10,10,'2008-08-28', '2008-08-14 20:08:08'),
(10,10,10,'2008-08-28', '2008-08-14 20:08:08'),
(10,10,10,'2008-08-28', '2008-08-14 20:08:08'),
(10,10,10,'2008-08-28', '2008-08-14 20:08:08'),
(10,10,10,'2008-08-28', '2008-08-14 20:08:08'));

ANALYZE TRUNCATE STATISTICS;

analyze table T_PALLAS_STATISTICS_001 compute statistics;

SELECT tableName, columnName, numRows, distinctCount, min
	, max, nullCount, avgLen, maxLen, histogram
FROM LDB_INFO_SCHEMA.TABLE_STATS
WHERE tableName = 'T_PALLAS_STATISTICS_001';

alter table T_PALLAS_STATISTICS_001 rename to T_PALLAS_STATISTICS_002;

SELECT "tableName", "columnName", "numRows", "distinctCount", "nullCount"
	, "avgLen", "maxLen", "histogram"
FROM LDB_INFO_SCHEMA.TABLE_STATS
WHERE "tableName" = 'T_PALLAS_STATISTICS_002'
ORDER BY "tableName", "columnName";

ANALYZE TRUNCATE STATISTICS;

analyze table T_PALLAS_STATISTICS_002 compute statistics;

alter table T_PALLAS_STATISTICS_002 add column c1 smallint;

SELECT "tableName", "columnName", "numRows", "distinctCount", "nullCount"
	, "avgLen", "maxLen", "histogram"
FROM LDB_INFO_SCHEMA.TABLE_STATS
WHERE "tableName" = 'T_PALLAS_STATISTICS_002'
ORDER BY "tableName", "columnName";

ANALYZE TABLE t_pallas_statistics_1 DELETE STATISTICS;

SELECT "tableName", "columnName", "numRows", "distinctCount", "nullCount"
	, "avgLen", "maxLen", "histogram"
FROM LDB_INFO_SCHEMA.TABLE_STATS
WHERE "tableName" = 'T_PALLAS_STATISTICS_002'
ORDER BY "tableName", "columnName";

