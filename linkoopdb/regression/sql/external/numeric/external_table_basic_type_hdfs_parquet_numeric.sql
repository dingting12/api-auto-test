--    Description: numeric边界值测试,numeric的范围1=<n<=38
--    Date:         2020-06-23
--    Author:       丁婷
--    hdfs external parquet格式

set echo on

-- 删除表
drop table if exists t_external_hdfs_parquet_numeric_001;
drop table if exists t_external_hdfs_parquet_numeric_002;
drop table if exists t_external_hdfs_parquet_numeric_003;
drop table if exists t_external_hdfs_parquet_numeric_004;
drop table if exists t_external_hdfs_parquet_numeric_005;
drop table if exists t_external_hdfs_parquet_numeric_006;
drop table if exists t_external_hdfs_parquet_numeric_007;
drop table if exists t_external_hdfs_parquet_numeric_008;
drop table if exists t_external_hdfs_parquet_numeric_009;
drop table if exists t_external_hdfs_parquet_numeric_010
drop table if exists t_external_hdfs_parquet_numeric_011;
drop table if exists t_external_hdfs_parquet_numeric_012;


-- 创建表t_external_ldbdist_csv_numeric_001，测试总长度n>38,创建失败,实际成功
create external table t_external_hdfs_parquet_numeric_001(
a1 numeric(39,1)
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric1')
FORMAT'parquet';

-- 测试总长度n<1,创建失败，实际创建失败，报precision or scale out of range in statement
create external table t_external_hdfs_parquet_numeric_002(
a1 numeric(0,0) 
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric1')
FORMAT'parquet';

-- 测试整数部分长度>n-m,例如234.01，应报错,实际返回空值
create external table t_external_hdfs_parquet_numeric_003(
a1 numeric(4,2)  
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric1')
FORMAT'parquet';
  
--查询t_external_ldbdist_csv_numeric_003的数据
select * from t_external_hdfs_parquet_numeric_003;


--测试m小于0,创建失败，实际报错precision or scale out of range in statement
create external table t_external_hdfs_parquet_numeric_004(
a1 numeric(2,-1)  
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric1')
FORMAT'parquet';


--测试m大于n,创建失败，实际报错precision or scale out of range in statement
create external table t_external_hdfs_parquet_numeric_005(
a1 numeric(3,6)  
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric1')
FORMAT'parquet';


-- 测试(*,m),创建失败，实际报错 unexpected token: * 
create external table t_external_hdfs_parquet_numeric_006(
a1 numeric(*,m)  
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric1')
FORMAT'parquet';

--测试(*),创建失败，实际报错unexpected token: * 
create external table t_external_hdfs_parquet_numeric_007(
a1 numeric(*)  
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric1')
FORMAT'parquet';
  
-- 测试numeric(n),n设置为39,创建报错，实际创建成功
create external table t_external_hdfs_parquet_numeric_008(
a1 numeric(39)  
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric1')
FORMAT'parquet';
  
  


--测试numeric默认值是否为(5,0),值为123456，实际为123456
create external table t_external_hdfs_parquet_numeric_009(
a1 numeric  
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric2')
FORMAT'parquet';

select * from t_external_hdfs_parquet_numeric_009;

--测试numeric(n),n设置为5,值为123456大于5，报错，实际返回空值 
create external table t_external_hdfs_parquet_numeric_010(
a1 numeric(5)  
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric2')
FORMAT'parquet';
  
select * from t_external_hdfs_parquet_numeric_010;

--测试测试小数部分长度>m，测试numeric默认值是否为(5,0),测试int，varchar
create external table t_external_hdfs_parquet_numeric_011(
a1 numeric(4,2),
a2 numeric,
a3 numeric,
a4 numeric(5),
a5 numeric(5),
a6 numeric(20) ,
a7 numeric(20),
)location('hdfs://node73:8020/user/testdb73/external_file/type_parquet/numeric3')
FORMAT'parquet';
  
select * from t_external_hdfs_parquet_numeric_011;


-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_numeric_012(
a1 numeric,
a2 numeric,
a3 numeric,
a4 numeric,
a5 numeric,
a6 numeric,
a7 numeric,
a8 numeric,
a9 numeric,
a10 numeric,
a11 numeric,
a12 numeric,
a13 numeric
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/type_parquet/common1') FORMAT'parquet';

select * from t_external_hdfs_parquet_numeric_012;