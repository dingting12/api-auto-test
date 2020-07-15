--Description: doc 9.6.1 external hdfs
--Date：2020-07-14
--Author：丁婷

CREATE EXTERNAL TABLE external_csv(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location
('hdfs://node1:8020/node4/linkoopdb/testdb/externalTable/show_csv12.csv')
format 'csv' (delimiter '|' escape '$' header 'true' NULL '!!!' quote
'@');


CREATE EXTERNAL TABLE TABLE1 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/test1.csv') FORMAT 'csv' (DELIMITER ',');

CREATE EXTERNAL TABLE TABLE1 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/test1.csv,hdfs://host:port/test2.csv') FORMAT 'csv'
(DELIMITER ',');

CREATE EXTERNAL TABLE TABLE1 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/csv_test') FORMAT 'csv' (DELIMITER ',');

CREATE EXTERNAL TABLE TABLE1 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/csv_test,hdfs://host:port/test1.csv') FORMAT 'csv'
(DELIMITER ',');



--写法一
CREATE EXTERNAL TABLE TABLE2 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/test1.parquet') FORMAT 'parquet';
--写法二
CREATE EXTERNAL TABLE TABLE2 BY PARQUET('location'
:'hdfs://host:port/test1.parquet');

CREATE EXTERNAL TABLE TABLE2 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/dir') FORMAT 'parquet' properties(
'recursiveFileLookup':'true');

CREATE EXTERNAL TABLE TABLE2 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/test1.parquet,hdfs://host:port/test2.parquet') FORMAT
'parquet';
CREATE EXTERNAL TABLE TABLE2 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/parquet_test') FORMAT 'parquet';
CREATE EXTERNAL TABLE TABLE2 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/parquet_test,hdfs://host:port/test1.parquet') FORMAT
'parquet';

CREATE EXTERNAL TABLE TABLE2 (ID INT, NAME VARCHAR(10)) LOCATION
('hdfs://host:port/test1.orc') FORMAT 'orc';

CREATE EXTERNAL TABLE TABLE2 BY ORC('location'
:'hdfs://host:port/test1.orc')