--    Description: bigint边界值测试,bigint的数值范围是-9223372036854775808/9223372036854775807
--    Date:         2020-05-28
--    Author:       丁婷
--    hdfs external csv格式

-- 测试bigint类型异常值-9223372036854775809,实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_001;

create external table t_external_hdfs_csv_bigint_001(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/bigint_001.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_001;


--测试samllbigint类型异常值9223372036854775808,实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_002;

create external table t_external_hdfs_csv_bigint_002(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/bigint_002.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_002;


-- 测试超出bigint范围的double类型,数据为9223372036854775808.01,实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_003;

create external table t_external_hdfs_csv_bigint_003(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/bigint_003.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_003;


--测试超出bigint范围的varchar类型数字，值为'9223372036854775808',实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_005;

create external table t_external_hdfs_csv_bigint_005(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/bigint_005.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_005;



--测试varchar英文字母，值为'asdf',实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_006;

create external table t_external_hdfs_csv_bigint_006(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_006;


-- 测试varchar中文字符，值为'你好',实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_007;

create external table t_external_hdfs_csv_bigint_007(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_007;


-- 测试varchar中英文字符，值为'你好asdf',实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_008;

create external table t_external_hdfs_csv_bigint_008(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_008;


-- 测试varchar英文特殊字符，值为'#$%^',实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_009;

create external table t_external_hdfs_csv_bigint_009(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_009;


-- 测试varchar中文特殊字符，值为@#￥%……,实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_010;

create external table t_external_hdfs_csv_bigint_010(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_010;



-- 测试测试date类型，值为2020-05-08,实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_011;

create external table t_external_hdfs_csv_bigint_011(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_date.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_011;


-- 测试测试timestamp类型，值为2020-05-08 12:19:01,实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_012;

create external table t_external_hdfs_csv_bigint_012(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_timestamp.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_012;


-- 测试boolean类型的true ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_013;

create external table t_external_hdfs_csv_bigint_013(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_true.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_013;


-- 测试boolean类型的false,实际结果是返回空值 
drop table if exists t_external_hdfs_csv_bigint_014;

create external table t_external_hdfs_csv_bigint_014(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_false.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_014;

 
-- 测试空值,实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_015;

create external table t_external_hdfs_csv_bigint_015(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_015;
 
 
-- 测试空格 ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_bigint_016;

create external table t_external_hdfs_csv_bigint_016(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_016;


-- 测试null,实际结果是返回空值 
drop table if exists t_external_hdfs_csv_bigint_017;

create external table t_external_hdfs_csv_bigint_017(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_017;


--  测试NULL,实际结果是返回空值 
drop table if exists t_external_hdfs_csv_bigint_018;

create external table t_external_hdfs_csv_bigint_018(
a1 bigint  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_bigint_018;


-- ldbdist csv 
-- 测试bigint类型异常值-9223372036854775809,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_001;

create external table t_external_ldbdist_csv_bigint_001(
a1 bigint  
)location('ldbdist://node74:54321/csv/bigint_001.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_001;


--测试samllbigint类型异常值9223372036854775808,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_002;

create external table t_external_ldbdist_csv_bigint_002(
a1 bigint  
)location('ldbdist://node74:54321/csv/bigint_002.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_002;


-- 测试超出bigint范围的double类型,数据为9223372036854775808.01,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_003;

create external table t_external_ldbdist_csv_bigint_003(
a1 bigint  
)location('ldbdist://node74:54321/csv/bigint_003.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_003;


--测试超出bigint范围的varchar类型数字，值为'9223372036854775808',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_005;

create external table t_external_ldbdist_csv_bigint_005(
a1 bigint  
)location('ldbdist://node74:54321/csv/bigint_005.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_005;



--测试varchar英文字母，值为'asdf',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_006;

create external table t_external_ldbdist_csv_bigint_006(
a1 bigint  
)location('ldbdist://node74:54321/csv/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_006;


-- 测试varchar中文字符，值为'你好',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_007;

create external table t_external_ldbdist_csv_bigint_007(
a1 bigint  
)location('ldbdist://node74:54321/csv/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_007;


-- 测试varchar中英文字符，值为'你好asdf',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_008;

create external table t_external_ldbdist_csv_bigint_008(
a1 bigint  
)location('ldbdist://node74:54321/csv/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_008;


-- 测试varchar英文特殊字符，值为'#$%^',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_009;

create external table t_external_ldbdist_csv_bigint_009(
a1 bigint  
)location('ldbdist://node74:54321/csv/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_009;


-- 测试varchar中文特殊字符，值为@#￥%……,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_010;

create external table t_external_ldbdist_csv_bigint_010(
a1 bigint  
)location('ldbdist://node74:54321/csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_010;



-- 测试测试date类型，值为2020-05-08,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_011;

create external table t_external_ldbdist_csv_bigint_011(
a1 bigint  
)location('ldbdist://node74:54321/csv/type_date.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_011;


-- 测试测试timestamp类型，值为2020-05-08 12:19:01,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_012;

create external table t_external_ldbdist_csv_bigint_012(
a1 bigint  
)location('ldbdist://node74:54321/csv/type_timestamp.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_012;


-- 测试boolean类型的true ,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_013;

create external table t_external_ldbdist_csv_bigint_013(
a1 bigint  
)location('ldbdist://node74:54321/csv/boolean_true.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_013;


-- 测试boolean类型的false,实际结果是返回空值 
drop table if exists t_external_ldbdist_csv_bigint_014;

create external table t_external_ldbdist_csv_bigint_014(
a1 bigint  
)location('ldbdist://node74:54321/csv/boolean_false.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_014;

 
-- 测试空值,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_015;

create external table t_external_ldbdist_csv_bigint_015(
a1 bigint  
)location('ldbdist://node74:54321/csv/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_015;
 
 
-- 测试空格 ,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_bigint_016;

create external table t_external_ldbdist_csv_bigint_016(
a1 bigint  
)location('ldbdist://node74:54321/csv/type_kongge.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_016;


-- 测试null,实际结果是返回空值 
drop table if exists t_external_ldbdist_csv_bigint_017;

create external table t_external_ldbdist_csv_bigint_017(
a1 bigint  
)location('ldbdist://node74:54321/csv/type_null.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_017;


--  测试NULL,实际结果是返回空值 
drop table if exists t_external_ldbdist_csv_bigint_018;

create external table t_external_ldbdist_csv_bigint_018(
a1 bigint  
)location('ldbdist://node74:54321/csv/type_NULL.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_bigint_018;


-- hdfs external parquet 

-- 测试smallint边界值±1，超过smallint范围的double,以及超出smallint范围的varchar类型数字
drop table if exists t_external_hdfs_parquet_bigint_001;
drop table if exists t_external_hdfs_parquet_bigint_002;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_bigint_001(
a1 bigint,
a2 bigint,
a3 bigint,
a4 bigint
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/bigint1') FORMAT 'parquet';

select * from t_external_hdfs_parquet_bigint_001;


-- 测试smallint的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_bigint_002(
a1 bigint,
a2 bigint,
a3 bigint,
a4 bigint,
a5 bigint,
a6 bigint,
a7 bigint,
a8 bigint,
a9 bigint,
a10 bigint,
a11 bigint,
a12 bigint,
a13 bigint
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_bigint_002;