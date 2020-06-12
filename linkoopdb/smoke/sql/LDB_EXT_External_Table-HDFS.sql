--    Description: 测试外部表的hdfs，包括csv和parquet格式
--    Date:         2020-06-11
--    Author:       丁婷

-- 测试csv格式，读取一个csv和同时读取两个csv格式
drop table if exists T_External_Table_HDFS_001;
drop table if exists T_External_Table_HDFS_002;

CREATE EXTERNAL TABLE T_External_Table_HDFS_001 
inv_item_sk char(20),
inv_warehouse_sk char(20),
inv_quantity_on_hand char(20),
inv_date_sk char(20)
) LOCATION ('hdfs:///user/testdb73/external_file/inventory.csv') FORMAT 'csv' (DELIMITER ',');

select count(*) from T_External_Table_HDFS_001;

CREATE EXTERNAL TABLE T_External_Table_HDFS_002 (
c1 char(20),
c2 char(20),
c3 char(20),
c4 char(20)
) LOCATION 
('hdfs:///user/testdb73/external_file/inventory.csv,hdfs:///user/testdb73/external_file/inventory1.csv') FORMAT 'csv' (DELIMITER ',');

select count(*) from T_External_Table_HDFS_002;

-- 测试parquet格式，读取一个和同时读取两个文件
drop table if exists T_External_Table_parquet_001;
drop table if exists T_External_Table_parquet_002;

CREATE EXTERNAL TABLE T_External_Table_parquet_001 (
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
)LOCATION ('hdfs:///user/testdb73/external_file/item.parquet') FORMAT 'parquet';

select count(*) from T_External_Table_parquet_001;

CREATE EXTERNAL TABLE T_External_Table_parquet_002 (
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
)LOCATION ('hdfs:///user/testdb73/external_file/item.parquet,hdfs:///user/testdb73/external_file/item1.parquet') FORMAT 'parquet';

select count(*) from T_External_Table_parquet_002;