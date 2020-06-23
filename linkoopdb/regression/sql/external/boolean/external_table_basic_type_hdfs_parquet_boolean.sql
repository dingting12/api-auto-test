--    Description: boolean边界值测试,boolean的范围true/false
--    Date:         2020-06-23
--    Author:       丁婷
-- hdfs external parquet

set echo on 

-- 测试boolean的varchar，date,timestamp,boolean以及''等异常值
drop table if exists t_external_hdfs_parquet_boolean_001;
drop table if exists t_external_hdfs_parquet_boolean_002;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_boolean_001(
a1 boolean,
a2 boolean,
a3 boolean,
a4 boolean,
a5 boolean,
a6 boolean,
a7 boolean,
a8 boolean,
a9 boolean,
a10 boolean,
a11 boolean,
a12 boolean,
a13 boolean
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_boolean_001;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_boolean_002(
a1 boolean,
a2 boolean,
a3 boolean,
a4 boolean,
a5 boolean,
a6 boolean,
a7 boolean,
a8 boolean,
a9 boolean,
a10 boolean,
a11 boolean,
a12 boolean
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/boolean1') FORMAT'parquet';

select * from t_external_hdfs_parquet_boolean_002;