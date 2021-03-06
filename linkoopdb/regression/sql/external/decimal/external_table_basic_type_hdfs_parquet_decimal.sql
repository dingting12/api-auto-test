
--    Description: decimal边界值测试,decimal的范围1=<n<=38
--    Date:         2020-05-28
--    Author:       丁婷


set echo on 

-- hdfs external parquet 

-- 删除表
drop table if exists t_external_hdfs_parquet_decimal_001;
drop table if exists t_external_hdfs_parquet_decimal_002;
drop table if exists t_external_hdfs_parquet_decimal_003;
drop table if exists t_external_hdfs_parquet_decimal_004;
drop table if exists t_external_hdfs_parquet_decimal_005;
drop table if exists t_external_hdfs_parquet_decimal_006;
drop table if exists t_external_hdfs_parquet_decimal_007;
drop table if exists t_external_hdfs_parquet_decimal_008;
drop table if exists t_external_hdfs_parquet_decimal_009;
drop table if exists t_external_hdfs_parquet_decimal_010;
drop table if exists t_external_hdfs_parquet_decimal_011;
drop table if exists t_external_hdfs_parquet_decimal_012;


-- 创建表t_external_ldbdist_csv_decimal_001，测试总长度n>38,创建失败,实际成功
create external table t_external_hdfs_parquet_decimal_001(
a1 decimal(39,1)
)location('HDFSRPC_URL/decimal1_parquet')
FORMAT'parquet';

-- 测试总长度n<1,创建失败，实际创建失败，报precision or scale out of range in statement
create external table t_external_hdfs_parquet_decimal_002(
a1 decimal(0,0) 
)location('HDFSRPC_URL/decimal1_parquet')
FORMAT'parquet';

-- 测试整数部分长度>n-m,例如234.01，应报错,实际返回空值
create external table t_external_hdfs_parquet_decimal_003(
a1 decimal(4,2)  
)location('HDFSRPC_URL/decimal1_parquet')
FORMAT'parquet';
  
--查询t_external_ldbdist_csv_decimal_003的数据
select * from t_external_hdfs_parquet_decimal_003;


--测试m小于0,创建失败，实际报错precision or scale out of range in statement
create external table t_external_hdfs_parquet_decimal_004(
a1 decimal(2,-1)  
)location('HDFSRPC_URL/decimal1_parquet')
FORMAT'parquet';


--测试m大于n,创建失败，实际报错precision or scale out of range in statement
create external table t_external_hdfs_parquet_decimal_005(
a1 decimal(3,6)  
)location('HDFSRPC_URL/decimal1_parquet')
FORMAT'parquet';


-- 测试(*,m),创建失败，实际报错 unexpected token: * 
create external table t_external_hdfs_parquet_decimal_006(
a1 decimal(*,m)  
)location('HDFSRPC_URL/decimal1_parquet')
FORMAT'parquet';

--测试(*),创建失败，实际报错unexpected token: * 
create external table t_external_hdfs_parquet_decimal_007(
a1 decimal(*)  
)location('HDFSRPC_URL/decimal1_parquet')
FORMAT'parquet';
  
-- 测试decimal(n),n设置为39,创建报错，实际创建成功
create external table t_external_hdfs_parquet_decimal_008(
a1 decimal(39)  
)location('HDFSRPC_URL/decimal1_parquet')
FORMAT'parquet';
  
  


--测试decimal默认值是否为(5,0),值为123456，实际为123456
create external table t_external_hdfs_parquet_decimal_009(
a1 decimal  
)location('HDFSRPC_URL/decimal2_parquet')
FORMAT'parquet';

select * from t_external_hdfs_parquet_decimal_009;

--测试decimal(n),n设置为5,值为123456大于5，报错，实际返回空值 
create external table t_external_hdfs_parquet_decimal_010(
a1 decimal(5)  
)location('HDFSRPC_URL/decimal2_parquet')
FORMAT'parquet';
  
select * from t_external_hdfs_parquet_decimal_010;

--测试测试小数部分长度>m，测试decimal默认值是否为(5,0),测试int，varchar
create external table t_external_hdfs_parquet_decimal_011(
a1 decimal(4,2),
a2 decimal,
a3 decimal,
a4 decimal(5),
a5 decimal(5),
a6 decimal(20) ,
a7 decimal(20),
)location('HDFSRPC_URL/decimal3_parquet')
FORMAT'parquet';
  
select * from t_external_hdfs_parquet_decimal_011;


-- 测试varchar，date,timestamp,boolean以及''等异常值
CREATE EXTERNAL TABLE t_external_hdfs_parquet_decimal_012(
a1 decimal,
a2 decimal,
a3 decimal,
a4 decimal,
a5 decimal,
a6 decimal,
a7 decimal,
a8 decimal,
a9 decimal,
a10 decimal,
a11 decimal,
a12 decimal,
a13 decimal
)
LOCATION ('HDFSRPC_URL/common_decimal_parquet') FORMAT'parquet';

select * from t_external_hdfs_parquet_decimal_012;