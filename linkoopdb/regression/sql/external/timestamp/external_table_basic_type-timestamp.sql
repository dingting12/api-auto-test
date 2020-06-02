loaddriver E:\pycharmProject\driver\linkoopdb-jdbc-2.2.2.jar com.datapps.linkoopdb.jdbc.JdbcDriver
connect admin/123456@jdbc:linkoopdb:tcp://192.168.1.73:9105/ldb
set echo on


--    Description: timestamp边界值测试,timestamp的数值范围是0001-01-01 00:00:00/9999-12-31 23:59:59
--    Date:         2020-05-28
--    Author:       丁婷
--    hdfs external csv格式

-- 删除t_external_hdfs_csv_timestamp_001表
drop table if exists t_external_hdfs_csv_timestamp_001;

-- 创建表t_external_hdfs_csv_timestamp_001，测试timestamp类型边界异常值0001-01-00 00:00:00
create external table t_external_hdfs_csv_timestamp_001(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/timestamp_001.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_001的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_001;


-- 删除t_external_hdfs_csv_timestamp_002表
drop table if exists t_external_hdfs_csv_timestamp_002;

-- 创建表t_external_hdfs_csv_timestamp_002，测试timestamp类型边界异常值10000-01-01 00:00:00
create external table t_external_hdfs_csv_timestamp_002(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/timestamp_002.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_002的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_002;


-- 删除t_external_hdfs_csv_timestamp_003表
drop table if exists t_external_hdfs_csv_timestamp_003;

-- 创建表t_external_hdfs_csv_timestamp_003，测试int类型，值为1234567
create external table t_external_hdfs_csv_timestamp_003(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/timestamp_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_003的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_003;


-- 删除t_external_hdfs_csv_timestamp_004表
drop table if exists t_external_hdfs_csv_timestamp_004;

-- 创建表t_external_hdfs_csv_timestamp_004，测试double类型，值为54775807.111
create external table t_external_hdfs_csv_timestamp_004(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/timestamp_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_004的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_004;


-- 删除t_external_hdfs_csv_timestamp_005表
drop table if exists t_external_hdfs_csv_timestamp_005;

-- 创建表t_external_hdfs_csv_timestamp_005，测试varchar类型数字，值为'9223372036'
create external table t_external_hdfs_csv_timestamp_005(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/timestamp_005.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_005的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_005;


-- 删除t_external_hdfs_csv_timestamp_006表
drop table if exists t_external_hdfs_csv_timestamp_006;

-- 创建表t_external_hdfs_csv_timestamp_006，测试varchar英文字母，值为'asdf'
create external table t_external_hdfs_csv_timestamp_006(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_006的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_006;


-- 删除t_external_hdfs_csv_timestamp_007表
drop table if exists t_external_hdfs_csv_timestamp_007;

-- 创建表t_external_hdfs_csv_timestamp_007，测试varchar中文字符，值为'你好'
create external table t_external_hdfs_csv_timestamp_007(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_007的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_007;


-- 删除t_external_hdfs_csv_timestamp_008表
drop table if exists t_external_hdfs_csv_timestamp_008;

-- 创建表t_external_hdfs_csv_timestamp_008，测试varchar中英文字符，值为'你好asdf'
create external table t_external_hdfs_csv_timestamp_008(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_008的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_008;


-- 删除t_external_hdfs_csv_timestamp_009表
drop table if exists t_external_hdfs_csv_timestamp_009;

-- 创建表t_external_hdfs_csv_timestamp_009，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_hdfs_csv_timestamp_009(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_009的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_009;


-- 删除t_external_hdfs_csv_timestamp_010表
drop table if exists t_external_hdfs_csv_timestamp_010;

-- 创建表t_external_hdfs_csv_timestamp_010，测试varchar中文特殊字符，值为'@#￥%……'
create external table t_external_hdfs_csv_timestamp_010(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_010的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_010;


-- 创建表t_external_hdfs_csv_timestamp_012，测试date类型，时间为2020-01-01
create external table t_external_hdfs_csv_timestamp_012(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/timestamp_006.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_012的数据,结果为2020-01-01 00:00:00
select * from t_external_hdfs_csv_timestamp_012;


-- 删除t_external_hdfs_csv_timestamp_013表
drop table if exists t_external_hdfs_csv_timestamp_013;

-- 创建表t_external_hdfs_csv_timestamp_013，测试boolean类型的true 
create external table t_external_hdfs_csv_timestamp_013(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_013的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_013;


-- 删除t_external_hdfs_csv_timestamp_014表
drop table if exists t_external_hdfs_csv_timestamp_014;

-- 创建表t_external_hdfs_csv_timestamp_014，测试boolean类型的false 
create external table t_external_hdfs_csv_timestamp_014(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_014的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_014;

-- 删除t_external_hdfs_csv_timestamp_015表
drop table if exists t_external_hdfs_csv_timestamp_015;

-- 创建表t_external_hdfs_csv_timestamp_015，测试空值
create external table t_external_hdfs_csv_timestamp_015(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_015的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_015;
 
 
-- 删除t_external_hdfs_csv_timestamp_016表
drop table if exists t_external_hdfs_csv_timestamp_016;

-- 创建表t_external_hdfs_csv_timestamp_016，测试空格 
create external table t_external_hdfs_csv_timestamp_016(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_016的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_016;


-- 删除t_external_hdfs_csv_timestamp_017表
drop table if exists t_external_hdfs_csv_timestamp_017;

-- 创建表t_external_hdfs_csv_timestamp_017，测试null 
create external table t_external_hdfs_csv_timestamp_017(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_017的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_017;


-- 删除t_external_hdfs_csv_timestamp_018表
drop table if exists t_external_hdfs_csv_timestamp_018;

-- 创建表t_external_hdfs_csv_timestamp_018，测试NULL  
create external table t_external_hdfs_csv_timestamp_018(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_018的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_018;


-- 删除t_external_hdfs_csv_timestamp_019表
drop table if exists t_external_hdfs_csv_timestamp_019;

-- 创建表t_external_hdfs_csv_timestamp_019，测试日期格式为YYYYMMDD HH24:MI:SS，值为20200101 12:01:01  
create external table t_external_hdfs_csv_timestamp_019(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/timestamp_007.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_020的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_019;

-- 删除t_external_hdfs_csv_timestamp_020表
drop table if exists t_external_hdfs_csv_timestamp_020;

-- 创建表t_external_hdfs_csv_timestamp_020，测试日期格式为YYYY/MM/DD HH24:MI:SS，值为2020/01/01 12:01:01  
create external table t_external_hdfs_csv_timestamp_020(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/timestamp_008.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_020的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_020;


-- 删除t_external_hdfs_csv_timestamp_021表
drop table if exists t_external_hdfs_csv_timestamp_021;

-- 创建表t_external_hdfs_csv_timestamp_021，测试日期格式为YYYY/MM/DD HH24:MI:SS，值为2020/01/01 12:01:01:01  
create external table t_external_hdfs_csv_timestamp_021(
a1 timestamp  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/timestamp_009.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_timestamp_021的数据,实际结果是返回空值
select * from t_external_hdfs_csv_timestamp_021;

-- external ldbdist csv
-- 删除t_external_ldbdist_csv_timestamp_001表
drop table if exists t_external_ldbdist_csv_timestamp_001;

-- 创建表t_external_ldbdist_csv_timestamp_001，测试timestamp类型边界异常值0001-01-00 00:00:00
create external table t_external_ldbdist_csv_timestamp_001(
a1 timestamp  
)location('ldbdist://node74:54321/csv/timestamp_001.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_001的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_001;


-- 删除t_external_ldbdist_csv_timestamp_002表
drop table if exists t_external_ldbdist_csv_timestamp_002;

-- 创建表t_external_ldbdist_csv_timestamp_002，测试timestamp类型边界异常值10000-01-01 00:00:00
create external table t_external_ldbdist_csv_timestamp_002(
a1 timestamp  
)location('ldbdist://node74:54321/csv/timestamp_002.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_002的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_002;


-- 删除t_external_ldbdist_csv_timestamp_003表
drop table if exists t_external_ldbdist_csv_timestamp_003;

-- 创建表t_external_ldbdist_csv_timestamp_003，测试int类型，值为1234567
create external table t_external_ldbdist_csv_timestamp_003(
a1 timestamp  
)location('ldbdist://node74:54321/csv/timestamp_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_003的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_003;


-- 删除t_external_ldbdist_csv_timestamp_004表
drop table if exists t_external_ldbdist_csv_timestamp_004;

-- 创建表t_external_ldbdist_csv_timestamp_004，测试double类型，值为54775807.111
create external table t_external_ldbdist_csv_timestamp_004(
a1 timestamp  
)location('ldbdist://node74:54321/csv/timestamp_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_004的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_004;


-- 删除t_external_ldbdist_csv_timestamp_005表
drop table if exists t_external_ldbdist_csv_timestamp_005;

-- 创建表t_external_ldbdist_csv_timestamp_005，测试varchar类型数字，值为'9223372036'
create external table t_external_ldbdist_csv_timestamp_005(
a1 timestamp  
)location('ldbdist://node74:54321/csv/timestamp_005.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_005的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_005;


-- 删除t_external_ldbdist_csv_timestamp_006表
drop table if exists t_external_ldbdist_csv_timestamp_006;

-- 创建表t_external_ldbdist_csv_timestamp_006，测试varchar英文字母，值为'asdf'
create external table t_external_ldbdist_csv_timestamp_006(
a1 timestamp  
)location('ldbdist://node74:54321/csv/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_006的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_006;


-- 删除t_external_ldbdist_csv_timestamp_007表
drop table if exists t_external_ldbdist_csv_timestamp_007;

-- 创建表t_external_ldbdist_csv_timestamp_007，测试varchar中文字符，值为'你好'
create external table t_external_ldbdist_csv_timestamp_007(
a1 timestamp  
)location('ldbdist://node74:54321/csv/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_007的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_007;


-- 删除t_external_ldbdist_csv_timestamp_008表
drop table if exists t_external_ldbdist_csv_timestamp_008;

-- 创建表t_external_ldbdist_csv_timestamp_008，测试varchar中英文字符，值为'你好asdf'
create external table t_external_ldbdist_csv_timestamp_008(
a1 timestamp  
)location('ldbdist://node74:54321/csv/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_008的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_008;


-- 删除t_external_ldbdist_csv_timestamp_009表
drop table if exists t_external_ldbdist_csv_timestamp_009;

-- 创建表t_external_ldbdist_csv_timestamp_009，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_ldbdist_csv_timestamp_009(
a1 timestamp  
)location('ldbdist://node74:54321/csv/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_009的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_009;


-- 删除t_external_ldbdist_csv_timestamp_010表
drop table if exists t_external_ldbdist_csv_timestamp_010;

-- 创建表t_external_ldbdist_csv_timestamp_010，测试varchar中文特殊字符，值为'@#￥%……'
create external table t_external_ldbdist_csv_timestamp_010(
a1 timestamp  
)location('ldbdist://node74:54321/csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_010的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_010;


-- 创建表t_external_ldbdist_csv_timestamp_012，测试date类型，时间为2020-01-01
create external table t_external_ldbdist_csv_timestamp_012(
a1 timestamp  
)location('ldbdist://node74:54321/csv/timestamp_006.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_012的数据,结果为2020-01-01 00:00:00
select * from t_external_ldbdist_csv_timestamp_012;


-- 删除t_external_ldbdist_csv_timestamp_013表
drop table if exists t_external_ldbdist_csv_timestamp_013;

-- 创建表t_external_ldbdist_csv_timestamp_013，测试boolean类型的true 
create external table t_external_ldbdist_csv_timestamp_013(
a1 timestamp  
)location('ldbdist://node74:54321/csv/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_013的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_013;


-- 删除t_external_ldbdist_csv_timestamp_014表
drop table if exists t_external_ldbdist_csv_timestamp_014;

-- 创建表t_external_ldbdist_csv_timestamp_014，测试boolean类型的false 
create external table t_external_ldbdist_csv_timestamp_014(
a1 timestamp  
)location('ldbdist://node74:54321/csv/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_014的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_014;

-- 删除t_external_ldbdist_csv_timestamp_015表
drop table if exists t_external_ldbdist_csv_timestamp_015;

-- 创建表t_external_ldbdist_csv_timestamp_015，测试空值
create external table t_external_ldbdist_csv_timestamp_015(
a1 timestamp  
)location('ldbdist://node74:54321/csv/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_015的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_015;
 
 
-- 删除t_external_ldbdist_csv_timestamp_016表
drop table if exists t_external_ldbdist_csv_timestamp_016;

-- 创建表t_external_ldbdist_csv_timestamp_016，测试空格 
create external table t_external_ldbdist_csv_timestamp_016(
a1 timestamp  
)location('ldbdist://node74:54321/csv/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_016的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_016;


-- 删除t_external_ldbdist_csv_timestamp_017表
drop table if exists t_external_ldbdist_csv_timestamp_017;

-- 创建表t_external_ldbdist_csv_timestamp_017，测试null 
create external table t_external_ldbdist_csv_timestamp_017(
a1 timestamp  
)location('ldbdist://node74:54321/csv/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_017的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_017;


-- 删除t_external_ldbdist_csv_timestamp_018表
drop table if exists t_external_ldbdist_csv_timestamp_018;

-- 创建表t_external_ldbdist_csv_timestamp_018，测试NULL  
create external table t_external_ldbdist_csv_timestamp_018(
a1 timestamp  
)location('ldbdist://node74:54321/csv/type_NULL.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_018的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_018;


-- 删除t_external_ldbdist_csv_timestamp_019表
drop table if exists t_external_ldbdist_csv_timestamp_019;

-- 创建表t_external_ldbdist_csv_timestamp_019，测试日期格式为YYYYMMDD HH24:MI:SS，值为20200101 12:01:01  
create external table t_external_ldbdist_csv_timestamp_019(
a1 timestamp  
)location('ldbdist://node74:54321/csv/timestamp_007.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_020的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_019;

-- 删除t_external_ldbdist_csv_timestamp_020表
drop table if exists t_external_ldbdist_csv_timestamp_020;

-- 创建表t_external_ldbdist_csv_timestamp_020，测试日期格式为YYYY/MM/DD HH24:MI:SS，值为2020/01/01 12:01:01  
create external table t_external_ldbdist_csv_timestamp_020(
a1 timestamp  
)location('ldbdist://node74:54321/csv/timestamp_008.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_020的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_020;


-- 删除t_external_ldbdist_csv_timestamp_021表
drop table if exists t_external_ldbdist_csv_timestamp_021;

-- 创建表t_external_ldbdist_csv_timestamp_021，测试日期格式为YYYY/MM/DD HH24:MI:SS，值为2020/01/01 12:01:01:01  
create external table t_external_ldbdist_csv_timestamp_021(
a1 timestamp  
)location('ldbdist://node74:54321/csv/timestamp_009.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_timestamp_021的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_timestamp_021;



-- hdfs external parquet 

-- 删除表
drop table if exists t_external_hdfs_parquet_timestamp_001;
drop table if exists t_external_hdfs_parquet_timestamp_002;

-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_timestamp_001(
a1 timestamp,
a2 timestamp,
a3 timestamp,
a4 timestamp,
a5 timestamp,
a6 timestamp,
a7 timestamp,
a8 timestamp
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/timestamp1') FORMAT'parquet';

select * from t_external_hdfs_parquet_timestamp_001;



-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_timestamp_002(
a1 timestamp,
a2 timestamp,
a3 timestamp,
a4 timestamp,
a5 timestamp,
a6 timestamp,
a7 timestamp,
a8 timestamp,
a9 timestamp,
a10 timestamp,
a11 timestamp,
a12 timestamp,
a13 timestamp
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_timestamp_002;