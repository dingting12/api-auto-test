--    Description: char边界值测试,char的范围64000
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external orc格式

set echo on

-- 删除表
drop table if exists t_external_hdfs_orc_char_001;
drop table if exists t_external_hdfs_orc_char_002;
drop table if exists t_external_hdfs_orc_char_003;
drop table if exists t_external_hdfs_orc_char_004;

-- 测试创建长度大于64000,创建报错
create external table t_external_hdfs_orc_char_001(
a1 char(64001)
)location('HDFSRPC_URL/char1_orc')
FORMAT 'orc';

-- 测试长度为10，数据大小为20
create external table t_external_hdfs_orc_char_002(
a1 char(10) 
)location('HDFSRPC_URL/char2_orc')
FORMAT 'orc';

-- 返回10个字符
select * from t_external_ldbdist_csv_char_002;



CREATE EXTERNAL TABLE t_external_hdfs_orc_char_003(
a1 char(30),
a2 char(30),
a3 char(30),
a4 char(30),
a5 char(30)
)
LOCATION ('HDFSRPC_URL/char1_orc') FORMAT 'orc';

select * from t_external_hdfs_orc_char_003;


-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_orc_char_004(
a1 char(30),
a2 char(30),
a3 char(30),
a4 char(30),
a5 char(30),
a6 char(30),
a7 char(30),
a8 char(30),
a9 char(30),
a10 char(30),
a11 char(30),
a12 char(30),
a13 char(30)
)
LOCATION ('HDFSRPC_URL/common_orc') FORMAT 'orc';

select * from t_external_hdfs_orc_char_004;