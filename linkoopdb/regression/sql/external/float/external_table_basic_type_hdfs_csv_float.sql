--    hdfs external csv格式
--    Description: smallint边界值测试,smallint的数据范围为-32,768/32,767
--    Date:         2020-06-23
--    Author:       丁婷

set echo on

--float边界值测试,float的范围-3.402823E+38 ~ -1.175494E-38, 0,1.175494E-38 ~ 3.402823E+38
-- 删除t_external_hdfs_csv_float_001表
drop table if exists t_external_hdfs_csv_float_001;

-- 创建表t_external_hdfs_csv_float_001，测试超出边界值-3.402823E+38-1
create external table t_external_hdfs_csv_float_001(
a1 float
)location('HDFSRPC_URL/float_csv/float_001.csv')
format 'csv' (delimiter ',');

--查询t_external_hdfs_csv_float_001的数据，实际返回空值
select * from t_external_hdfs_csv_float_001;


-- 删除t_external_hdfs_csv_float_002表
drop table if exists t_external_hdfs_csv_float_002;

-- 创建表t_external_hdfs_csv_float_002，测试超出边界值3.402823E+38+1
create external table t_external_hdfs_csv_float_002(
a1 float 
)location('HDFSRPC_URL/float_csv/float_002.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_002的数据，实际返回空值
select * from t_external_hdfs_csv_float_002;

-- 删除t_external_hdfs_csv_float_019表
drop table if exists t_external_hdfs_csv_float_019;

-- 创建表t_external_hdfs_csv_float_019，测试超出边界值-1.175494E-38-1E-38
create external table t_external_hdfs_csv_float_019(
a1 float 
)location('HDFSRPC_URL/float_csv/float_006.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_019的数据，实际返回空值
select * from t_external_hdfs_csv_float_019;

-- 删除t_external_hdfs_csv_float_020表
drop table if exists t_external_hdfs_csv_float_020;

-- 创建表t_external_hdfs_csv_float_020，测试超出边界值1.175494E-38-1E-38
create external table t_external_hdfs_csv_float_020(
a1 float 
)location('HDFSRPC_URL/float_csv/float_007.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_020的数据，实际返回空值
select * from t_external_hdfs_csv_float_020;

-- 删除t_external_hdfs_csv_float_003表
drop table if exists t_external_hdfs_csv_float_003;

-- 创建表t_external_hdfs_csv_float_003，测试有效位为7位，超出有效位四舍五入，值为123.1234567
create external table t_external_hdfs_csv_float_003(
a1 float
)location('HDFSRPC_URL/float_csv/float_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_003的数据，实际返回123.12345886230469
select * from t_external_hdfs_csv_float_003;


-- 删除t_external_hdfs_csv_float_004表，测试int类型，值为1147483647
drop table if exists t_external_hdfs_csv_float_004;

-- 创建表t_external_hdfs_csv_float_004
create external table t_external_hdfs_csv_float_004(
a1 float   
)location('HDFSRPC_URL/float_csv/float_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_004的数据，返回1147483648
select * from t_external_hdfs_csv_float_004;

-- 删除t_external_hdfs_csv_float_005表
drop table if exists t_external_hdfs_csv_float_005;

-- 创建表t_external_hdfs_csv_float_005，测试varchar英文字母，值为'asdf'
create external table t_external_hdfs_csv_float_005(
a1 float  
)location('HDFSRPC_URL/float_csv/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_005的数据,实际返回空值
select * from t_external_hdfs_csv_float_005;


-- 删除t_external_hdfs_csv_float_006表
drop table if exists t_external_hdfs_csv_float_006;

-- 创建表t_external_hdfs_csv_float_006，测试varchar中文字符，值为'你好'
create external table t_external_hdfs_csv_float_006(
a1 float  
)location('HDFSRPC_URL/float_csv/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_006的数据,实际返回空值
select * from t_external_hdfs_csv_float_006;


-- 删除t_external_hdfs_csv_float_007表
drop table if exists t_external_hdfs_csv_float_007;

-- 创建表t_external_hdfs_csv_float_007，测试varchar中英文字符，值为'你好asdf'
create external table t_external_hdfs_csv_float_007(
a1 float  
)location('HDFSRPC_URL/float_csv/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_007的数据,实际返回空值
select * from t_external_hdfs_csv_float_007;


-- 删除t_external_hdfs_csv_float_008表
drop table if exists t_external_hdfs_csv_float_008;

-- 创建表 t_external_hdfs_csv_float_008，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_hdfs_csv_float_008(
a1 float  
)location('HDFSRPC_URL/float_csv/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_float_008 的数据,实际返回空值
select * from t_external_hdfs_csv_float_008;


-- 删除 t_external_hdfs_csv_float_009 表
drop table if exists t_external_hdfs_csv_float_009;

-- 创建表 t_external_hdfs_csv_float_009 ，测试varfloat中文特殊字符，值为'@#￥%……'
create external table t_external_hdfs_csv_float_009(
a1 float  
)location('HDFSRPC_URL/float_csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_float_009 的数据,实际返回空值
select * from t_external_hdfs_csv_float_009;

-- 删除 t_external_hdfs_csv_float_010 表
drop table if exists t_external_hdfs_csv_float_010;

-- 创建表 t_external_hdfs_csv_float_010，测试varchar为数字，值为'123456789'
create external table t_external_hdfs_csv_float_010(
a1 float  
)location('HDFSRPC_URL/float_csv/float_005.csv')
format 'csv' (delimiter ',');

--查询 t_external_hdfs_csv_float_010 的数据,实际返回空值
select * from t_external_hdfs_csv_float_010;

-- 删除t_external_hdfs_csv_float_011表
drop table if exists t_external_hdfs_csv_float_011;

-- 创建表t_external_hdfs_csv_float_011，测试date类型，值为1111-01-01
create external table t_external_hdfs_csv_float_011(
a1 float  
)location('HDFSRPC_URL/float_csv/type_date.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_011的数据,实际返回空值
select * from t_external_hdfs_csv_float_011;


-- 删除t_external_hdfs_csv_float_012表
drop table if exists t_external_hdfs_csv_float_012;

-- 创建表t_external_hdfs_csv_float_012，测试timestamp，值为2020-01-01 12:01:01
create external table t_external_hdfs_csv_float_012(
a1 float  
)location('HDFSRPC_URL/float_csv/type_timestamp.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_012的数据,实际返回空值
select * from t_external_hdfs_csv_float_012;


-- 删除 t_external_hdfs_csv_float_013 表
drop table if exists t_external_hdfs_csv_float_013;

-- 创建表 t_external_hdfs_csv_float_013，测试boolean类型，值为false
create external table t_external_hdfs_csv_float_013(
a1 float  
)location('HDFSRPC_URL/float_csv/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_float_013 的数据,实际返回空值
select * from t_external_hdfs_csv_float_013;

-- 删除t_external_hdfs_csv_float_014表
drop table if exists t_external_hdfs_csv_float_014;

-- 创建表t_external_hdfs_csv_float_014，测试boolean类型，值为true
create external table t_external_hdfs_csv_float_014(
a1 float  
)location('HDFSRPC_URL/float_csv/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_014的数据,实际返回空值
select * from t_external_hdfs_csv_float_014;


-- 删除t_external_hdfs_csv_float_015表
drop table if exists t_external_hdfs_csv_float_015;

-- 创建表t_external_hdfs_csv_float_015，测试空值
create external table t_external_hdfs_csv_float_015(
a1 float  
)location('HDFSRPC_URL/float_csv/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_015的数据,实际返回空值
select * from t_external_hdfs_csv_float_015;
 
 
-- 删除t_external_hdfs_csv_float_016表
drop table if exists t_external_hdfs_csv_float_016;

-- 创建表t_external_hdfs_csv_float_016，测试空格 
create external table t_external_hdfs_csv_float_016(
a1 float  
)location('HDFSRPC_URL/float_csv/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_016的数据,实际返回空值
select * from t_external_hdfs_csv_float_016;


-- 删除t_external_hdfs_csv_float_017表
drop table if exists t_external_hdfs_csv_float_017;

-- 创建表t_external_hdfs_csv_float_017，测试null 
create external table t_external_hdfs_csv_float_017(
a1 float  
)location('HDFSRPC_URL/float_csv/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_017的数据,实际返回空值
select * from t_external_hdfs_csv_float_017;


-- 删除t_external_hdfs_csv_float_018表
drop table if exists t_external_hdfs_csv_float_018;

-- 创建表t_external_hdfs_csv_float_018，测试NULL  
create external table t_external_hdfs_csv_float_018(
a1 float  
)location('HDFSRPC_URL/float_csv/type_NULL1.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_float_018的数据,实际返回空值
select * from t_external_hdfs_csv_float_018;