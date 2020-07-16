--Description: doc 9.6.1 external hdfs
--Date：2020-07-14
--Author：丁婷

drop table external_csv_001 if exists;

CREATE EXTERNAL TABLE external_csv_001(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location
('hdfs:///user/testdb73/external_file/show_csv12.csv')
format 'csv' (delimiter '|' escape '$' header 'true' NULL '!!!' quote
'@');

select * from external_csv_001 order by id;




drop table external_csv_002 if exists;

CREATE EXTERNAL TABLE external_csv_002 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs:///user/testdb73/external_file/test_doc_001.csv') FORMAT 'csv' (DELIMITER ',');

select * from external_csv_002 order by id;




drop table external_csv_003 if exists;

CREATE EXTERNAL TABLE external_csv_003 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs:///user/testdb73/external_file/test_doc_001.csv,hdfs:///user/testdb73/external_file/test_doc_002.csv') FORMAT 'csv'
(DELIMITER ',');

select * from external_csv_003 order by id;




drop table external_csv_004 if exists;

CREATE EXTERNAL TABLE external_csv_004 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs:///user/testdb73/external_file/csv_doc') FORMAT 'csv' (DELIMITER ',');

select * from external_csv_004 order by id;



drop table external_csv_005 if exists;

CREATE EXTERNAL TABLE external_csv_005 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs:///user/testdb73/external_file/csv_doc,hdfs:///user/testdb73/external_file/test_doc_001.csv') FORMAT 'csv'
(DELIMITER ',');

select * from external_csv_005 order by id;





drop table external_parquet_001 if exists;
drop table external_parquet_002 if exists;
drop table external_parquet_003 if exists;
drop table external_parquet_004 if exists;
drop table external_parquet_005 if exists;
drop table external_parquet_006 if exists;

CREATE EXTERNAL TABLE external_parquet_001 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://node73:8020/user/testdb73/external_file/doc/test1.parquet') FORMAT 'parquet';

select * from external_parquet_001 order by id;

CREATE EXTERNAL TABLE external_parquet_002 BY PARQUET('location'
:'hdfs://node73:8020/user/testdb73/external_file/doc/test1.parquet');

select * from external_parquet_002 order by id;

CREATE EXTERNAL TABLE external_parquet_003 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://node73:8020/user/testdb73/external_file/doc/parquet_test') FORMAT 'parquet' properties(
'recursiveFileLookup':'true');

select * from external_parquet_003 order by id;

CREATE EXTERNAL TABLE external_parquet_004 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://node73:8020/user/testdb73/external_file/doc/test1.parquet,hdfs://node73:8020/user/testdb73/external_file/doc/test2.parquet') FORMAT
'parquet';

select * from external_parquet_004 order by id;

CREATE EXTERNAL TABLE external_parquet_005 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://node73:8020/user/testdb73/external_file/doc/parquet_test') FORMAT 'parquet';

select * from external_parquet_005 order by id;

CREATE EXTERNAL TABLE external_parquet_006 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://node73:8020/user/testdb73/external_file/doc/parquet_test,hdfs://node73:8020/user/testdb73/external_file/doc/test1.parquet') FORMAT
'parquet';

select * from external_parquet_006 order by id;






drop table external_orc_001 if exists;
drop table external_orc_002 if exists;

CREATE EXTERNAL TABLE external_orc_001 (name VARCHAR(10), FAVORITE_COLOR VARCHAR(30),FAVORITE_NUMBERS VARCHAR(30)) LOCATION
('hdfs://node73:8020/node74/stream74/linkoopdb/data/users.orc') FORMAT 'orc';

select * from external_orc_001 order by name;

CREATE EXTERNAL TABLE external_orc_002 BY ORC('location':'hdfs://node73:8020/node74/stream74/linkoopdb/data/users.orc');

select * from external_orc_002 order by name;