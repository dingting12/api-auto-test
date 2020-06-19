--    Description: 测试分区，分桶，索引
--    Date:         2020-06-16
--    Author:       丁婷
set echo on


--测试分区,hdfs内部表
drop table if exists T_PARTITION_HDFS_001;

CREATE TABLE T_PARTITION_HDFS_001 (
A INT, 
B DECIMAL(10,2),
C VARCHAR(255)
) PARTITIONED BY(A, C);

INSERT INTO T_PARTITION_HDFS_001 VALUES
(1,10.2,'asd'),
(2,10.2,'asd'),
(1,10.2,'asd'),
(3,10.2,'asd');

SELECT * FROM T_PARTITION_HDFS_001 ORDER BY A;

--测试分区,hdfs外部表csv，parquet格式
drop table if exists T_PARTITION_EXTERNAL_HDFS_001;
drop table if exists T_PARTITION_EXTERNAL_HDFS_002;

CREATE EXTERNAL TABLE T_PARTITION_EXTERNAL_HDFS_001 (
tint int,
tsmallint smallint,
tbigint bigint,
treal real,
tfloat float,
tdouble double,
tdecimal decimal(10,2),
tnumeric numeric(10,4),
tdate date,
ttimestamp timestamp,
tchar char(10),
tvarchar varchar(8000)
)location('hdfs:///user/testdb73/external_file/show_csv7.csv')
format 'csv' (delimiter '|' header 'false') PARTITIONED BY(tint);


SELECT * FROM T_PARTITION_EXTERNAL_HDFS_001 ORDER BY tint;


CREATE EXTERNAL TABLE T_PARTITION_EXTERNAL_HDFS_002 (
i_item_sk char(20),
i_item_id char(20),
i_rec_start_date char(20),
i_rec_end_date char(20),
i_item_desc varchar(200),
i_current_price char(20),
i_wholesale_cost char(20),
i_brand_id char(20),
i_brand char(50),
i_class_id char(20),
i_class char(20),
i_category_id char(20),
i_category char(20),
i_manufact_id char(20),
i_manufact char(20),
i_size char(20),
i_formulation char(50),
i_color char(20),
i_units char(20),
i_container char(20),
i_manager_id char(20),
i_product_name char(20)
)LOCATION ('hdfs:///user/testdb73/external_file/item.parquet') FORMAT 'parquet' PARTITIONED BY(i_item_sk);

SELECT * FROM T_PARTITION_EXTERNAL_HDFS_002  ORDER BY i_item_sk LIMIT 10;

--测试分桶,hdfs外部表csv，parquet格式
drop table if exists T_BUCKET_EXTERNAL_HDFS_001;
drop table if exists T_BUCKET_EXTERNAL_HDFS_002;

CREATE EXTERNAL TABLE T_BUCKET_EXTERNAL_HDFS_001 (
tint int,
tsmallint smallint,
tbigint bigint,
treal real,
tfloat float,
tdouble double,
tdecimal decimal(10,2),
tnumeric numeric(10,4),
tdate date,
ttimestamp timestamp,
tchar char(10),
tvarchar varchar(8000)
)location('hdfs:///user/testdb73/external_file/show_csv7.csv')
format 'csv' (delimiter '|' header 'false') CLUSTERED BY (tint) INTO 4 BUCKETS;


SELECT * FROM T_BUCKET_EXTERNAL_HDFS_001 ORDER BY tint;


CREATE EXTERNAL TABLE T_BUCKET_EXTERNAL_HDFS_002 (
i_item_sk char(20),
i_item_id char(20),
i_rec_start_date char(20),
i_rec_end_date char(20),
i_item_desc varchar(200),
i_current_price char(20),
i_wholesale_cost char(20),
i_brand_id char(20),
i_brand char(50),
i_class_id char(20),
i_class char(20),
i_category_id char(20),
i_category char(20),
i_manufact_id char(20),
i_manufact char(20),
i_size char(20),
i_formulation char(50),
i_color char(20),
i_units char(20),
i_container char(20),
i_manager_id char(20),
i_product_name char(20)
)LOCATION ('hdfs:///user/testdb73/external_file/item.parquet') FORMAT 'parquet' CLUSTERED BY (i_item_sk) INTO 10 BUCKETS;

SELECT * FROM T_BUCKET_EXTERNAL_HDFS_002  ORDER BY i_item_sk LIMIT 10;