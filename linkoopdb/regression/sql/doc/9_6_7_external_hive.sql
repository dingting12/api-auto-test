--Description: doc 9.6.7 external hive
--Date：2020-07-14
--Author：丁婷


drop table HIVE_1 if exists;

CREATE EXTERNAL TABLE HIVE_1 (
COLUMN1 INT,
COLUMN2 VARCHAR(20) 
) FORMAT 'HIVE' PROPERTIES ('table':'hive_test_001');

select * from HIVE_1 order by COLUMN1;

drop table HIVE_TEST1 if exists;
drop table HIVE_TEST2 if exists;

CREATE EXTERNAL TABLE HIVE_TEST1 BY HIVE('table':'default.hive_table_1');

select * from HIVE_TEST1 order by COLUMN1 ;

CREATE EXTERNAL TABLE HIVE_TEST2 BY HIVE('table':'gcy_test.hive_table_2');

select * from HIVE_TEST2 order by COLUMN1;