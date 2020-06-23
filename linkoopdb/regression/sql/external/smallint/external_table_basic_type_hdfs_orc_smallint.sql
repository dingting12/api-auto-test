--    Description: smallint边界值测试,smallint的数据范围为-32,768/32,767
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external orc格式

set echo on 

-- 测试smallint边界值±1，超过smallint范围的double,以及超出smallint范围的varchar类型数字
drop table if exists t_external_hdfs_orc_small_001;
drop table if exists t_external_hdfs_orc_small_002;

CREATE EXTERNAL TABLE t_external_hdfs_orc_small_001(
a1 smallint,
a2 smallint,
a3 smallint,
a4 smallint
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_orc/small1') FORMAT'orc';

select * from t_external_hdfs_orc_small_001;


-- 测试smallint的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_orc_small_002(
a1 smallint,
a2 smallint,
a3 smallint,
a4 smallint,
a5 smallint,
a6 smallint,
a7 smallint,
a8 smallint,
a9 smallint,
a10 smallint,
a11 smallint,
a12 smallint,
a13 smallint
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_orc/common1') FORMAT'orc';

select * from t_external_hdfs_orc_small_002;