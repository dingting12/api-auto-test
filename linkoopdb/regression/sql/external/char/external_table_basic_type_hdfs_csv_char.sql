--    Description: char边界值测试,char的范围64000
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external csv格式

set echo on 

--char边界值测试,char的范围64000
-- 删除t_external_hdfs_csv_char_001表
drop table if exists t_external_hdfs_csv_char_001;

-- 创建表t_external_hdfs_csv_char_001，测试创建长度大于64000,创建报错
create external table t_external_hdfs_csv_char_001(
a1 char(64001)
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_001.csv')
format 'csv' (delimiter ',');


-- 删除t_external_hdfs_csv_char_002表
drop table if exists t_external_hdfs_csv_char_002;

-- 创建表t_external_hdfs_csv_char_002，测试长度为64000，数据大小为100000
create external table t_external_hdfs_csv_char_002(
a1 char(10) 
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_001.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_002的数据,实际返回100000
select * from t_external_hdfs_csv_char_002;


-- 删除t_external_hdfs_csv_char_003表
drop table if exists t_external_hdfs_csv_char_003;

-- 创建表t_external_hdfs_csv_char_003，测试值带双引号,"asdf",char默认长度是1
create external table t_external_hdfs_csv_char_003(
a1 char(20)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_003的数据，实际返回asdf
select * from t_external_hdfs_csv_char_003;


-- 删除t_external_hdfs_csv_char_004表
drop table if exists t_external_hdfs_csv_char_004;

-- 创建表t_external_hdfs_csv_char_004，测试值为单引号，值为'asdf'
create external table t_external_hdfs_csv_char_004(
a1 char(30) 
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_004的数据,实际返回'asdf'
select * from t_external_hdfs_csv_char_004;


-- 删除t_external_hdfs_csv_char_005表
drop table if exists t_external_hdfs_csv_char_005;

-- 创建表t_external_hdfs_csv_char_005，测试值不带引号，为asdf
create external table t_external_hdfs_csv_char_005(
a1 char(30)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_005.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_005的数据,实际返回asdf
select * from t_external_hdfs_csv_char_005;

  

-- 删除t_external_hdfs_csv_char_007表
drop table if exists t_external_hdfs_csv_char_007;

-- 创建表t_external_hdfs_csv_char_007，测试varchar中文字符，值为'你好'
create external table t_external_hdfs_csv_char_007(
a1 char(30)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_007的数据,实际返回你好
select * from t_external_hdfs_csv_char_007;


-- 删除t_external_hdfs_csv_char_008表
drop table if exists t_external_hdfs_csv_char_008;

-- 创建表t_external_hdfs_csv_char_008，测试varchar中英文字符，值为'你好asdf'
create external table t_external_hdfs_csv_char_008(
a1 char(30)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_008的数据，返回值为你好asdf
select * from t_external_hdfs_csv_char_008;


-- 删除t_external_hdfs_csv_char_009表
drop table if exists t_external_hdfs_csv_char_009;

-- 创建表t_external_hdfs_csv_char_009，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_hdfs_csv_char_009(
a1 char(30)   
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_009的数据，实际返回为#$%^
select * from t_external_hdfs_csv_char_009;


-- 删除t_external_hdfs_csv_char_010表
drop table if exists t_external_hdfs_csv_char_010;

-- 创建表t_external_hdfs_csv_char_010，测试varchar中文特殊字符，值为'@#￥%……'
create external table t_external_hdfs_csv_char_010(
a1 char(30)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_010的数据，实际返回为@#￥%……
select * from t_external_hdfs_csv_char_010;

-- 删除t_external_hdfs_csv_char_011表
drop table if exists t_external_hdfs_csv_char_011;

-- 创建表t_external_hdfs_csv_char_011，测试varchar为数字，值为'123456789'
create external table t_external_hdfs_csv_char_011(
a1 char(30)   
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_007.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_011的数据，实际返回为'123456789'
select * from t_external_hdfs_csv_char_011;

-- 创建表t_external_hdfs_csv_char_012，测试date类型，时间为2020-01-01
create external table t_external_hdfs_csv_char_012(
a1 char(30)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_date.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_012的数据，实际返回为2020-05-08
select * from t_external_hdfs_csv_char_012;


-- 删除t_external_hdfs_csv_char_013表
drop table if exists t_external_hdfs_csv_char_013;

-- 创建表t_external_hdfs_csv_char_013，测试timestamp类型,时间为2020-01-01 00:00:01
create external table t_external_hdfs_csv_char_013(
a1 char(30)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_timestamp.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_013的数据，实际返回 为2020-05-08 12:19:01
select * from t_external_hdfs_csv_char_013;


-- 删除t_external_hdfs_csv_char_015表
drop table if exists t_external_hdfs_csv_char_015;

-- 创建表t_external_hdfs_csv_char_015，测试空值
create external table t_external_hdfs_csv_char_015(
a1 char(30)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_015的数据，实际返回为''
select * from t_external_hdfs_csv_char_015;
 
 
-- 删除t_external_hdfs_csv_char_016表
drop table if exists t_external_hdfs_csv_char_016;

-- 创建表t_external_hdfs_csv_char_016，测试空格 
create external table t_external_hdfs_csv_char_016(
a1 char(30)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_016的数据,实际返回为' '
select * from t_external_hdfs_csv_char_016;


-- 删除t_external_hdfs_csv_char_017表
drop table if exists t_external_hdfs_csv_char_017;

-- 创建表t_external_hdfs_csv_char_017，测试null 
create external table t_external_hdfs_csv_char_017(
a1 char(30)   
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_017的数据，实际返回为null
select * from t_external_hdfs_csv_char_017;


-- 删除t_external_hdfs_csv_char_018表
drop table if exists t_external_hdfs_csv_char_018;

-- 创建表t_external_hdfs_csv_char_018，测试NULL  
create external table t_external_hdfs_csv_char_018(
a1 char(30)   
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_018的数据，实际返回为NULL
select * from t_external_hdfs_csv_char_018;


-- 删除t_external_hdfs_csv_char_019表
drop table if exists t_external_hdfs_csv_char_019;

-- 创建表t_external_hdfs_csv_char_019，测试int类型，值为1147483647
create external table t_external_hdfs_csv_char_019(
a1 char(30)   
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_008.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_019的数据,实际返回为1147483647
select * from t_external_hdfs_csv_char_019;

-- 删除t_external_hdfs_csv_char_020表
drop table if exists t_external_hdfs_csv_char_020;

-- 创建表t_external_hdfs_csv_char_020，测试double类型，值为 1147483647.2
create external table t_external_hdfs_csv_char_020(
a1 char(30) 
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_009.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_020的数据,实际返回为 1147483647.2
select * from t_external_hdfs_csv_char_020;


-- 删除t_external_hdfs_csv_char_021表
drop table if exists t_external_hdfs_csv_char_021;

-- 创建表t_external_hdfs_csv_char_021，测试boolean类型，值为false
create external table t_external_hdfs_csv_char_021(
a1 char(30)   
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_021的数据,实际返回为false
select * from t_external_hdfs_csv_char_021;


-- 删除t_external_hdfs_csv_char_022表
drop table if exists t_external_hdfs_csv_char_022;

-- 创建表t_external_hdfs_csv_char_022，测试boolean类型，值为true
create external table t_external_hdfs_csv_char_022(
a1 char(30)  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_char_022的数据,实际返回为true
select * from t_external_hdfs_csv_char_022;