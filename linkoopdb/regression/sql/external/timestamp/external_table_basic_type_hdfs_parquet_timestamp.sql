--    Description: timestamp边界值测试,timestamp的数值范围是0001-01-01 00:00:00/9999-12-31 23:59:59
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external parquet格式

set echo on

-- 删除表
drop table if exists t_external_hdfs_parquet_timestamp_001;
drop table if exists t_external_hdfs_parquet_timestamp_002;

-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_timestamp_001(
a1 timestamp,
a2 timestamp,
a3 timestamp,
a4 timestamp,
a5 timestamp,
a6 timestamp,
a7 timestamp,
a8 timestamp
)
LOCATION ('HDFSRPC_URL/timestamp1_parquet') FORMAT'parquet';

select * from t_external_hdfs_parquet_timestamp_001;



-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_timestamp_002(
a1 timestamp,
a2 timestamp,
a3 timestamp,
a4 timestamp,
a5 timestamp,
a6 timestamp,
a7 timestamp,
a8 timestamp,
a9 timestamp,
a10 timestamp,
a11 timestamp,
a12 timestamp,
a13 timestamp
)
LOCATION ('HDFSRPC_URL/common_timestamp_parquet') FORMAT'parquet';

select * from t_external_hdfs_parquet_timestamp_002;