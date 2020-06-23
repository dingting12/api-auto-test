
--    Description: smallint边界值测试,smallint的数据范围为-32,768/32,767
--    Date:         2020-06-23
--    Author:       丁婷

set echo on 

-- ldb-dist csv格式
-- 测试samllint类型异常值-32769,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_001;

create external table t_external_ldbdist_csv_smallint_001(
a1 smallint  
)location('ldbdist://node74:54321/csv/small_001.csv')
format 'csv' (delimiter ',');

select * from t_external_ldbdist_csv_smallint_001;

-- 测试samllint类型异常值32768,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_002;

create external table t_external_ldbdist_csv_smallint_002(
a1 smallint  
)location('ldbdist://node74:54321/csv/small_002.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_002;

-- 测试超出smallint范围的double类型,数据为32768.1，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_003;

create external table t_external_ldbdist_csv_smallint_003(
a1 smallint  
)location('ldbdist://node74:54321/csv/small_003.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_003;

-- 测试超出smallint范围的varchar类型数字，值为'32768'，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_005;

create external table t_external_ldbdist_csv_smallint_005(
a1 smallint  
)location('ldbdist://node74:54321/csv/varchar_yingwenshuzi.csv')
format 'csv' (delimiter ',');

select * from t_external_ldbdist_csv_smallint_005;

-- 测试varchar英文字母，值为'asdf'，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_006;

create external table t_external_ldbdist_csv_smallint_006(
a1 smallint  
)location('ldbdist://node74:54321/csv/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_006;

--测试varchar中文字符，值为'你好'，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_007;

create external table t_external_ldbdist_csv_smallint_007(
a1 smallint  
)location('ldbdist://node74:54321/csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_007;

--测试varchar中英文字符，值为'你好asdf'，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_008;

create external table t_external_ldbdist_csv_smallint_008(
a1 smallint  
)location('ldbdist://node74:54321/csv/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');

select * from t_external_ldbdist_csv_smallint_008;


-- 测试varchar英文特殊字符，值为'#$%^'，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_009;

create external table t_external_ldbdist_csv_smallint_009(
a1 smallint  
)location('ldbdist://node74:54321/csv/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');

select * from t_external_ldbdist_csv_smallint_009;


--测试varchar中文特殊字符，值为'@#￥%……'，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_010;

create external table t_external_ldbdist_csv_smallint_010(
a1 smallint  
)location('ldbdist://node74:54321/csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
 
select * from t_external_ldbdist_csv_smallint_010;



-- 测试测试date类型，值为2020-05-08，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_011;

create external table t_external_ldbdist_csv_smallint_011(
a1 smallint  
)location('ldbdist://node74:54321/csv/type_date.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_011;


-- 测试测试date类型，值为2020-05-08 12:19:01，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_012;

create external table t_external_ldbdist_csv_smallint_012(
a1 smallint  
)location('ldbdist://node74:54321/csv/type_timestamp.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_012;


-- 测试boolean类型的true ，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_013;

create external table t_external_ldbdist_csv_smallint_013(
a1 smallint  
)location('ldbdist://node74:54321/csv/boolean_true.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_013;


--测试boolean类型的false ，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_014;

create external table t_external_ldbdist_csv_smallint_014(
a1 smallint  
)location('ldbdist://node74:54321/csv/boolean_false.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_014;

 
-- 测试空值，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_015;

create external table t_external_ldbdist_csv_smallint_015(
a1 smallint  
)location('ldbdist://node74:54321/csv/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_015;
 
 
-- 测试空格 ，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_016;

create external table t_external_ldbdist_csv_smallint_016(
a1 smallint  
)location('ldbdist://node74:54321/csv/type_kongge.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_016;


-- 测试null ，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_017;

create external table t_external_ldbdist_csv_smallint_017(
a1 smallint  
)location('ldbdist://node74:54321/csv/type_null.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_017;


-- 测试NULL  ，实际结果是返回空值
drop table if exists t_external_ldbdist_csv_smallint_018;

create external table t_external_ldbdist_csv_smallint_018(
a1 smallint  
)location('ldbdist://node74:54321/csv/type_NULL.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_smallint_018;
