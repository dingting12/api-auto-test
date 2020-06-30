
--    Description: varchar边界值测试,varchar的范围64000
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external csv格式

set echo on 

-- 删除t_external_hdfs_csv_varchar_001表
drop table if exists t_external_hdfs_csv_varchar_001;

-- 创建表t_external_hdfs_csv_varchar_001，测试创建长度大于64000，实际创建成功
create external table t_external_hdfs_csv_varchar_001(
a1 varchar(64001)
)location('HDFSRPC_URL/varchar_csv/varchar_001.csv')
format 'csv' (delimiter ',');


-- 删除t_external_hdfs_csv_varchar_002表
drop table if exists t_external_hdfs_csv_varchar_002;

-- 创建表t_external_hdfs_csv_varchar_002，测试长度为64000，数据大小为100000，使用成功
create external table t_external_hdfs_csv_varchar_002(
a1 varchar(64000) 
)location('HDFSRPC_URL/varchar_csv/varchar_001.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_002的数据
select length(a1) from t_external_hdfs_csv_varchar_002;


-- 删除t_external_hdfs_csv_varchar_003表
drop table if exists t_external_hdfs_csv_varchar_003;

-- 创建表t_external_hdfs_csv_varchar_003，测试值带双引号,"asdf"
create external table t_external_hdfs_csv_varchar_003(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/varchar_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_003的数据,实际结果返回asdf
select * from t_external_hdfs_csv_varchar_003;


-- 删除t_external_hdfs_csv_varchar_004表
drop table if exists t_external_hdfs_csv_varchar_004;

-- 创建表t_external_hdfs_csv_varchar_004，测试值为单引号，值为'asdf'
create external table t_external_hdfs_csv_varchar_004(
a1 varchar(30)   
)location('HDFSRPC_URL/varchar_csv/varchar_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_004的数据,返回结果为'asdf'
select * from t_external_hdfs_csv_varchar_004;


-- 删除t_external_hdfs_csv_varchar_005表
drop table if exists t_external_hdfs_csv_varchar_005;

-- 创建表t_external_hdfs_csv_varchar_005，测试值不带引号，为asdf
create external table t_external_hdfs_csv_varchar_005(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/varchar_005.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_005的数据,实际返回结果为asdf
select * from t_external_hdfs_csv_varchar_005;



-- 删除t_external_hdfs_csv_varchar_007表
drop table if exists t_external_hdfs_csv_varchar_007;

-- 创建表t_external_hdfs_csv_varchar_007，测试varvarchar中文字符，值为'你好'
create external table t_external_hdfs_csv_varchar_007(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_007的数据,实际返回你好
select * from t_external_hdfs_csv_varchar_007;


-- 删除t_external_hdfs_csv_varchar_008表
drop table if exists t_external_hdfs_csv_varchar_008;

-- 创建表t_external_hdfs_csv_varchar_008，测试varvarchar中英文字符，值为'你好asdf'
create external table t_external_hdfs_csv_varchar_008(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_008的数据，返回值为你好asdf
select * from t_external_hdfs_csv_varchar_008;


-- 删除t_external_hdfs_csv_varchar_009表
drop table if exists t_external_hdfs_csv_varchar_009;

-- 创建表t_external_hdfs_csv_varchar_009，测试varvarchar英文特殊字符，值为'#$%^'
create external table t_external_hdfs_csv_varchar_009(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_009的数据，实际返回为#$%^
select * from t_external_hdfs_csv_varchar_009;


-- 删除t_external_hdfs_csv_varchar_010表
drop table if exists t_external_hdfs_csv_varchar_010;

-- 创建表t_external_hdfs_csv_varchar_010，测试varvarchar中文特殊字符，值为'@#￥%……'
create external table t_external_hdfs_csv_varchar_010(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_010的数据，实际返回为@#￥%……
select * from t_external_hdfs_csv_varchar_010;

-- 删除t_external_hdfs_csv_varchar_011表
drop table if exists t_external_hdfs_csv_varchar_011;

-- 创建表t_external_hdfs_csv_varchar_011，测试varchar为数字，值为'123456789'
create external table t_external_hdfs_csv_varchar_011(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/varchar_007.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_011的数据，实际返回为'123456789'
select * from t_external_hdfs_csv_varchar_011;

drop table if exists t_external_hdfs_csv_varchar_012;
-- 创建表t_external_hdfs_csv_varchar_012，测试date类型，时间为2020-05-08
create external table t_external_hdfs_csv_varchar_012(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/type_date.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_012的数据，实际返回为2020-05-08
select * from t_external_hdfs_csv_varchar_012;


-- 删除t_external_hdfs_csv_varchar_013表
drop table if exists t_external_hdfs_csv_varchar_013;

-- 创建表t_external_hdfs_csv_varchar_013，测试timestamp类型,时间为2020-01-01 00:00:01
create external table t_external_hdfs_csv_varchar_013(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/type_timestamp.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_013的数据，实际返回 为2020-05-08 12:19:01
select * from t_external_hdfs_csv_varchar_013;


-- 删除t_external_hdfs_csv_varchar_015表
drop table if exists t_external_hdfs_csv_varchar_015;

-- 创建表t_external_hdfs_csv_varchar_015，测试空值
create external table t_external_hdfs_csv_varchar_015(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_015的数据，实际返回为''
select * from t_external_hdfs_csv_varchar_015;
 
 
-- 删除t_external_hdfs_csv_varchar_016表
drop table if exists t_external_hdfs_csv_varchar_016;

-- 创建表t_external_hdfs_csv_varchar_016，测试空格 
create external table t_external_hdfs_csv_varchar_016(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_016的数据,实际返回为' '
select * from t_external_hdfs_csv_varchar_016;


-- 删除t_external_hdfs_csv_varchar_017表
drop table if exists t_external_hdfs_csv_varchar_017;

-- 创建表t_external_hdfs_csv_varchar_017，测试null 
create external table t_external_hdfs_csv_varchar_017(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_017的数据，实际返回为null
select * from t_external_hdfs_csv_varchar_017;


-- 删除t_external_hdfs_csv_varchar_018表
drop table if exists t_external_hdfs_csv_varchar_018;

-- 创建表t_external_hdfs_csv_varchar_018，测试NULL  
create external table t_external_hdfs_csv_varchar_018(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/type_NULL1.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_018的数据，实际返回为NULL
select * from t_external_hdfs_csv_varchar_018;


-- 删除t_external_hdfs_csv_varchar_019表
drop table if exists t_external_hdfs_csv_varchar_019;

-- 创建表t_external_hdfs_csv_varchar_019，测试int类型，值为1147483647
create external table t_external_hdfs_csv_varchar_019(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/varchar_008.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_019的数据,实际返回为1147483647
select * from t_external_hdfs_csv_varchar_019;

-- 删除t_external_hdfs_csv_varchar_020表
drop table if exists t_external_hdfs_csv_varchar_020;

-- 创建表t_external_hdfs_csv_varchar_020，测试double类型，值为 1147483647.2
create external table t_external_hdfs_csv_varchar_020(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/varchar_009.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_020的数据，实际返回为 1147483647.2
select * from t_external_hdfs_csv_varchar_020;


-- 删除t_external_hdfs_csv_varchar_021表
drop table if exists t_external_hdfs_csv_varchar_021;

-- 创建表t_external_hdfs_csv_varchar_021，测试boolean类型，值为false
create external table t_external_hdfs_csv_varchar_021(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_021的数据，实际返回为false
select * from t_external_hdfs_csv_varchar_021;


-- 删除t_external_hdfs_csv_varchar_022表
drop table if exists t_external_hdfs_csv_varchar_022;

-- 创建表t_external_hdfs_csv_varchar_022，测试boolean类型，值为true
create external table t_external_hdfs_csv_varchar_022(
a1 varchar(30)  
)location('HDFSRPC_URL/varchar_csv/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_varchar_022的数据,实际返回为true
select * from t_external_hdfs_csv_varchar_022;

-- 删除 t_external_hdfs_csv_varchar_023 表
drop table if exists t_external_hdfs_csv_varchar_023;

-- 创建表 t_external_hdfs_csv_varchar_023，测试长度为10，字符长度为20
create external table t_external_hdfs_csv_varchar_023(
a1 varchar(10)
)location('HDFSRPC_URL/varchar_csv/varchar_002.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_varchar_023 的数据,实际返回1234567890
select * from t_external_hdfs_csv_varchar_023;