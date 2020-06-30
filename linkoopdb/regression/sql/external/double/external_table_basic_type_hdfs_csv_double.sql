--    Description: double边界值测试,double的范围-1.79769313486231E+308,-2.22507385850720E-308, 0,2.22507385850720E-308 ~ 1.79769313486231E+308
--    Date:         2020-05-28
--    Author:       丁婷
--    hdfs external csv格式

set echo on

-- 删除t_external_hdfs_csv_double_001表
drop table if exists t_external_hdfs_csv_double_001;

-- 创建表t_external_hdfs_csv_double_001，测试超出边界值-1.79769313486231E+308-1
create external table t_external_hdfs_csv_double_001(
a1 double
)location('HDFSRPC_URL/double_csv/real_001.csv')
format 'csv' (delimiter ',');

-- 查询t_external_hdfs_csv_double_001，应报错,实际返回空值
SELECT * FROM t_external_hdfs_csv_double_001;

-- 删除t_external_hdfs_csv_double_002表
drop table if exists t_external_hdfs_csv_double_002;

-- 创建表t_external_hdfs_csv_double_002，测试超出边界值1.79769313486231E+308+1
create external table t_external_hdfs_csv_double_002(
a1 double 
)location('HDFSRPC_URL/double_csv/real_002.csv')
format 'csv' (delimiter ',');

  -- 查询t_external_hdfs_csv_double_002，应报错,实际返回空值
SELECT * FROM t_external_hdfs_csv_double_002;


-- 删除t_external_hdfs_csv_double_019表
drop table if exists t_external_hdfs_csv_double_019;

-- 创建表t_external_hdfs_csv_double_019，测试超出边界值 -2.22507385850720E-308-1E-308
create external table t_external_hdfs_csv_double_019(
a1 double
)location('HDFSRPC_URL/double_csv/real_006.csv')
format 'csv' (delimiter ',');

-- 查询t_external_hdfs_csv_double_019，应报错,实际返回空值
SELECT * FROM t_external_hdfs_csv_double_019;

-- 删除t_external_hdfs_csv_double_004表
drop table if exists t_external_hdfs_csv_double_020;

-- 创建表t_external_hdfs_csv_double_020，测试超出边界值2.22507385850720E-308-1E-308
create external table t_external_hdfs_csv_double_020(
a1 double 
)location('HDFSRPC_URL/double_csv/real_007.csv')
format 'csv' (delimiter ',');

  -- 查询t_external_hdfs_csv_double_020，应报错,实际返回空值
SELECT * FROM t_external_hdfs_csv_double_020;

-- 删除t_external_hdfs_csv_double_003表
drop table if exists t_external_hdfs_csv_double_003;

-- 创建表t_external_hdfs_csv_double_003，测试有效位为15位，超出有效位四舍五入，值为123.12345678912391
create external table t_external_hdfs_csv_double_003(
a1 double
)location('HDFSRPC_URL/double_csv/real_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_003的数据,实际返回123.1234567891239
select * from t_external_hdfs_csv_double_003;


-- 删除t_external_hdfs_csv_double_004表，测试int类型，值为1147483647
drop table if exists t_external_hdfs_csv_double_004;

-- 创建表t_external_hdfs_csv_double_004
create external table t_external_hdfs_csv_double_004(
a1 double   
)location('HDFSRPC_URL/double_csv/real_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_004的数据，返回1147483647
select * from t_external_hdfs_csv_double_004;

-- 删除t_external_hdfs_csv_double_005表
drop table if exists t_external_hdfs_csv_double_005;

-- 创建表t_external_hdfs_csv_double_005，测试varchar英文字母，值为'asdf'
create external table t_external_hdfs_csv_double_005(
a1 double  
)location('HDFSRPC_URL/double_csv/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_005的数据,实际返回空值
select * from t_external_hdfs_csv_double_005;


-- 删除t_external_hdfs_csv_double_006表
drop table if exists t_external_hdfs_csv_double_006;

-- 创建表t_external_hdfs_csv_double_006，测试varchar中文字符，值为'你好'
create external table t_external_hdfs_csv_double_006(
a1 double  
)location('HDFSRPC_URL/double_csv/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_006的数据,实际返回空值
select * from t_external_hdfs_csv_double_006;


-- 删除t_external_hdfs_csv_double_007表
drop table if exists t_external_hdfs_csv_double_007;

-- 创建表t_external_hdfs_csv_double_007，测试varchar中英文字符，值为'你好asdf'
create external table t_external_hdfs_csv_double_007(
a1 double  
)location('HDFSRPC_URL/double_csv/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_007的数据,实际返回空值
select * from t_external_hdfs_csv_double_007;


-- 删除t_external_hdfs_csv_double_008表
drop table if exists t_external_hdfs_csv_double_008;

-- 创建表 t_external_hdfs_csv_double_008，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_hdfs_csv_double_008(
a1 double  
)location('HDFSRPC_URL/double_csv/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_double_008 的数据,实际返回空值
select * from t_external_hdfs_csv_double_008;


-- 删除 t_external_hdfs_csv_double_009 表
drop table if exists t_external_hdfs_csv_double_009;

-- 创建表 t_external_hdfs_csv_double_009 ，测试vardouble中文特殊字符，值为'@#￥%……'
create external table t_external_hdfs_csv_double_009(
a1 double  
)location('HDFSRPC_URL/double_csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_double_009 的数据,实际返回空值
select * from t_external_hdfs_csv_double_009;

-- 删除 t_external_hdfs_csv_double_010 表
drop table if exists t_external_hdfs_csv_double_010;

-- 创建表 t_external_hdfs_csv_double_010，测试varchar为数字，值为'123456789'
create external table t_external_hdfs_csv_double_010(
a1 double  
)location('HDFSRPC_URL/double_csv/real_005.csv')
format 'csv' (delimiter ',');

--查询 t_external_hdfs_csv_double_010 的数据,实际返回空值
SELECT * FROM t_external_hdfs_csv_double_010;

-- 删除t_external_hdfs_csv_double_011表
drop table if exists t_external_hdfs_csv_double_011;

-- 创建表t_external_hdfs_csv_double_011，测试date类型，值为2020-05-08
create external table t_external_hdfs_csv_double_011(
a1 double  
)location('HDFSRPC_URL/double_csv/type_date.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_011的数据,实际返回空值
select * from t_external_hdfs_csv_double_011;


-- 删除t_external_hdfs_csv_double_012表
drop table if exists t_external_hdfs_csv_double_012;

-- 创建表t_external_hdfs_csv_double_012，测试timestamp，值为2020-05-08 12:19:01
create external table t_external_hdfs_csv_double_012(
a1 double  
)location('HDFSRPC_URL/double_csv/type_timestamp.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_012的数据,实际返回空值
select * from t_external_hdfs_csv_double_012;


-- 删除 t_external_hdfs_csv_double_013 表
drop table if exists t_external_hdfs_csv_double_013;

-- 创建表 t_external_hdfs_csv_double_013，测试boolean类型，值为false
create external table t_external_hdfs_csv_double_013(
a1 double  
)location('HDFSRPC_URL/double_csv/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_double_013 的数据,实际返回空值
select * from t_external_hdfs_csv_double_013;

-- 删除t_external_hdfs_csv_double_014表
drop table if exists t_external_hdfs_csv_double_014;

-- 创建表t_external_hdfs_csv_double_014，测试boolean类型，值为true
create external table t_external_hdfs_csv_double_014(
a1 double  
)location('HDFSRPC_URL/double_csv/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_014的数据,实际返回空值
select * from t_external_hdfs_csv_double_014;


-- 删除t_external_hdfs_csv_double_015表
drop table if exists t_external_hdfs_csv_double_015;

-- 创建表t_external_hdfs_csv_double_015，测试空值
create external table t_external_hdfs_csv_double_015(
a1 double  
)location('HDFSRPC_URL/double_csv/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_015的数据,实际返回空值
select * from t_external_hdfs_csv_double_015;
 
 
-- 删除t_external_hdfs_csv_double_016表
drop table if exists t_external_hdfs_csv_double_016;

-- 创建表t_external_hdfs_csv_double_016，测试空格 
create external table t_external_hdfs_csv_double_016(
a1 double  
)location('HDFSRPC_URL/double_csv/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_016的数据,实际返回空值
select * from t_external_hdfs_csv_double_016;


-- 删除t_external_hdfs_csv_double_017表
drop table if exists t_external_hdfs_csv_double_017;

-- 创建表t_external_hdfs_csv_double_017，测试null 
create external table t_external_hdfs_csv_double_017(
a1 double  
)location('HDFSRPC_URL/double_csv/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_017的数据,实际返回空值
select * from t_external_hdfs_csv_double_017;


-- 删除t_external_hdfs_csv_double_018表
drop table if exists t_external_hdfs_csv_double_018;

-- 创建表t_external_hdfs_csv_double_018，测试NULL  
create external table t_external_hdfs_csv_double_018(
a1 double  
)location('HDFSRPC_URL/double_csv/type_NULL1.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_double_018的数据,实际返回空值
select * from t_external_hdfs_csv_double_018;