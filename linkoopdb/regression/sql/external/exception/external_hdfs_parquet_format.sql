--    Description: 测试external hdfs parquet格式
--    Date:         2020-06-19
--    Author:       丁婷
set echo on

drop table if exists t_external_hdfs_parquet_001;
drop table if exists t_external_hdfs_parquet_002;
drop table if exists t_external_hdfs_parquet_003;
drop table if exists t_external_hdfs_parquet_004;
drop table if exists t_external_hdfs_parquet_005;
drop table if exists t_external_hdfs_parquet_006;
drop table if exists t_external_hdfs_parquet_007;
drop table if exists t_external_hdfs_parquet_008;
drop table if exists t_external_hdfs_parquet_009;
drop table if exists t_external_hdfs_parquet_010;
drop table if exists t_external_hdfs_parquet_011;
drop table if exists t_external_hdfs_parquet_012;
drop table if exists t_external_hdfs_parquet_013;
drop table if exists t_external_hdfs_parquet_014;
drop table if exists t_external_hdfs_parquet_015;
drop table if exists t_external_hdfs_parquet_016;
drop table if exists t_external_hdfs_parquet_017;
drop table if exists t_external_hdfs_parquet_018;

-- 测试EXTERNAL关键字未写，创建表需报错明确
CREATE  TABLE t_external_hdfs_parquet_001(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquet' ;

-- 测试EXTERNAL关键字写错，创建表需报错明确
CREATE EXTERNAL1 TABLE t_external_hdfs_parquet_002(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquet' ;

-- 测试format关键字未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_003(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet');
 

-- 测试format关键字写错，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_004(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format1 'parquet' ;
 
 -- 测试format值写错，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_005(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquetq' ;

 -- 测试format值双引号，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_006(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format "parquet" ;


 -- 测试format值未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_007(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format;

 -- 测试format关键字未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_016(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
'csv';

 -- 测试location值未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_008(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location
format 'parquet';

 -- 测试location未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_009(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) ('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquet';

 -- 测试location写错，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_010(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location2('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquet';

 -- 测试location值写错，使用时报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_011(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb731/external_file/ldb_parquet')
format 'parquet';

select * from t_external_hdfs_parquet_011;

 -- 测试location值写错，使用时报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_018(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/node74/stream74/linkoopdb/data/ldb_parquet')
format 'parquet';

select * from t_external_hdfs_parquet_018;


 -- 测试location和值未写，使用时报错明确
CREATE EXTERNAL TABLE t_external_hdfs_parquet_017(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) 
format 'parquet';



-- 测试参数recursiveFileLookup默认值为false，ignoreCorruptFiles和ignoreMissingFiles为true
CREATE EXTERNAL TABLE t_external_hdfs_parquet_012(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquet' ;


-- 由于hdfs://node73:8020/user/testdb73/external_file/ldb_parquet路径下存在transactions-log文件，因此需设置以下两个参数
set session work 'ldb.source.files.ignoreCorruptFiles' true;
set session work 'ldb.source.files.ignoreMissingFiles' true;

select * from t_external_hdfs_parquet_012 order by id;



-- 测试参数recursiveFileLookup默认值为false,ignoreCorruptFiles和ignoreMissingFiles为false
CREATE EXTERNAL TABLE t_external_hdfs_parquet_013(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquet' ;

-- 由于hdfs://node73:8020/user/testdb73/external_file/ldb_parquet路径下存在transactions-log文件，因此需设置以下两个参数
set session work 'ldb.source.files.ignoreCorruptFiles' false;
set session work 'ldb.source.files.ignoreMissingFiles' false;

select * from t_external_hdfs_parquet_013;


-- 测试参数recursiveFileLookup值为true,ignoreCorruptFiles和ignoreMissingFiles为true
CREATE EXTERNAL TABLE t_external_hdfs_parquet_014(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquet' properties(
'recursiveFileLookup':'true');;

set session work 'ldb.source.files.ignoreCorruptFiles' true;
set session work 'ldb.source.files.ignoreMissingFiles' true;
select * from t_external_hdfs_parquet_014 order by id;



-- 测试参数recursiveFileLookup值为true,ignoreCorruptFiles和ignoreMissingFiles为false
CREATE EXTERNAL TABLE t_external_hdfs_parquet_015(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquet' properties(
'recursiveFileLookup':'true');;

set session work 'ldb.source.files.ignoreCorruptFiles' false;
set session work 'ldb.source.files.ignoreMissingFiles' false;
select * from t_external_hdfs_parquet_015;



drop table t_external_hdfs_parquet_privi_001 if exists;

-- 测试无访问权限的异常情况
CREATE EXTERNAL TABLE t_external_hdfs_parquet_privi_001(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/privi/ldb_parquet')
format 'parquet' ;

set session work 'ldb.source.files.ignoreCorruptFiles' true;
set session work 'ldb.source.files.ignoreMissingFiles' true;

select * from t_external_hdfs_parquet_privi_001 order by id;



--测试路径前置空格
drop table t_external_hdfs_parquet_pre_space_001 if exists;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_pre_space_001(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location(' hdfs://node73:8020/user/testdb73/external_file/ldb_parquet')
format 'parquet' ;

set session work 'ldb.source.files.ignoreCorruptFiles' true;
set session work 'ldb.source.files.ignoreMissingFiles' true;

select * from t_external_hdfs_parquet_pre_space_001 order by id;



--测试路径后置空格
drop table t_external_hdfs_parquet_post_space_001 if exists;

CREATE EXTERNAL TABLE t_external_hdfs_parquet_post_space_001(
   id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/ldb_parquet ')
format 'parquet' ;

set session work 'ldb.source.files.ignoreCorruptFiles' true;
set session work 'ldb.source.files.ignoreMissingFiles' true;

select * from  t_external_hdfs_parquet_post_space_001 order by id;



--测试路径前后置空格
drop table t_external_parquet_pre_post_space_001 if exists;

CREATE EXTERNAL TABLE t_external_parquet_pre_post_space_001(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location(' hdfs://node73:8020/user/testdb73/external_file/ldb_parquet ')
format 'parquet' ;

set session work 'ldb.source.files.ignoreCorruptFiles' true;
set session work 'ldb.source.files.ignoreMissingFiles' true;

select * from  t_external_parquet_pre_post_space_001 order by id;