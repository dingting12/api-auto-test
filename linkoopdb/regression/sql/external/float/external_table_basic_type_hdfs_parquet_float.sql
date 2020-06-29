--    hdfs external parquet格式
--    Description: smallint边界值测试,smallint的数据范围为-32,768/32,767
--    Date:         2020-05-28
--    Author:       丁婷

set echo on

-- 测试float边界值±1，有效位数
drop table if exists t_external_hdfs_parquet_float_001;
drop table if exists t_external_hdfs_parquet_float_002;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_float_001(
a1 float,
a2 float,
a3 float,
a4 float,
a5 float,
a6 float,
a7 float
)
LOCATION ('HDFSRPC_URL/float1_parquet') FORMAT'parquet';

select * from t_external_hdfs_parquet_float_001;


-- 测试smallint的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_float_002(
a1 float,
a2 float,
a3 float,
a4 float,
a5 float,
a6 float,
a7 float,
a8 float,
a9 float,
a10 float,
a11 float,
a12 float,
a13 float
)
LOCATION ('HDFSRPC_URL/common_parquet') FORMAT'parquet';

select * from t_external_hdfs_parquet_float_002;


