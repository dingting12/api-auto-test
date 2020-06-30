--    Description: double边界值测试,double的范围-1.79769313486231E+308,-2.22507385850720E-308, 0,2.22507385850720E-308 ~ 1.79769313486231E+308
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external orc格式

set echo on

-- 测试double边界值±1，有效位数
drop table if exists t_external_hdfs_orc_double_001;
drop table if exists t_external_hdfs_orc_double_002;

CREATE EXTERNAL TABLE t_external_hdfs_orc_double_001(
a1 double,
a2 double,
a3 double,
a4 double,
a5 double,
a6 double
)
LOCATION ('HDFSRPC_URL/double1_orc') FORMAT 'orc';

select * from t_external_hdfs_orc_double_001;


-- 测试smallint的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_orc_double_002(
a1 double,
a2 double,
a3 double,
a4 double,
a5 double,
a6 double,
a7 double,
a8 double,
a9 double,
a10 double,
a11 double,
a12 double,
a13 double
)
LOCATION ('HDFSRPC_URL/common_double_orc') FORMAT 'orc';

select * from t_external_hdfs_orc_double_002;