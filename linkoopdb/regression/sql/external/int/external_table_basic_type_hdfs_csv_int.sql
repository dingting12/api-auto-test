--    Description: int边界值测试,int的数值范围是-2,147,483,648/2,147,483,647
--    Date:         2020-05-28
--    Author:       丁婷
--    hdfs external csv格式

set echo on 

-- 测试int类型异常值-2147483649,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_001;

create external table t_external_hdfs_csv_int_001(
a1 int  
)location('HDFSRPC_URL/int_001.csv')
format 'csv' (delimiter ',');

select * from t_external_hdfs_csv_int_001;


-- 测试samllint类型异常值2147483648,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_002;

create external table t_external_hdfs_csv_int_002(
a1 int  
)location('HDFSRPC_URL/int_002.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_002;


-- 测试超出int范围的double类型,数据为2147483648.01,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_003;

create external table t_external_hdfs_csv_int_003(
a1 int  
)location('HDFSRPC_URL/int_003.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_003;


-- 测试超出int范围的varchar类型数字，值为'2147483648',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_005;

create external table t_external_hdfs_csv_int_005(
a1 int  
)location('HDFSRPC_URL/int_005.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_005;



-- 测试varchar英文字母，值为'asdf',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_006;

create external table t_external_hdfs_csv_int_006(
a1 int  
)location('HDFSRPC_URL/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_006;


-- 测试varchar中文字符，值为'你好',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_007;

create external table t_external_hdfs_csv_int_007(
a1 int  
)location('HDFSRPC_URL/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_007;


-- 测试varchar中英文字符，值为'你好asdf',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_008;

create external table t_external_hdfs_csv_int_008(
a1 int  
)location('HDFSRPC_URL/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_008;


-- 测试varchar英文特殊字符，值为'#$%^',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_009;

create external table t_external_hdfs_csv_int_009(
a1 int  
)location('HDFSRPC_URL/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_009;


-- 测试varchar中文特殊字符，值为'@#￥%……',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_010;

create external table t_external_hdfs_csv_int_010(
a1 int  
)location('HDFSRPC_URL/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_010;



-- 测试测试date类型，值为2020-05-08,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_011;

create external table t_external_hdfs_csv_int_011(
a1 int  
)location('HDFSRPC_URL/type_date.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_011;


-- 测试timestamp类型，值为2020-05-08 12:19:01,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_012;

create external table t_external_hdfs_csv_int_012(
a1 int  
)location('HDFSRPC_URL/type_timestamp.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_012;


--测试boolean类型的true ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_013;

create external table t_external_hdfs_csv_int_013(
a1 int  
)location('HDFSRPC_URL/boolean_true.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_013;


-- 测试boolean类型的false ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_014;

create external table t_external_hdfs_csv_int_014(
a1 int  
)location('HDFSRPC_URL/boolean_false.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_014;

 
-- 测试空值,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_015;

create external table t_external_hdfs_csv_int_015(
a1 int  
)location('HDFSRPC_URL/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_015;
 
 
-- 测试空格 ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_016;

create external table t_external_hdfs_csv_int_016(
a1 int  
)location('HDFSRPC_URL/type_kongge.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_016;


-- 测试null ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_017;

create external table t_external_hdfs_csv_int_017(
a1 int  
)location('HDFSRPC_URL/type_null.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_017;


-- 测试NULL  ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_018;

create external table t_external_hdfs_csv_int_018(
a1 int  
)location('HDFSRPC_URL/type_NULL1.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_018;

