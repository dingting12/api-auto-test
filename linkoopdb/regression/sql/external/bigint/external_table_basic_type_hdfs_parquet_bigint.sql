--    Description: bigint边界值测试,bigint的数值范围是-9223372036854775808/9223372036854775807
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external parquet格式

set echo on 

-- 测试bigint边界值±1，超过bigint范围的double,以及超出bigint范围的varchar类型数字
drop table if exists t_external_hdfs_parquet_bigint_001;
drop table if exists t_external_hdfs_parquet_bigint_002;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_bigint_001(
a1 bigint,
a2 bigint,
a3 bigint,
a4 bigint
)
LOCATION ('HDFSRPC_URL/bigint_parquet') FORMAT 'parquet';

select * from t_external_hdfs_parquet_bigint_001;


-- 测试smallint的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_bigint_002(
a1 bigint,
a2 bigint,
a3 bigint,
a4 bigint,
a5 bigint,
a6 bigint,
a7 bigint,
a8 bigint,
a9 bigint,
a10 bigint,
a11 bigint,
a12 bigint,
a13 bigint
)
LOCATION ('HDFSRPC_URL/common_bigint_parquet') FORMAT'parquet';

select * from t_external_hdfs_parquet_bigint_002;

