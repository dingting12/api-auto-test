--Description: doc 9.6.7 external hive
--Date：2020-07-14
--Author：丁婷

例:
CREATE EXTERNAL TABLE HIVE_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) ) FORMAT 'HIVE' PROPERTIES ('table':'LINKOOPDB_TABLE');
例：其中DEFAULT和ttt分别为HIVE中的两个DATABASE。
CREATE EXTERNAL TABLE TEST1 BY HIVE('table':'DEFAULT.HIVE_TABLE_1');
CREATE EXTERNAL TABLE TEST2 BY HIVE('table':'ttt.HIVE_TABLE_2');