--    Description: bigint边界值测试,bigint的数值范围是-9223372036854775808/9223372036854775807
--    Date:         2020-06-23
--    Author:       丁婷

set echo on 

-- ldbdist csv 
-- 测试bigint类型异常值-9223372036854775809,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_001;

create external table t_external_ldbdist_csv_bigint_001(
a1 bigint  
)location('LDBDIST_URL/csv/bigint_001.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_001;


--测试samllbigint类型异常值9223372036854775808,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_002;

create external table t_external_ldbdist_csv_bigint_002(
a1 bigint  
)location('LDBDIST_URL/csv/bigint_002.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_002;


-- 测试超出bigint范围的double类型,数据为9223372036854775808.01,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_003;

create external table t_external_ldbdist_csv_bigint_003(
a1 bigint  
)location('LDBDIST_URL/csv/bigint_003.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_003;


--测试超出bigint范围的varchar类型数字，值为'9223372036854775808',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_005;

create external table t_external_ldbdist_csv_bigint_005(
a1 bigint  
)location('LDBDIST_URL/csv/bigint_005.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_005;



--测试varchar英文字母，值为'asdf',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_006;

create external table t_external_ldbdist_csv_bigint_006(
a1 bigint  
)location('LDBDIST_URL/csv/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_006;


-- 测试varchar中文字符，值为'你好',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_007;

create external table t_external_ldbdist_csv_bigint_007(
a1 bigint  
)location('LDBDIST_URL/csv/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_007;


-- 测试varchar中英文字符，值为'你好asdf',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_008;

create external table t_external_ldbdist_csv_bigint_008(
a1 bigint  
)location('LDBDIST_URL/csv/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_008;


-- 测试varchar英文特殊字符，值为'#$%^',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_009;

create external table t_external_ldbdist_csv_bigint_009(
a1 bigint  
)location('LDBDIST_URL/csv/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_009;


-- 测试varchar中文特殊字符，值为@#￥%……,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_010;

create external table t_external_ldbdist_csv_bigint_010(
a1 bigint  
)location('LDBDIST_URL/csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_010;



-- 测试测试date类型，值为2020-05-08,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_011;

create external table t_external_ldbdist_csv_bigint_011(
a1 bigint  
)location('LDBDIST_URL/csv/type_date.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_011;


-- 测试测试timestamp类型，值为2020-05-08 12:19:01,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_012;

create external table t_external_ldbdist_csv_bigint_012(
a1 bigint  
)location('LDBDIST_URL/csv/type_timestamp.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_012;


-- 测试boolean类型的true ,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_013;

create external table t_external_ldbdist_csv_bigint_013(
a1 bigint  
)location('LDBDIST_URL/csv/boolean_true.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_013;


-- 测试boolean类型的false,实际结果是返回空值 
drop table if exists t_external_ldbdist_csv_bigint_014;

create external table t_external_ldbdist_csv_bigint_014(
a1 bigint  
)location('LDBDIST_URL/csv/boolean_false.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_014;

 
-- 测试空值,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_015;

create external table t_external_ldbdist_csv_bigint_015(
a1 bigint  
)location('LDBDIST_URL/csv/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_015;
 
 
-- 测试空格 ,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_016;

create external table t_external_ldbdist_csv_bigint_016(
a1 bigint  
)location('LDBDIST_URL/csv/type_kongge.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_016;


-- 测试null,实际结果是返回空值 
drop table if exists t_external_ldbdist_csv_bigint_017;

create external table t_external_ldbdist_csv_bigint_017(
a1 bigint  
)location('LDBDIST_URL/csv/type_null.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_017;


--  测试NULL,实际结果是返回空值 
drop table if exists t_external_ldbdist_csv_bigint_018;

create external table t_external_ldbdist_csv_bigint_018(
a1 bigint  
)location('LDBDIST_URL/csv/type_NULL1.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_018;
