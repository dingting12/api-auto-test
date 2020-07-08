
--    Description: decimal边界值测试,decimal的范围1=<n<=38
--    Date:         2020-05-28
--    Author:       丁婷

set echo on 
--    ldbdist external csv格式

-- 删除t_external_ldbdist_csv_decimal_001表
drop table if exists t_external_ldbdist_csv_decimal_001;

-- 创建表t_external_ldbdist_csv_decimal_001，测试总长度n>38,创建失败,实际成功
create external table t_external_ldbdist_csv_decimal_001(
a1 decimal(39,1)
)location('LDBDIST_URL/csv/decimal_001.csv')
format 'csv' (delimiter ',');


-- 删除t_external_ldbdist_csv_decimal_002表
drop table if exists t_external_ldbdist_csv_decimal_002;

-- 创建表t_external_ldbdist_csv_decimal_002，测试总长度n<1,创建失败，实际创建失败，报precision or scale out of range in statement
create external table t_external_ldbdist_csv_decimal_002(
a1 decimal(0,0) 
)location('LDBDIST_URL/csv/decimal_001.csv')
format 'csv' (delimiter ',');
  


-- 删除t_external_ldbdist_csv_decimal_003表
drop table if exists t_external_ldbdist_csv_decimal_003;

-- 创建表t_external_ldbdist_csv_decimal_003，测试整数部分长度>n-m,例如234.01，应报错,实际返回空值
create external table t_external_ldbdist_csv_decimal_003(
a1 decimal(4,2)  
)location('LDBDIST_URL/csv/decimal_001.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_003的数据
select * from t_external_ldbdist_csv_decimal_003;


-- 删除t_external_ldbdist_csv_decimal_004表
drop table if exists t_external_ldbdist_csv_decimal_004;

-- 创建表t_external_ldbdist_csv_decimal_004，测试小数部分长度>m,例如23.7389,小数点后m位向右的数字被舍入，实际结果为23.74
create external table t_external_ldbdist_csv_decimal_004(
a1 decimal(4,2)   
)location('LDBDIST_URL/csv/decimal_002.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_004的数据
select * from t_external_ldbdist_csv_decimal_004;


-- 删除t_external_ldbdist_csv_decimal_005表
drop table if exists t_external_ldbdist_csv_decimal_005;

-- 创建表t_external_ldbdist_csv_decimal_005，测试m小于0,创建失败，实际报错precision or scale out of range in statement
create external table t_external_ldbdist_csv_decimal_005(
a1 decimal(2,-1)  
)location('LDBDIST_URL/csv/decimal_002.csv')
format 'csv' (delimiter ',');
  

-- 删除t_external_ldbdist_csv_decimal_006表
drop table if exists t_external_ldbdist_csv_decimal_006;

-- 创建表t_external_ldbdist_csv_decimal_006，测试m大于n,创建失败，实际报错precision or scale out of range in statement
create external table t_external_ldbdist_csv_decimal_006(
a1 decimal(3,6)  
)location('LDBDIST_URL/csv/decimal_002.csv')
format 'csv' (delimiter ',');



-- 删除t_external_ldbdist_csv_decimal_007表
drop table if exists t_external_ldbdist_csv_decimal_007;

-- 创建表t_external_ldbdist_csv_decimal_007，测试decimal默认值是否为(5,0),值为12345,12345.19，实际结果为12345
create external table t_external_ldbdist_csv_decimal_007(
a1 decimal  
)location('LDBDIST_URL/csv/decimal_003.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_007的数据
select * from t_external_ldbdist_csv_decimal_007;


-- 删除t_external_ldbdist_csv_decimal_008表
drop table if exists t_external_ldbdist_csv_decimal_008;

-- 创建表t_external_ldbdist_csv_decimal_008，测试decimal默认值是否为(5,0),值为123456，实际为123456
create external table t_external_ldbdist_csv_decimal_008(
a1 decimal  
)location('LDBDIST_URL/csv/decimal_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_008的数据
select * from t_external_ldbdist_csv_decimal_008;


-- 删除t_external_ldbdist_csv_decimal_009表
drop table if exists t_external_ldbdist_csv_decimal_009;

-- 创建表t_external_ldbdist_csv_decimal_009，测试(*,m),创建失败，实际报错 unexpected token: * 
create external table t_external_ldbdist_csv_decimal_009(
a1 decimal(*,m)  
)location('LDBDIST_URL/csv/decimal_004.csv')
format 'csv' (delimiter ',');


-- 删除t_external_ldbdist_csv_decimal_010表
drop table if exists t_external_ldbdist_csv_decimal_010;

-- 创建表t_external_ldbdist_csv_decimal_010，测试(*),创建失败，实际报错unexpected token: * 
create external table t_external_ldbdist_csv_decimal_010(
a1 decimal(*)  
)location('LDBDIST_URL/csv/decimal_004.csv')
format 'csv' (delimiter ',');
  

-- 删除t_external_ldbdist_csv_decimal_011表
drop table if exists t_external_ldbdist_csv_decimal_011;

-- 创建表t_external_ldbdist_csv_decimal_011，测试decimal(n),n设置为39,创建报错，实际创建成功
create external table t_external_ldbdist_csv_decimal_011(
a1 decimal(39)  
)location('LDBDIST_URL/csv/decimal_004.csv')
format 'csv' (delimiter ',');
  


-- 创建表t_external_ldbdist_csv_decimal_012，测试decimal(n),n设置为5,值为123456大于5，报错，实际返回空值
create external table t_external_ldbdist_csv_decimal_012(
a1 decimal(5)  
)location('LDBDIST_URL/csv/decimal_004.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_012的数据
select * from t_external_ldbdist_csv_decimal_012;


-- 删除t_external_ldbdist_csv_decimal_013表
drop table if exists t_external_ldbdist_csv_decimal_013;

-- 创建表t_external_ldbdist_csv_decimal_013，测试decimal(n),n设置为5,值为12345.12,或者为1234，实际为12345和1234
create external table t_external_ldbdist_csv_decimal_013(
a1 decimal(5)

)location('LDBDIST_URL/csv/decimal_005.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_013的数据
select * from t_external_ldbdist_csv_decimal_013;


-- 删除t_external_ldbdist_csv_decimal_015表
drop table if exists t_external_ldbdist_csv_decimal_015;

-- 创建表t_external_ldbdist_csv_decimal_015，测试空值
create external table t_external_ldbdist_csv_decimal_015(
a1 decimal  
)location('LDBDIST_URL/csv/type_kongzhi.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_015的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_015;
 
 
-- 删除t_external_ldbdist_csv_decimal_016表
drop table if exists t_external_ldbdist_csv_decimal_016;

-- 创建表t_external_ldbdist_csv_decimal_016，测试空格 
create external table t_external_ldbdist_csv_decimal_016(
a1 decimal  
)location('LDBDIST_URL/csv/type_kongge.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_016的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_016;


-- 删除t_external_ldbdist_csv_decimal_017表
drop table if exists t_external_ldbdist_csv_decimal_017;

-- 创建表t_external_ldbdist_csv_decimal_017，测试null 
create external table t_external_ldbdist_csv_decimal_017(
a1 decimal  
)location('LDBDIST_URL/csv/type_null.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_017的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_017;


-- 删除t_external_ldbdist_csv_decimal_018表
drop table if exists t_external_ldbdist_csv_decimal_018;

-- 创建表t_external_ldbdist_csv_decimal_018，测试NULL  
create external table t_external_ldbdist_csv_decimal_018(
a1 decimal  
)location('LDBDIST_URL/csv/type_NULL1.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_018的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_018;


-- 删除t_external_ldbdist_csv_decimal_019表
drop table if exists t_external_ldbdist_csv_decimal_019;

-- 创建表t_external_ldbdist_csv_decimal_019，测试int类型，值为1147483647
create external table t_external_ldbdist_csv_decimal_019(
a1 decimal(10)  
)location('LDBDIST_URL/csv/decimal_006.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_019的数据，返回1147483647
select * from t_external_ldbdist_csv_decimal_019;

-- 删除t_external_ldbdist_csv_decimal_020表
drop table if exists t_external_ldbdist_csv_decimal_020;

-- 创建表t_external_ldbdist_csv_decimal_020，测试date类型，值为2020-01-01
create external table t_external_ldbdist_csv_decimal_020(
a1 decimal  
)location('LDBDIST_URL/csv/type_date.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_020的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_020;


-- 删除t_external_ldbdist_csv_decimal_021表
drop table if exists t_external_ldbdist_csv_decimal_021;

-- 创建表t_external_ldbdist_csv_decimal_021，测试boolean类型，值为false
create external table t_external_ldbdist_csv_decimal_021(
a1 decimal  
)location('LDBDIST_URL/csv/boolean_false.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_021的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_021;


-- 删除t_external_ldbdist_csv_decimal_022表
drop table if exists t_external_ldbdist_csv_decimal_022;

-- 创建表t_external_ldbdist_csv_decimal_022，测试boolean类型，值为true
create external table t_external_ldbdist_csv_decimal_022(
a1 decimal  
)location('LDBDIST_URL/csv/boolean_true.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_022的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_022;


-- 删除t_external_ldbdist_csv_decimal_023表
drop table if exists t_external_ldbdist_csv_decimal_023;

-- 创建表t_external_ldbdist_csv_decimal_023，测试timestamp，值为2020-05-08 12:19:01
create external table t_external_ldbdist_csv_decimal_023(
a1 decimal  
)location('LDBDIST_URL/csv/type_timestamp.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_023的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_023;

-- 删除t_external_ldbdist_csv_decimal_024表
drop table if exists t_external_ldbdist_csv_decimal_024;

-- 创建表t_external_ldbdist_csv_decimal_024，测试varchar英文字母，值为'asdf'
create external table t_external_ldbdist_csv_decimal_024(
a1 decimal  
)location('LDBDIST_URL/csv/varchar_yingwenzimu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_024的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_024;


-- 删除t_external_ldbdist_csv_decimal_025表
drop table if exists t_external_ldbdist_csv_decimal_025;

-- 创建表t_external_ldbdist_csv_decimal_025，测试varchar中文字符，值为'你好'
create external table t_external_ldbdist_csv_decimal_025(
a1 decimal  
)location('LDBDIST_URL/csv/varchar_zhongwen.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_025的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_025;


-- 删除t_external_ldbdist_csv_decimal_026表
drop table if exists t_external_ldbdist_csv_decimal_026;

-- 创建表t_external_ldbdist_csv_decimal_026，测试varchar中英文字符，值为'你好asdf'
create external table t_external_ldbdist_csv_decimal_026(
a1 decimal  
)location('LDBDIST_URL/csv/varchar_zhongyinghunhe.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_026的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_026;


-- 删除t_external_ldbdist_csv_decimal_027表
drop table if exists t_external_ldbdist_csv_decimal_027;

-- 创建表t_external_ldbdist_csv_decimal_027，测试varchar英文特殊字符，值为'#$%^'
create external table t_external_ldbdist_csv_decimal_027(
a1 decimal  
)location('LDBDIST_URL/csv/varchar_yingwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_027的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_027;


-- 删除t_external_ldbdist_csv_decimal_028表
drop table if exists t_external_ldbdist_csv_decimal_028;

-- 创建表t_external_ldbdist_csv_decimal_028，测试varchar中文特殊字符，值为'@#￥%……'
create external table t_external_ldbdist_csv_decimal_028(
a1 decimal  
)location('LDBDIST_URL/csv/varchar_zhongwenzifu.csv')
format 'csv' (delimiter ',');
  
--查询t_external_ldbdist_csv_decimal_028的数据，实际返回空值
select * from t_external_ldbdist_csv_decimal_028;

-- 删除t_external_ldbdist_csv_decimal_029表
drop table if exists t_external_ldbdist_csv_decimal_029;

-- 创建表t_external_ldbdist_csv_decimal_029，测试varchar为数字，值为'123456789'
create external table t_external_ldbdist_csv_decimal_029(
a1 decimal  
)location('LDBDIST_URL/csv/decimal_007.csv')
format 'csv' (delimiter ',');

--查询t_external_ldbdist_csv_decimal_029的数据，实际返回空值
SELECT * FROM t_external_ldbdist_csv_decimal_029;
