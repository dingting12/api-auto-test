--    Description: 测试Node(shard) status monitoring(basic)
--    Date:         2020-07-02
--    Author:       丁婷

set echo on

SELECT DOMAIN,PORT,STATE,ALIGN_SHARD_NUM,HOST,STORAGE_PATH FROM INFORMATION_SCHEMA.storage_nodes ORDER BY port;

DROP TABLE T_PALLAS_NODEMONITOR_001 IF EXISTS CASCADE;

CREATE TABLE T_PALLAS_NODEMONITOR_001(
id int,
name varchar(200),
sal double
)engine pallas;

INSERT INTO T_PALLAS_NODEMONITOR_001 VALUES
(1,'qq',12.32),
(2,'aa',34.454);

SELECT shard_dup_num FROM INFORMATION_SCHEMA.storage_tables
WHERE table_name='T_PALLAS_NODEMONITOR_001';

SELECT count(*) FROM INFORMATION_SCHEMA.storage_shards
WHERE table_name='T_PALLAS_NODEMONITOR_001';


SELECT host,port FROM INFORMATION_SCHEMA.storage_shards
WHERE table_name='T_PALLAS_NODEMONITOR_001' order by port;
