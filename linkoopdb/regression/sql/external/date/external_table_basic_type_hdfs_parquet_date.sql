--    Description: date边界值测试,date的数值范围是0001-01-01/9999-12-31
--    Date:         2020-06-23
--    Author:       丁婷

set echo on 

-- hdfs external parquet 

-- 删除表
drop table if exists t_external_hdfs_parquet_date_001;
drop table if exists t_external_hdfs_parquet_date_002;

-- 测试异常值以及其他数据类型
CREATE EXTERNAL TABLE t_external_hdfs_parquet_date_001(
a1 date,
a2 date,
a3 date,
a4 date,
a5 date,
a6 date,
a7 date
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/date1') FORMAT'parquet';

select * from t_external_hdfs_parquet_date_001;

-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_date_002(
a1 date,
a2 date,
a3 date,
a4 date,
a5 date,
a6 date,
a7 date,
a8 date,
a9 date,
a10 date,
a11 date,
a12 date,
a13 date
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_date_002;