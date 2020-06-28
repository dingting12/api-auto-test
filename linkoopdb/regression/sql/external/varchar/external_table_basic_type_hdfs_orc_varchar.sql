
--    Description: varchar边界值测试,varchar的范围64000
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external orc 
set echo on 

-- 删除表
drop table if exists t_external_hdfs_orc_varchar_001;
drop table if exists t_external_hdfs_orc_varchar_002;
drop table if exists t_external_hdfs_orc_varchar_003;
drop table if exists t_external_hdfs_orc_varchar_004;

-- 测试创建长度大于64000,创建报错
create external table t_external_hdfs_orc_varchar_001(
a1 varchar(64001)
)location('hdfs://node73:8020/user/testdb73/external_file/type_orc/varchar1')
FORMAT 'orc';

-- 测试长度为64000，数据大小为100000
create external table t_external_hdfs_orc_varchar_002(
a1 varchar(10) 
)location('hdfs://node73:8020/user/testdb73/external_file/type_orc/char2')
FORMAT 'orc';

-- 返回10个字符
select * from t_external_hdfs_orc_varchar_002;



CREATE EXTERNAL TABLE t_external_hdfs_orc_varchar_003(
a1 varchar(30),
a2 varchar(30),
a3 varchar(30),
a4 varchar(30),
a5 varchar(30)
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_orc/char1') FORMAT 'orc';

select * from t_external_hdfs_orc_char_003;


-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_orc_varchar_004(
a1 varchar(30),
a2 varchar(30),
a3 varchar(30),
a4 varchar(30),
a5 varchar(30),
a6 varchar(30),
a7 varchar(30),
a8 varchar(30),
a9 varchar(30),
a10 varchar(30),
a11 varchar(30),
a12 varchar(30),
a13 varchar(30)
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_orc/common1') FORMAT'orc';

select * from t_external_hdfs_orc_varchar_004;

