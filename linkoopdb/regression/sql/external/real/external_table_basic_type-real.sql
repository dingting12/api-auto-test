
--    Description: real边界值测试,double的范围-1.79769313486231E+308,-2.22507385850720E-308, 0,2.22507385850720E-308 ~ 1.79769313486231E+308
--    Date:         2020-05-28
--    Author:       丁婷
--    hdfs external csv格式

-- 删除t_external_hdfs_csv_real_001表
drop table if exists t_external_hdfs_csv_real_001;

-- 创建表t_external_hdfs_csv_real_001，测试超出边界值-1.79769313486231E+308-1
create external table t_external_hdfs_csv_real_001(
a1 double
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/real_001.csv')
format 'csv' (delimiter ',');

-- 查询t_external_hdfs_csv_real_001，应报错,实际返回空值
SELECT * FROM t_external_hdfs_csv_real_001

-- 删除t_external_hdfs_csv_real_002表
drop table if exists t_external_hdfs_csv_real_002;

-- 创建表t_external_hdfs_csv_real_002，测试超出边界值1.79769313486231E+308+1
create external table t_external_hdfs_csv_real_002(
a1 double 
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/real_002.csv')
format 'csv' (delimiter ',');

  -- 查询t_external_hdfs_csv_real_002，应报错,实际返回空值
SELECT * FROM t_external_hdfs_csv_real_002;


-- 删除t_external_hdfs_csv_real_019表
drop table if exists t_external_hdfs_csv_real_019;

-- 创建表t_external_hdfs_csv_real_019，测试超出边界值 -2.22507385850720E-308-1E-308
create external table t_external_hdfs_csv_real_019(
a1 double
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/real_006.csv')
format 'csv' (delimiter ',');

-- 查询t_external_hdfs_csv_real_019，应报错,实际返回空值
SELECT * FROM t_external_hdfs_csv_real_019

-- 删除t_external_hdfs_csv_real_004表
drop table if exists t_external_hdfs_csv_real_020;

-- 创建表t_external_hdfs_csv_real_020，测试超出边界值2.22507385850720E-308-1E-308
create external table t_external_hdfs_csv_real_020(
a1 double 
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/real_007.csv')
format 'csv' (delimiter ',');

-- 查询t_external_hdfs_csv_real_020，应报错,实际返回空值
SELECT * FROM t_external_hdfs_csv_real_020;


-- 删除t_external_hdfs_csv_real_003表
drop table if exists t_external_hdfs_csv_real_003;

-- 创建表t_external_hdfs_csv_real_003，测试有效位为15位，超出有效位四舍五入，值为123.12345678912391
create external table t_external_hdfs_csv_real_003(
a1 real
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/real_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_003的数据,实际返回123.1234567891239
select * from t_external_hdfs_csv_real_003;


-- 删除t_external_hdfs_csv_real_004表，测试int类型，值为1147483647
drop table if exists t_external_hdfs_csv_real_004;

-- 创建表t_external_hdfs_csv_real_004
create external table t_external_hdfs_csv_real_004(
a1 real   
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/real_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_004的数据，返回1147483647
select * from t_external_hdfs_csv_real_004;

-- 删除t_external_hdfs_csv_real_005表
drop table if exists t_external_hdfs_csv_real_005;

-- 创建表t_external_hdfs_csv_real_005，测试varchar英文字母，值为'asdf'
create external table t_external_hdfs_csv_real_005(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_005的数据,实际返回空值
select * from t_external_hdfs_csv_real_005;


-- 删除t_external_hdfs_csv_real_006表
drop table if exists t_external_hdfs_csv_real_006;

-- 创建表t_external_hdfs_csv_real_006，测试varchar中文字符，值为'你好'
create external table t_external_hdfs_csv_real_006(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_006的数据,实际返回空值
select * from t_external_hdfs_csv_real_006;


-- 删除t_external_hdfs_csv_real_007表
drop table if exists t_external_hdfs_csv_real_007;

-- 创建表t_external_hdfs_csv_real_007，测试varchar中英文字符，值为'你好asdf'
create external table t_external_hdfs_csv_real_007(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_007的数据,实际返回空值
select * from t_external_hdfs_csv_real_007;


-- 删除t_external_hdfs_csv_real_008表
drop table if exists t_external_hdfs_csv_real_008;

-- 创建表 t_external_hdfs_csv_real_008，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_hdfs_csv_real_008(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_real_008 的数据,实际返回空值
select * from t_external_hdfs_csv_real_008


-- 删除 t_external_hdfs_csv_real_009 表
drop table if exists t_external_hdfs_csv_real_009;

-- 创建表 t_external_hdfs_csv_real_009 ，测试varreal中文特殊字符，值为'@#￥%……'
create external table t_external_hdfs_csv_real_009(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_real_009 的数据,实际返回空值
select * from t_external_hdfs_csv_real_009;

-- 删除 t_external_hdfs_csv_real_010 表
drop table if exists t_external_hdfs_csv_real_010;

-- 创建表 t_external_hdfs_csv_real_010，测试varchar为数字，值为'123456789'
create external table t_external_hdfs_csv_real_010(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/real_005.csv')
format 'csv' (delimiter ',');

--查询 t_external_hdfs_csv_real_010 的数据,实际返回空值
SELECT * FROM t_external_hdfs_csv_real_010;

-- 删除t_external_hdfs_csv_real_011表
drop table if exists t_external_hdfs_csv_real_011;

-- 创建表t_external_hdfs_csv_real_011，测试date类型，值为2020-05-08
create external table t_external_hdfs_csv_real_011(
a1 real  
)location('hdfs://node73:8011/user/testdb73/external_file/csv_type/type_date.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_011的数据,实际返回空值
select * from t_external_hdfs_csv_real_011;


-- 删除t_external_hdfs_csv_real_012表
drop table if exists t_external_hdfs_csv_real_012;

-- 创建表t_external_hdfs_csv_real_012，测试timestamp，值为2020-05-08 12:19:01
create external table t_external_hdfs_csv_real_012(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_timestamp.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_012的数据,实际返回空值
select * from t_external_hdfs_csv_real_012;


-- 删除 t_external_hdfs_csv_real_013 表
drop table if exists t_external_hdfs_csv_real_013;

-- 创建表 t_external_hdfs_csv_real_013，测试boolean类型，值为false
create external table t_external_hdfs_csv_real_013(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_hdfs_csv_real_013 的数据,实际返回空值
select * from t_external_hdfs_csv_real_013;

-- 删除t_external_hdfs_csv_real_014表
drop table if exists t_external_hdfs_csv_real_014;

-- 创建表t_external_hdfs_csv_real_014，测试boolean类型，值为true
create external table t_external_hdfs_csv_real_014(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_014的数据,实际返回空值
select * from t_external_hdfs_csv_real_014;


-- 删除t_external_hdfs_csv_real_015表
drop table if exists t_external_hdfs_csv_real_015;

-- 创建表t_external_hdfs_csv_real_015，测试空值
create external table t_external_hdfs_csv_real_015(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_015的数据,实际返回空值
select * from t_external_hdfs_csv_real_015;
 
 
-- 删除t_external_hdfs_csv_real_016表
drop table if exists t_external_hdfs_csv_real_016;

-- 创建表t_external_hdfs_csv_real_016，测试空格 
create external table t_external_hdfs_csv_real_016(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_016的数据,实际返回空值
select * from t_external_hdfs_csv_real_016;


-- 删除t_external_hdfs_csv_real_017表
drop table if exists t_external_hdfs_csv_real_017;

-- 创建表t_external_hdfs_csv_real_017，测试null 
create external table t_external_hdfs_csv_real_017(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_017的数据,实际返回空值
select * from t_external_hdfs_csv_real_017;


-- 删除t_external_hdfs_csv_real_018表
drop table if exists t_external_hdfs_csv_real_018;

-- 创建表t_external_hdfs_csv_real_018，测试NULL  
create external table t_external_hdfs_csv_real_018(
a1 real  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
--查询t_external_hdfs_csv_real_018的数据,实际返回空值
select * from t_external_hdfs_csv_real_018;



--    ldbdist external csv格式

-- 删除t_external_ldbdist_csv_real_001表
drop table if exists t_external_ldbdist_csv_real_001;

-- 创建表t_external_ldbdist_csv_real_001，测试超出边界值-1.79769313486231E+308-1
create external table t_external_ldbdist_csv_real_001(
a1 double
)location('ldbdist://node74:54321/csv/real_001.csv')
format 'csv' (delimiter ',');

-- 查询t_external_ldbdist_csv_real_001，应报错,实际返回空值
SELECT * FROM t_external_ldbdist_csv_real_001

-- 删除t_external_ldbdist_csv_real_002表
drop table if exists t_external_ldbdist_csv_real_002;

-- 创建表t_external_ldbdist_csv_real_002，测试超出边界值1.79769313486231E+308+1
create external table t_external_ldbdist_csv_real_002(
a1 double 
)location('ldbdist://node74:54321/csv/real_002.csv')
format 'csv' (delimiter ',');

  -- 查询t_external_ldbdist_csv_real_002，应报错,实际返回空值
SELECT * FROM t_external_ldbdist_csv_real_002;


-- 删除t_external_ldbdist_csv_real_019表
drop table if exists t_external_ldbdist_csv_real_019;

-- 创建表t_external_ldbdist_csv_real_019，测试超出边界值 -2.22507385850720E-308-1E-308
create external table t_external_ldbdist_csv_real_019(
a1 double
)location('ldbdist://node74:54321/csv/real_006.csv')
format 'csv' (delimiter ',');

-- 查询t_external_ldbdist_csv_real_019，应报错,实际返回空值
SELECT * FROM t_external_ldbdist_csv_real_019

-- 删除t_external_ldbdist_csv_real_004表
drop table if exists t_external_ldbdist_csv_real_020;

-- 创建表t_external_ldbdist_csv_real_020，测试超出边界值2.22507385850720E-308-1E-308
create external table t_external_ldbdist_csv_real_020(
a1 double 
)location('ldbdist://node74:54321/csv/real_007.csv')
format 'csv' (delimiter ',');

-- 查询t_external_ldbdist_csv_real_020，应报错,实际返回空值
SELECT * FROM t_external_ldbdist_csv_real_020;




-- ldbdist csv 
-- 删除t_external_ldbdist_csv_real_001表
drop table if exists t_external_ldbdist_csv_real_001;

-- 创建表t_external_ldbdist_csv_real_001，测试超出边界值-1.79769313486231E+308-1
create external table t_external_ldbdist_csv_real_001(
a1 double
)location('ldbdist://node74:54321/csv/real_001.csv')
format 'csv' (delimiter ',');

-- 查询t_external_ldbdist_csv_real_001，应报错,实际返回空值
SELECT * FROM t_external_ldbdist_csv_real_001

-- 删除t_external_ldbdist_csv_real_002表
drop table if exists t_external_ldbdist_csv_real_002;

-- 创建表t_external_ldbdist_csv_real_002，测试超出边界值1.79769313486231E+308+1
create external table t_external_ldbdist_csv_real_002(
a1 double 
)location('ldbdist://node74:54321/csv/real_002.csv')
format 'csv' (delimiter ',');

  -- 查询t_external_ldbdist_csv_real_002，应报错,实际返回空值
SELECT * FROM t_external_ldbdist_csv_real_002;


-- 删除t_external_ldbdist_csv_real_019表
drop table if exists t_external_ldbdist_csv_real_019;

-- 创建表t_external_ldbdist_csv_real_019，测试超出边界值 -2.22507385850720E-308-1E-308
create external table t_external_ldbdist_csv_real_019(
a1 double
)location('ldbdist://node74:54321/csv/real_006.csv')
format 'csv' (delimiter ',');

-- 查询t_external_ldbdist_csv_real_019，应报错,实际返回空值
SELECT * FROM t_external_ldbdist_csv_real_019

-- 删除t_external_ldbdist_csv_real_004表
drop table if exists t_external_ldbdist_csv_real_020;

-- 创建表t_external_ldbdist_csv_real_020，测试超出边界值2.22507385850720E-308-1E-308
create external table t_external_ldbdist_csv_real_020(
a1 double 
)location('ldbdist://node74:54321/csv/real_007.csv')
format 'csv' (delimiter ',');

  -- 查询t_external_ldbdist_csv_real_020，应报错,实际返回空值
SELECT * FROM t_external_ldbdist_csv_real_020;

-- 删除t_external_ldbdist_csv_real_003表
drop table if exists t_external_ldbdist_csv_real_003;

-- 创建表t_external_ldbdist_csv_real_003，测试有效位为15位，超出有效位四舍五入，值为123.12345678912391
create external table t_external_ldbdist_csv_real_003(
a1 real
)location('ldbdist://node74:54321/csv/real_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_003的数据,实际返回123.1234567891239
select * from t_external_ldbdist_csv_real_003;


-- 删除t_external_ldbdist_csv_real_004表，测试int类型，值为1147483647
drop table if exists t_external_ldbdist_csv_real_004;

-- 创建表t_external_ldbdist_csv_real_004
create external table t_external_ldbdist_csv_real_004(
a1 real   
)location('ldbdist://node74:54321/csv/real_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_004的数据，返回1147483647
select * from t_external_ldbdist_csv_real_004;

-- 删除t_external_ldbdist_csv_real_005表
drop table if exists t_external_ldbdist_csv_real_005;

-- 创建表t_external_ldbdist_csv_real_005，测试varchar英文字母，值为'asdf'
create external table t_external_ldbdist_csv_real_005(
a1 real  
)location('ldbdist://node74:54321/csv/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_005的数据,实际返回空值
select * from t_external_ldbdist_csv_real_005;


-- 删除t_external_ldbdist_csv_real_006表
drop table if exists t_external_ldbdist_csv_real_006;

-- 创建表t_external_ldbdist_csv_real_006，测试varchar中文字符，值为'你好'
create external table t_external_ldbdist_csv_real_006(
a1 real  
)location('ldbdist://node74:54321/csv/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_006的数据,实际返回空值
select * from t_external_ldbdist_csv_real_006;


-- 删除t_external_ldbdist_csv_real_007表
drop table if exists t_external_ldbdist_csv_real_007;

-- 创建表t_external_ldbdist_csv_real_007，测试varchar中英文字符，值为'你好asdf'
create external table t_external_ldbdist_csv_real_007(
a1 real  
)location('ldbdist://node74:54321/csv/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_007的数据,实际返回空值
select * from t_external_ldbdist_csv_real_007;


-- 删除t_external_ldbdist_csv_real_008表
drop table if exists t_external_ldbdist_csv_real_008;

-- 创建表 t_external_ldbdist_csv_real_008，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_ldbdist_csv_real_008(
a1 real  
)location('ldbdist://node74:54321/csv/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_ldbdist_csv_real_008 的数据,实际返回空值
select * from t_external_ldbdist_csv_real_008


-- 删除 t_external_ldbdist_csv_real_009 表
drop table if exists t_external_ldbdist_csv_real_009;

-- 创建表 t_external_ldbdist_csv_real_009 ，测试varreal中文特殊字符，值为'@#￥%……'
create external table t_external_ldbdist_csv_real_009(
a1 real  
)location('ldbdist://node74:54321/csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_ldbdist_csv_real_009 的数据,实际返回空值
select * from t_external_ldbdist_csv_real_009;

-- 删除 t_external_ldbdist_csv_real_010 表
drop table if exists t_external_ldbdist_csv_real_010;

-- 创建表 t_external_ldbdist_csv_real_010，测试varchar为数字，值为'123456789'
create external table t_external_ldbdist_csv_real_010(
a1 real  
)location('ldbdist://node74:54321/csv/real_005.csv')
format 'csv' (delimiter ',');

--查询 t_external_ldbdist_csv_real_010 的数据,实际返回空值
SELECT * FROM t_external_ldbdist_csv_real_010;

-- 删除t_external_ldbdist_csv_real_011表
drop table if exists t_external_ldbdist_csv_real_011;

-- 创建表t_external_ldbdist_csv_real_011，测试date类型，值为2020-05-08
create external table t_external_ldbdist_csv_real_011(
a1 real  
)location('hdfs://node73:8011/user/testdb73/external_file/csv_type/type_date.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_011的数据,实际返回空值
select * from t_external_ldbdist_csv_real_011;


-- 删除t_external_ldbdist_csv_real_012表
drop table if exists t_external_ldbdist_csv_real_012;

-- 创建表t_external_ldbdist_csv_real_012，测试timestamp，值为2020-05-08 12:19:01
create external table t_external_ldbdist_csv_real_012(
a1 real  
)location('ldbdist://node74:54321/csv/type_timestamp.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_012的数据,实际返回空值
select * from t_external_ldbdist_csv_real_012;


-- 删除 t_external_ldbdist_csv_real_013 表
drop table if exists t_external_ldbdist_csv_real_013;

-- 创建表 t_external_ldbdist_csv_real_013，测试boolean类型，值为false
create external table t_external_ldbdist_csv_real_013(
a1 real  
)location('ldbdist://node74:54321/csv/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询 t_external_ldbdist_csv_real_013 的数据,实际返回空值
select * from t_external_ldbdist_csv_real_013;

-- 删除t_external_ldbdist_csv_real_014表
drop table if exists t_external_ldbdist_csv_real_014;

-- 创建表t_external_ldbdist_csv_real_014，测试boolean类型，值为true
create external table t_external_ldbdist_csv_real_014(
a1 real  
)location('ldbdist://node74:54321/csv/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_014的数据,实际返回空值
select * from t_external_ldbdist_csv_real_014;


-- 删除t_external_ldbdist_csv_real_015表
drop table if exists t_external_ldbdist_csv_real_015;

-- 创建表t_external_ldbdist_csv_real_015，测试空值
create external table t_external_ldbdist_csv_real_015(
a1 real  
)location('ldbdist://node74:54321/csv/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_015的数据,实际返回空值
select * from t_external_ldbdist_csv_real_015;
 
 
-- 删除t_external_ldbdist_csv_real_016表
drop table if exists t_external_ldbdist_csv_real_016;

-- 创建表t_external_ldbdist_csv_real_016，测试空格 
create external table t_external_ldbdist_csv_real_016(
a1 real  
)location('ldbdist://node74:54321/csv/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_016的数据,实际返回空值
select * from t_external_ldbdist_csv_real_016;


-- 删除t_external_ldbdist_csv_real_017表
drop table if exists t_external_ldbdist_csv_real_017;

-- 创建表t_external_ldbdist_csv_real_017，测试null 
create external table t_external_ldbdist_csv_real_017(
a1 real  
)location('ldbdist://node74:54321/csv/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_017的数据,实际返回空值
select * from t_external_ldbdist_csv_real_017;


-- 删除t_external_ldbdist_csv_real_018表
drop table if exists t_external_ldbdist_csv_real_018;

-- 创建表t_external_ldbdist_csv_real_018，测试NULL  
create external table t_external_ldbdist_csv_real_018(
a1 real  
)location('ldbdist://node74:54321/csv/type_NULL.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_real_018的数据,实际返回空值
select * from t_external_ldbdist_csv_real_018;


-- hdfs external parquet 

-- 测试float边界值±1，有效位数
drop table if exists t_external_hdfs_parquet_real_001;
drop table if exists t_external_hdfs_parquet_real_002;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_real_001(
a1 real,
a2 real,
a3 real,
a4 real,
a5 real,
a6 real
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/real1') FORMAT'parquet';

select * from t_external_hdfs_parquet_real_001;


-- 测试smallint的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_real_002(
a1 real,
a2 real,
a3 real,
a4 real,
a5 real,
a6 real,
a7 real,
a8 real,
a9 real,
a10 real,
a11 real,
a12 real,
a13 real
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_real_002;