--    Description: 测试pallas create external table
--    Date:         2020-07-01
--    Author:       丁婷

set echo on
DROP SCHEMA S_PALLAS_SCHEMA_004 IF EXISTS CASCADE;

CREATE SCHEMA S_PALLAS_SCHEMA_004 engine pallas;

DROP TABLE S_PALLAS_SCHEMA_004.T_EXTERNAL_PALLAS_001 IF EXISTS CASCADE;
DROP TABLE S_PALLAS_SCHEMA_004.T_EXTERNAL_PALLAS_002 IF EXISTS CASCADE;

CREATE EXTERNAL TABLE S_PALLAS_SCHEMA_004.T_EXTERNAL_PALLAS_001(
   id INT,
   name VARCHAR(200),
   desc1 VARCHAR(200),
   desc2 VARCHAR(200)
)location ('/user/testdb73/external_file/test_split/diffengine_test1.csv') format 'csv' (delimiter '|');


show CREATE TABLE S_PALLAS_SCHEMA_004.T_EXTERNAL_PALLAS_001;

SELECT * FROM S_PALLAS_SCHEMA_004.T_EXTERNAL_PALLAS_001 ORDER BY id;

CREATE TABLE S_PALLAS_SCHEMA_004.T_EXTERNAL_PALLAS_002 AS 
(SELECT * FROM S_PALLAS_SCHEMA_004.T_EXTERNAL_PALLAS_001) WITH DATA;

SELECT * FROM S_PALLAS_SCHEMA_004.T_EXTERNAL_PALLAS_002 ORDER BY id;

show CREATE TABLE S_PALLAS_SCHEMA_004.T_EXTERNAL_PALLAS_002;