--    Description: int边界值测试,int的数值范围是-2,147,483,648/2,147,483,647
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external parquet格式

set echo on 

-- 测试smallint边界值±1，超过smallint范围的double,以及超出smallint范围的varchar类型数字
drop table if exists t_external_hdfs_parquet_int_001;
drop table if exists t_external_hdfs_parquet_int_002;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_int_001(
a1 int,
a2 int,
a3 int,
a4 int
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/int1') FORMAT'parquet';

select * from t_external_hdfs_parquet_int_001;


-- 测试smallint的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_int_002(
a1 int,
a2 int,
a3 int,
a4 int,
a5 int,
a6 int,
a7 int,
a8 int,
a9 int,
a10 int,
a11 int,
a12 int,
a13 int
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_int_002;