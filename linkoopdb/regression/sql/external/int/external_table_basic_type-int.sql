
--    Description: int边界值测试,int的数值范围是-2,147,483,648/2,147,483,647
--    Date:         2020-05-28
--    Author:       丁婷
--    hdfs external csv格式

-- 测试int类型异常值-2147483649,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_001;

create external table t_external_hdfs_csv_int_001(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/int_001.csv')
format 'csv' (delimiter ',');

select * from t_external_hdfs_csv_int_001;


-- 测试samllint类型异常值2147483648,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_002;

create external table t_external_hdfs_csv_int_002(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/int_002.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_002;


-- 测试超出int范围的double类型,数据为2147483648.01,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_003;

create external table t_external_hdfs_csv_int_003(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/int_003.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_003;


-- 测试超出int范围的varchar类型数字，值为'2147483648',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_005;

create external table t_external_hdfs_csv_int_005(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/int_005.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_005;



-- 测试varchar英文字母，值为'asdf',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_006;

create external table t_external_hdfs_csv_int_006(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_006;


-- 测试varchar中文字符，值为'你好',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_007;

create external table t_external_hdfs_csv_int_007(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_007;


-- 测试varchar中英文字符，值为'你好asdf',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_008;

create external table t_external_hdfs_csv_int_008(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_008;


-- 测试varchar英文特殊字符，值为'#$%^',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_009;

create external table t_external_hdfs_csv_int_009(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_009;


-- 测试varchar中文特殊字符，值为'@#￥%……',实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_010;

create external table t_external_hdfs_csv_int_010(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_010;



-- 测试测试date类型，值为2020-05-08,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_011;

create external table t_external_hdfs_csv_int_011(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_date.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_011;


-- 测试timestamp类型，值为2020-05-08 12:19:01,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_012;

create external table t_external_hdfs_csv_int_012(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_timestamp.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_012;


--测试boolean类型的true ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_013;

create external table t_external_hdfs_csv_int_013(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_true.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_013;


-- 测试boolean类型的false ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_014;

create external table t_external_hdfs_csv_int_014(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_false.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_014;

 
-- 测试空值,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_015;

create external table t_external_hdfs_csv_int_015(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_015;
 
 
-- 测试空格 ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_016;

create external table t_external_hdfs_csv_int_016(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_016;


-- 测试null ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_017;

create external table t_external_hdfs_csv_int_017(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_017;


-- 测试NULL  ,实际结果是返回空值
drop table if exists t_external_hdfs_csv_int_018;

create external table t_external_hdfs_csv_int_018(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
select * from t_external_hdfs_csv_int_018;


-- ldbdist csv格式
-- 测试int类型异常值-2147483649,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_001;

create external table t_external_ldbdist_csv_int_001(
a1 int  
)location('ldbdist://node74:54321/csv/int_001.csv')
format 'csv' (delimiter ',');

select * from t_external_ldbdist_csv_int_001;


-- 测试samllint类型异常值2147483648,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_002;

create external table t_external_ldbdist_csv_int_002(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/int_002.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_002;


-- 测试超出int范围的double类型,数据为2147483648.01,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_003;

create external table t_external_ldbdist_csv_int_003(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/int_003.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_003;


-- 测试超出int范围的varchar类型数字，值为'2147483648',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_005;

create external table t_external_ldbdist_csv_int_005(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/int_005.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_005;



-- 测试varchar英文字母，值为'asdf',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_006;

create external table t_external_ldbdist_csv_int_006(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_006;


-- 测试varchar中文字符，值为'你好',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_007;

create external table t_external_ldbdist_csv_int_007(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_007;


-- 测试varchar中英文字符，值为'你好asdf',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_008;

create external table t_external_ldbdist_csv_int_008(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_008;


-- 测试varchar英文特殊字符，值为'#$%^',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_009;

create external table t_external_ldbdist_csv_int_009(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_009;


-- 测试varchar中文特殊字符，值为'@#￥%……',实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_010;

create external table t_external_ldbdist_csv_int_010(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_010;



-- 测试测试date类型，值为2020-05-08,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_011;

create external table t_external_ldbdist_csv_int_011(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_date.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_011;


-- 测试timestamp类型，值为2020-05-08 12:19:01,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_012;

create external table t_external_ldbdist_csv_int_012(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_timestamp.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_012;


--测试boolean类型的true ,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_013;

create external table t_external_ldbdist_csv_int_013(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_true.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_013;


-- 测试boolean类型的false ,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_014;

create external table t_external_ldbdist_csv_int_014(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/boolean_false.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_014;

 
-- 测试空值,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_015;

create external table t_external_ldbdist_csv_int_015(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_015;
 
 
-- 测试空格 ,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_016;

create external table t_external_ldbdist_csv_int_016(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_kongge.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_016;


-- 测试null ,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_017;

create external table t_external_ldbdist_csv_int_017(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_null.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_017;


-- 测试NULL  ,实际结果是返回空值
drop table if exists t_external_ldbdist_csv_int_018;

create external table t_external_ldbdist_csv_int_018(
a1 int  
)location('hdfs://node73:8020/user/testdb73/external_file/csv_type/type_NULL.csv')
format 'csv' (delimiter ',');
  
select * from t_external_ldbdist_csv_int_018;


-- hdfs external parquet 

-- 测试smallint边界值±1，超过smallint范围的double,以及超出smallint范围的varchar类型数字
drop table if exists t_external_hdfs_parquet_int_001;
drop table if exists t_external_hdfs_parquet_int_002;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_int_001(
a1 int,
a2 int,
a3 int,
a4 int
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/int1') FORMAT'parquet';

select * from t_external_hdfs_parquet_int_001;


-- 测试smallint的varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_int_002(
a1 int,
a2 int,
a3 int,
a4 int,
a5 int,
a6 int,
a7 int,
a8 int,
a9 int,
a10 int,
a11 int,
a12 int,
a13 int
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_int_002;