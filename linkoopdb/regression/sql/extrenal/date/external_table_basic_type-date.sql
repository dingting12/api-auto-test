loaddriver E:\pycharmProject\driver\linkoopdb-jdbc-2.2.2.jar com.datapps.linkoopdb.jdbc.JdbcDriver
connect admin/123456@jdbc:linkoopdb:tcp://192.168.1.73:9105/ldb
set echo on


--    Description: date边界值测试,date的数值范围是0001-01-01/9999-12-31
--    Date:         2020-05-28
--    Author:       丁婷
--    hdfs external csv格式

-- 测试date类型边界异常值0001-01-00,实际结果是返回空值
drop table if exists t_external_hdfs_csv_date_001;

create external table t_external_hdfs_csv_date_001(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_001.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_date_001;


-- 测试date类型边界异常值10000-01-01,实际结果是返回空值
drop table if exists t_external_hdfs_csv_date_002;

create external table t_external_hdfs_csv_date_002(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_002.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_date_002;


-- 测试int类型，值为1234567,实际结果是返回空值
drop table if exists t_external_hdfs_csv_date_003;

create external table t_external_hdfs_csv_date_003(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_003.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_date_003;


--测试double类型，值为54775807.111,实际结果是返回空值
drop table if exists t_external_hdfs_csv_date_004;

create external table t_external_hdfs_csv_date_004(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_004.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_date_004;


-- 测试varchar类型数字，值为'9223372036',实际结果是返回空值
drop table if exists t_external_hdfs_csv_date_005;

-- 创建表t_external_hdfs_csv_date_005，
create external table t_external_hdfs_csv_date_005(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_005.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_date_005;



--测试varchar英文字母，值为'asdf',实际结果是返回空值
drop table if exists t_external_hdfs_csv_date_006;

-- 创建表t_external_hdfs_csv_date_006，
create external table t_external_hdfs_csv_date_006(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_006的数据
select * from t_external_hdfs_csv_date_006;


-- 删除t_external_hdfs_csv_date_007表
drop table if exists t_external_hdfs_csv_date_007;

-- 创建表t_external_hdfs_csv_date_007，测试varchar中文字符，值为'你好'
create external table t_external_hdfs_csv_date_007(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_007的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_007;


-- 删除t_external_hdfs_csv_date_008表
drop table if exists t_external_hdfs_csv_date_008;

-- 创建表t_external_hdfs_csv_date_008，测试varchar中英文字符，值为'你好asdf'
create external table t_external_hdfs_csv_date_008(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_008的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_008;


-- 删除t_external_hdfs_csv_date_009表
drop table if exists t_external_hdfs_csv_date_009;

-- 创建表t_external_hdfs_csv_date_009，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_hdfs_csv_date_009(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_009的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_009;


-- 删除t_external_hdfs_csv_date_010表
drop table if exists t_external_hdfs_csv_date_010;

-- 创建表t_external_hdfs_csv_date_010，测试varchar中文特殊字符，值为'@#￥%……'
create external table t_external_hdfs_csv_date_010(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_010的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_010;

-- 删除t_external_hdfs_csv_date_010表
drop table if exists t_external_hdfs_csv_date_012;

-- 创建表t_external_hdfs_csv_date_012，测试超出date范围的timestamp类型，值为10001-01-01 01:01:01
create external table t_external_hdfs_csv_date_012(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_012.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_012的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_012;


-- 删除t_external_hdfs_csv_date_013表
drop table if exists t_external_hdfs_csv_date_013;

-- 创建表t_external_hdfs_csv_date_013，测试boolean类型的true 
create external table t_external_hdfs_csv_date_013(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_013的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_013;


-- 删除t_external_hdfs_csv_date_014表
drop table if exists t_external_hdfs_csv_date_014;

-- 创建表t_external_hdfs_csv_date_014，测试boolean类型的false 
create external table t_external_hdfs_csv_date_014(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_014的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_014;


 
-- 删除t_external_hdfs_csv_date_015表
drop table if exists t_external_hdfs_csv_date_015;

-- 创建表t_external_hdfs_csv_date_015，测试空值
create external table t_external_hdfs_csv_date_015(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_015的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_015;
 
 
-- 删除t_external_hdfs_csv_date_016表
drop table if exists t_external_hdfs_csv_date_016;

-- 创建表t_external_hdfs_csv_date_016，测试空格 
create external table t_external_hdfs_csv_date_016(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_016的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_016;


-- 删除t_external_hdfs_csv_date_017表
drop table if exists t_external_hdfs_csv_date_017;

-- 创建表t_external_hdfs_csv_date_017，测试null 
create external table t_external_hdfs_csv_date_017(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_017的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_017;


-- 删除t_external_hdfs_csv_date_018表
drop table if exists t_external_hdfs_csv_date_018;

-- 创建表t_external_hdfs_csv_date_018，测试NULL  
create external table t_external_hdfs_csv_date_018(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_018的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_018;


-- 删除t_external_hdfs_csv_date_019表
drop table if exists t_external_hdfs_csv_date_019;

-- 创建表t_external_hdfs_csv_date_019，测试日期格式为YYYYMMDD，值为20200101  
create external table t_external_hdfs_csv_date_019(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_019.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_019的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_019;

-- 删除t_external_hdfs_csv_date_020表
drop table if exists t_external_hdfs_csv_date_020;

-- 创建表t_external_hdfs_csv_date_020，测试日期格式为YYYY/MM/DD，值为2020/01/01  
create external table t_external_hdfs_csv_date_020(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_020.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_date_020的数据,实际结果是返回空值
select * from t_external_hdfs_csv_date_020;


-- external  ldbdist csv
-- 测试date类型边界异常值0001-01-00,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_date_001;

create external table t_external_ldbdist_csv_date_001(
a1 date  
)location('ldbdist://node74:54321/csv/date_001.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_date_001;


-- 测试date类型边界异常值10000-01-01,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_date_002;

create external table t_external_ldbdist_csv_date_002(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_002.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_date_002;


-- 测试int类型，值为1234567,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_date_003;

create external table t_external_ldbdist_csv_date_003(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_003.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_date_003;


--测试double类型，值为54775807.111,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_date_004;

create external table t_external_ldbdist_csv_date_004(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_004.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_date_004;


-- 测试varchar类型数字，值为'9223372036',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_date_005;

-- 创建表t_external_ldbdist_csv_date_005，
create external table t_external_ldbdist_csv_date_005(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_005.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_date_005;



--测试varchar英文字母，值为'asdf',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_date_006;

-- 创建表t_external_ldbdist_csv_date_006，
create external table t_external_ldbdist_csv_date_006(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_006的数据
select * from t_external_ldbdist_csv_date_006;


-- 删除t_external_ldbdist_csv_date_007表
drop table if exists t_external_ldbdist_csv_date_007;

-- 创建表t_external_ldbdist_csv_date_007，测试varchar中文字符，值为'你好'
create external table t_external_ldbdist_csv_date_007(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_007的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_007;


-- 删除t_external_ldbdist_csv_date_008表
drop table if exists t_external_ldbdist_csv_date_008;

-- 创建表t_external_ldbdist_csv_date_008，测试varchar中英文字符，值为'你好asdf'
create external table t_external_ldbdist_csv_date_008(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_008的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_008;


-- 删除t_external_ldbdist_csv_date_009表
drop table if exists t_external_ldbdist_csv_date_009;

-- 创建表t_external_ldbdist_csv_date_009，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_ldbdist_csv_date_009(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_009的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_009;


-- 删除t_external_ldbdist_csv_date_010表
drop table if exists t_external_ldbdist_csv_date_010;

-- 创建表t_external_ldbdist_csv_date_010，测试varchar中文特殊字符，值为'@#￥%……'
create external table t_external_ldbdist_csv_date_010(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_010的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_010;

-- 删除t_external_ldbdist_csv_date_010表
drop table if exists t_external_ldbdist_csv_date_012;

-- 创建表t_external_ldbdist_csv_date_012，测试超出date范围的timestamp类型，值为10001-01-01 01:01:01
create external table t_external_ldbdist_csv_date_012(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_012.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_012的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_012;


-- 删除t_external_ldbdist_csv_date_013表
drop table if exists t_external_ldbdist_csv_date_013;

-- 创建表t_external_ldbdist_csv_date_013，测试boolean类型的true 
create external table t_external_ldbdist_csv_date_013(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_013的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_013;


-- 删除t_external_ldbdist_csv_date_014表
drop table if exists t_external_ldbdist_csv_date_014;

-- 创建表t_external_ldbdist_csv_date_014，测试boolean类型的false 
create external table t_external_ldbdist_csv_date_014(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_014的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_014;


 
-- 删除t_external_ldbdist_csv_date_015表
drop table if exists t_external_ldbdist_csv_date_015;

-- 创建表t_external_ldbdist_csv_date_015，测试空值
create external table t_external_ldbdist_csv_date_015(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_015的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_015;
 
 
-- 删除t_external_ldbdist_csv_date_016表
drop table if exists t_external_ldbdist_csv_date_016;

-- 创建表t_external_ldbdist_csv_date_016，测试空格 
create external table t_external_ldbdist_csv_date_016(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_016的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_016;


-- 删除t_external_ldbdist_csv_date_017表
drop table if exists t_external_ldbdist_csv_date_017;

-- 创建表t_external_ldbdist_csv_date_017，测试null 
create external table t_external_ldbdist_csv_date_017(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_017的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_017;


-- 删除t_external_ldbdist_csv_date_018表
drop table if exists t_external_ldbdist_csv_date_018;

-- 创建表t_external_ldbdist_csv_date_018，测试NULL  
create external table t_external_ldbdist_csv_date_018(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_018的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_018;


-- 删除t_external_ldbdist_csv_date_019表
drop table if exists t_external_ldbdist_csv_date_019;

-- 创建表t_external_ldbdist_csv_date_019，测试日期格式为YYYYMMDD，值为20200101  
create external table t_external_ldbdist_csv_date_019(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_019.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_019的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_019;

-- 删除t_external_ldbdist_csv_date_020表
drop table if exists t_external_ldbdist_csv_date_020;

-- 创建表t_external_ldbdist_csv_date_020，测试日期格式为YYYY/MM/DD，值为2020/01/01  
create external table t_external_ldbdist_csv_date_020(
a1 date  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/date_020.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_date_020的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_date_020;

-- hdfs external parquet 

-- 删除表
drop table if exists t_external_hdfs_parquet_date_001;
drop table if exists t_external_hdfs_parquet_date_002;

-- 测试异常值以及其他数据类型
CREATE EXTERNAL TABLE t_external_hdfs_parquet_date_001(
a1 date,
a2 date,
a3 date,
a4 date,
a5 date,
a6 date,
a7 date
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/date1') FORMAT'parquet';

select * from t_external_hdfs_parquet_date_001;

-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_date_002(
a1 date,
a2 date,
a3 date,
a4 date,
a5 date,
a6 date,
a7 date,
a8 date,
a9 date,
a10 date,
a11 date,
a12 date,
a13 date
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_date_002;
