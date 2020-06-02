loaddriver E:\pycharmProject\driver\linkoopdb-jdbc-2.2.2.jar com.datapps.linkoopdb.jdbc.JdbcDriver
connect admin/123456@jdbc:linkoopdb:tcp://192.168.1.74:9105/ldb
set echo on


--    Description: boolean边界值测试,boolean的范围true/false
--    Date:         2020-05-28
--    Author:       丁婷
--    hdfs external csv格式

-- 删除t_external_hdfs_csv_boolean_001表
drop table if exists t_external_hdfs_csv_boolean_001;

-- 创建表t_external_hdfs_csv_boolean_001，测试varchar的'true'
create external table t_external_hdfs_csv_boolean_001(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_001.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_001的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_001;


-- 删除t_external_hdfs_csv_boolean_002表
drop table if exists t_external_hdfs_csv_boolean_002;

-- 创建表t_external_hdfs_csv_boolean_002，测试varchar的'false'
create external table t_external_hdfs_csv_boolean_002(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_002.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_002的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_002;


-- 删除t_external_hdfs_csv_boolean_003表
drop table if exists t_external_hdfs_csv_boolean_003;

-- 创建表t_external_hdfs_csv_boolean_003，测试int类型，值为1234567
create external table t_external_hdfs_csv_boolean_003(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_003的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_003;


-- 删除t_external_hdfs_csv_boolean_004表
drop table if exists t_external_hdfs_csv_boolean_004;

-- 创建表t_external_hdfs_csv_boolean_004，测试double类型，值为54775807.111
create external table t_external_hdfs_csv_boolean_004(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_004的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_004;


-- 删除t_external_hdfs_csv_boolean_005表
drop table if exists t_external_hdfs_csv_boolean_005;

-- 创建表t_external_hdfs_csv_boolean_005，测试varchar类型数字，值为'9223372036'
create external table t_external_hdfs_csv_boolean_005(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_005.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_005的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_005;



-- 删除t_external_hdfs_csv_boolean_006表
drop table if exists t_external_hdfs_csv_boolean_006;

-- 创建表t_external_hdfs_csv_boolean_006，测试varchar英文字母，值为'asdf'
create external table t_external_hdfs_csv_boolean_006(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_006的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_006;


-- 删除t_external_hdfs_csv_boolean_007表
drop table if exists t_external_hdfs_csv_boolean_007;

-- 创建表t_external_hdfs_csv_boolean_007，测试varchar中文字符，值为'你好'
create external table t_external_hdfs_csv_boolean_007(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_007的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_007;


-- 删除t_external_hdfs_csv_boolean_008表
drop table if exists t_external_hdfs_csv_boolean_008;

-- 创建表t_external_hdfs_csv_boolean_008，测试varchar中英文字符，值为'你好asdf'
create external table t_external_hdfs_csv_boolean_008(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_008的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_008;


-- 删除t_external_hdfs_csv_boolean_009表
drop table if exists t_external_hdfs_csv_boolean_009;

-- 创建表t_external_hdfs_csv_boolean_009，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_hdfs_csv_boolean_009(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_009的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_009;


-- 删除t_external_hdfs_csv_boolean_010表
drop table if exists t_external_hdfs_csv_boolean_010;

-- 创建表t_external_hdfs_csv_boolean_010，测试varchar中文特殊字符，值为'@#￥%……'
create external table t_external_hdfs_csv_boolean_010(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_010的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_010;


-- 创建表t_external_hdfs_csv_boolean_012，测试date类型，时间为2020-01-01
create external table t_external_hdfs_csv_boolean_012(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_date.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_012的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_012;


-- 删除t_external_hdfs_csv_boolean_013表
drop table if exists t_external_hdfs_csv_boolean_013;

-- 创建表t_external_hdfs_csv_boolean_013，测试timestamp类型,时间为2020-01-01 00:00:01
create external table t_external_hdfs_csv_boolean_013(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_timestamp.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_013的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_013;


-- 删除t_external_hdfs_csv_boolean_015表
drop table if exists t_external_hdfs_csv_boolean_015;

-- 创建表t_external_hdfs_csv_boolean_015，测试空值
create external table t_external_hdfs_csv_boolean_015(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_015的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_015;
 
 
-- 删除t_external_hdfs_csv_boolean_016表
drop table if exists t_external_hdfs_csv_boolean_016;

-- 创建表t_external_hdfs_csv_boolean_016，测试空格 
create external table t_external_hdfs_csv_boolean_016(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_016的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_016;


-- 删除t_external_hdfs_csv_boolean_017表
drop table if exists t_external_hdfs_csv_boolean_017;

-- 创建表t_external_hdfs_csv_boolean_017，测试null 
create external table t_external_hdfs_csv_boolean_017(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_017的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_017;


-- 删除t_external_hdfs_csv_boolean_018表
drop table if exists t_external_hdfs_csv_boolean_018;

-- 创建表t_external_hdfs_csv_boolean_018，测试NULL  
create external table t_external_hdfs_csv_boolean_018(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_018的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_018;


-- 删除t_external_hdfs_csv_boolean_019表
drop table if exists t_external_hdfs_csv_boolean_019;

-- 创建表t_external_hdfs_csv_boolean_019，测试表示为'真'的字符串,值为非0的数字，1
create external table t_external_hdfs_csv_boolean_019(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_006.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_019的数据,返回true
select * from t_external_hdfs_csv_boolean_019;

-- 删除t_external_hdfs_csv_boolean_020表
drop table if exists t_external_hdfs_csv_boolean_020;

-- 创建表t_external_hdfs_csv_boolean_020，测试表示为'真'的字符串,值为t 
create external table t_external_hdfs_csv_boolean_020(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_007.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_020的数据,返回true
select * from t_external_hdfs_csv_boolean_020;


-- 删除t_external_hdfs_csv_boolean_021表
drop table if exists t_external_hdfs_csv_boolean_021;

-- 创建表t_external_hdfs_csv_boolean_021，测试表示为'真'的字符串,值为yes 
create external table t_external_hdfs_csv_boolean_021(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_008.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_021的数据,值为true
select * from t_external_hdfs_csv_boolean_021;


-- 删除t_external_hdfs_csv_boolean_022表
drop table if exists t_external_hdfs_csv_boolean_022;

-- 创建表t_external_hdfs_csv_boolean_022，测试表示为'假'的字符串,值为0
create external table t_external_hdfs_csv_boolean_022(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_009.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_022的数据,值为false
select * from t_external_hdfs_csv_boolean_022;

-- 删除t_external_hdfs_csv_boolean_023表
drop table if exists t_external_hdfs_csv_boolean_023;

-- 创建表t_external_hdfs_csv_boolean_023，测试表示为'假'的字符串,值为f 
create external table t_external_hdfs_csv_boolean_023(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_010.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_023的数据,值为false
select * from t_external_hdfs_csv_boolean_023;


-- 删除t_external_hdfs_csv_boolean_024表
drop table if exists t_external_hdfs_csv_boolean_024;

-- 创建表t_external_hdfs_csv_boolean_024，测试表示为'假'的字符串,值为no 
create external table t_external_hdfs_csv_boolean_024(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_011.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_024的数据,值为false
select * from t_external_hdfs_csv_boolean_024;


-- 删除t_external_hdfs_csv_boolean_025表
drop table if exists t_external_hdfs_csv_boolean_025;

-- 创建表t_external_hdfs_csv_boolean_025，测试boolean的异常值为truee
create external table t_external_hdfs_csv_boolean_025(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_012.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_boolean_025的数据,实际结果是返回空值
select * from t_external_hdfs_csv_boolean_025;




--    ldbdist external csv格式

-- 删除t_external_ldbdist_csv_boolean_001表
drop table if exists t_external_ldbdist_csv_boolean_001;

-- 创建表t_external_ldbdist_csv_boolean_001，测试varchar的'true'
create external table t_external_ldbdist_csv_boolean_001(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_001.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_001的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_001;


-- 删除t_external_ldbdist_csv_boolean_002表
drop table if exists t_external_ldbdist_csv_boolean_002;

-- 创建表t_external_ldbdist_csv_boolean_002，测试varchar的'false'
create external table t_external_ldbdist_csv_boolean_002(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_002.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_002的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_002;


-- 删除t_external_ldbdist_csv_boolean_003表
drop table if exists t_external_ldbdist_csv_boolean_003;

-- 创建表t_external_ldbdist_csv_boolean_003，测试int类型，值为1234567
create external table t_external_ldbdist_csv_boolean_003(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_003的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_003;


-- 删除t_external_ldbdist_csv_boolean_004表
drop table if exists t_external_ldbdist_csv_boolean_004;

-- 创建表t_external_ldbdist_csv_boolean_004，测试double类型，值为54775807.111
create external table t_external_ldbdist_csv_boolean_004(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_004的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_004;


-- 删除t_external_ldbdist_csv_boolean_005表
drop table if exists t_external_ldbdist_csv_boolean_005;

-- 创建表t_external_ldbdist_csv_boolean_005，测试varchar类型数字，值为'9223372036'
create external table t_external_ldbdist_csv_boolean_005(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_005.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_005的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_005;



-- 删除t_external_ldbdist_csv_boolean_006表
drop table if exists t_external_ldbdist_csv_boolean_006;

-- 创建表t_external_ldbdist_csv_boolean_006，测试varchar英文字母，值为'asdf'
create external table t_external_ldbdist_csv_boolean_006(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_006的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_006;


-- 删除t_external_ldbdist_csv_boolean_007表
drop table if exists t_external_ldbdist_csv_boolean_007;

-- 创建表t_external_ldbdist_csv_boolean_007，测试varchar中文字符，值为'你好'
create external table t_external_ldbdist_csv_boolean_007(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_007的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_007;


-- 删除t_external_ldbdist_csv_boolean_008表
drop table if exists t_external_ldbdist_csv_boolean_008;

-- 创建表t_external_ldbdist_csv_boolean_008，测试varchar中英文字符，值为'你好asdf'
create external table t_external_ldbdist_csv_boolean_008(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_008的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_008;


-- 删除t_external_ldbdist_csv_boolean_009表
drop table if exists t_external_ldbdist_csv_boolean_009;

-- 创建表t_external_ldbdist_csv_boolean_009，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_ldbdist_csv_boolean_009(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_009的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_009;


-- 删除t_external_ldbdist_csv_boolean_010表
drop table if exists t_external_ldbdist_csv_boolean_010;

-- 创建表t_external_ldbdist_csv_boolean_010，测试varchar中文特殊字符，值为'@#￥%……'
create external table t_external_ldbdist_csv_boolean_010(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_010的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_010;


-- 创建表t_external_ldbdist_csv_boolean_012，测试date类型，时间为2020-01-01
create external table t_external_ldbdist_csv_boolean_012(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_date.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_012的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_012;


-- 删除t_external_ldbdist_csv_boolean_013表
drop table if exists t_external_ldbdist_csv_boolean_013;

-- 创建表t_external_ldbdist_csv_boolean_013，测试timestamp类型,时间为2020-01-01 00:00:01
create external table t_external_ldbdist_csv_boolean_013(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_timestamp.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_013的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_013;


-- 删除t_external_ldbdist_csv_boolean_015表
drop table if exists t_external_ldbdist_csv_boolean_015;

-- 创建表t_external_ldbdist_csv_boolean_015，测试空值
create external table t_external_ldbdist_csv_boolean_015(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_015的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_015;
 
 
-- 删除t_external_ldbdist_csv_boolean_016表
drop table if exists t_external_ldbdist_csv_boolean_016;

-- 创建表t_external_ldbdist_csv_boolean_016，测试空格 
create external table t_external_ldbdist_csv_boolean_016(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_016的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_016;


-- 删除t_external_ldbdist_csv_boolean_017表
drop table if exists t_external_ldbdist_csv_boolean_017;

-- 创建表t_external_ldbdist_csv_boolean_017，测试null 
create external table t_external_ldbdist_csv_boolean_017(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_017的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_017;


-- 删除t_external_ldbdist_csv_boolean_018表
drop table if exists t_external_ldbdist_csv_boolean_018;

-- 创建表t_external_ldbdist_csv_boolean_018，测试NULL  
create external table t_external_ldbdist_csv_boolean_018(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_018的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_018;


-- 删除t_external_ldbdist_csv_boolean_019表
drop table if exists t_external_ldbdist_csv_boolean_019;

-- 创建表t_external_ldbdist_csv_boolean_019，测试表示为'真'的字符串,值为非0的数字，1
create external table t_external_ldbdist_csv_boolean_019(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_006.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_019的数据,返回true
select * from t_external_ldbdist_csv_boolean_019;

-- 删除t_external_ldbdist_csv_boolean_020表
drop table if exists t_external_ldbdist_csv_boolean_020;

-- 创建表t_external_ldbdist_csv_boolean_020，测试表示为'真'的字符串,值为t 
create external table t_external_ldbdist_csv_boolean_020(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_007.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_020的数据,返回true
select * from t_external_ldbdist_csv_boolean_020;


-- 删除t_external_ldbdist_csv_boolean_021表
drop table if exists t_external_ldbdist_csv_boolean_021;

-- 创建表t_external_ldbdist_csv_boolean_021，测试表示为'真'的字符串,值为yes 
create external table t_external_ldbdist_csv_boolean_021(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_008.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_021的数据,值为true
select * from t_external_ldbdist_csv_boolean_021;


-- 删除t_external_ldbdist_csv_boolean_022表
drop table if exists t_external_ldbdist_csv_boolean_022;

-- 创建表t_external_ldbdist_csv_boolean_022，测试表示为'假'的字符串,值为0
create external table t_external_ldbdist_csv_boolean_022(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_009.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_022的数据,值为false
select * from t_external_ldbdist_csv_boolean_022;

-- 删除t_external_ldbdist_csv_boolean_023表
drop table if exists t_external_ldbdist_csv_boolean_023;

-- 创建表t_external_ldbdist_csv_boolean_023，测试表示为'假'的字符串,值为f 
create external table t_external_ldbdist_csv_boolean_023(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_010.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_023的数据,值为false
select * from t_external_ldbdist_csv_boolean_023;


-- 删除t_external_ldbdist_csv_boolean_024表
drop table if exists t_external_ldbdist_csv_boolean_024;

-- 创建表t_external_ldbdist_csv_boolean_024，测试表示为'假'的字符串,值为no 
create external table t_external_ldbdist_csv_boolean_024(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_011.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_024的数据,值为false
select * from t_external_ldbdist_csv_boolean_024;


-- 删除t_external_ldbdist_csv_boolean_025表
drop table if exists t_external_ldbdist_csv_boolean_025;

-- 创建表t_external_ldbdist_csv_boolean_025，测试boolean的异常值为truee
create external table t_external_ldbdist_csv_boolean_025(
a1 boolean  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_012.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_boolean_025的数据,实际结果是返回空值
select * from t_external_ldbdist_csv_boolean_025;




-- hdfs external parquet
-- 测试boolean的varchar，date,timestamp,boolean以及''等异常值
drop table if exists t_external_hdfs_parquet_boolean_001;
drop table if exists t_external_hdfs_parquet_boolean_002;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_boolean_001(
a1 boolean,
a2 boolean,
a3 boolean,
a4 boolean,
a5 boolean,
a6 boolean,
a7 boolean,
a8 boolean,
a9 boolean,
a10 boolean,
a11 boolean,
a12 boolean,
a13 boolean
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_boolean_001;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_boolean_002(
a1 boolean,
a2 boolean,
a3 boolean,
a4 boolean,
a5 boolean,
a6 boolean,
a7 boolean,
a8 boolean,
a9 boolean,
a10 boolean,
a11 boolean,
a12 boolean
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/boolean1') FORMAT'parquet';

select * from t_external_hdfs_parquet_boolean_002;