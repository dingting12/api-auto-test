--    Description: int边界值测试,int的数值范围是-2,147,483,648/2,147,483,647
--    Date:         2020-05-28
--    Author:       丁婷
--    hdfs external orc格式

set echo on


-- 测试int边界值±1，超过int范围的double,以及超出int范围的varchar类型数字
drop table if exists t_external_hdfs_orc_int_001;
drop table if exists t_external_hdfs_orc_int_002;

CREATE EXTERNAL TABLE t_external_hdfs_orc_int_001(
a1 int,
a2 int,
a3 int,
a4 int
)
LOCATION ('HDFSRPC_URL/int1_orc') FORMAT 'orc';

select * from t_external_hdfs_orc_int_001;


-- 测试int的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_orc_int_002(
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
LOCATION ('HDFSRPC_URL/common_int_orc') FORMAT 'orc';

select * from t_external_hdfs_orc_int_002;