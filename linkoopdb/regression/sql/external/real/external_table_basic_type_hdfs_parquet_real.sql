--    Description: real边界值测试,double的范围-1.79769313486231E+308,-2.22507385850720E-308, 0,2.22507385850720E-308 ~ 1.79769313486231E+308
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external parquet格式

set echo on

-- 测试float边界值±1，有效位数
drop table if exists t_external_hdfs_parquet_real_001;
drop table if exists t_external_hdfs_parquet_real_002;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_real_001(
a1 real,
a2 real,
a3 real,
a4 real,
a5 real,
a6 real
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/real1') FORMAT'parquet';

select * from t_external_hdfs_parquet_real_001;


-- 测试smallint的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_real_002(
a1 real,
a2 real,
a3 real,
a4 real,
a5 real,
a6 real,
a7 real,
a8 real,
a9 real,
a10 real,
a11 real,
a12 real,
a13 real
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_real_002;