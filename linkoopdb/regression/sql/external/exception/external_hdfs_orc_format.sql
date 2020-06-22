--    Description: 测试external hdfs orc格式
--    Date:         2020-06-22
--    Author:       丁婷
set echo on
drop table if exists t_external_hdfs_orc_001;
drop table if exists t_external_hdfs_orc_002;
drop table if exists t_external_hdfs_orc_003;
drop table if exists t_external_hdfs_orc_004;
drop table if exists t_external_hdfs_orc_005;
drop table if exists t_external_hdfs_orc_006;
drop table if exists t_external_hdfs_orc_007;
drop table if exists t_external_hdfs_orc_008;
drop table if exists t_external_hdfs_orc_009;
drop table if exists t_external_hdfs_orc_010;
drop table if exists t_external_hdfs_orc_011;
drop table if exists t_external_hdfs_orc_012;
drop table if exists t_external_hdfs_orc_013;
drop table if exists t_external_hdfs_orc_014;


-- 测试EXTERNAL关键字未写，创建表需报错明确
CREATE  TABLE t_external_hdfs_orc_001(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_orc1')
format 'orc';

-- 测试EXTERNAL关键字写错，创建表需报错明确
CREATE EXTERNAL1 TABLE t_external_hdfs_orc_002(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_orc1')
format 'orc';

-- 测试format关键字未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_003(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_orc1');
 

-- 测试format关键字写错，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_004(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_orc1')
 format1 'orc' ;
 
 -- 测试format值写错，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_005(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb731/external_file/show_orc1')
 format 'orc1' ;
 
 -- 测试format值双引号，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_006(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_orc1')
format "orc" ;


 -- 测试format值未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_007(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_orc1')
format ;

 -- 测试format关键字未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_008(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_orc1')
'orc' ;
 
-- 测试location值未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_009(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location
format 'orc';

 -- 测试location未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_010(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) ('hdfs://node73:8020/user/testdb73/external_file/show_orc1')
format 'orc';

 -- 测试location写错，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_011(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location2('hdfs://node73:8020/user/testdb73/external_file/show_orc1')
format 'orc';

 -- 测试location值写错，使用时报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_012(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb731/external_file/show_orc1')
format 'orc';

select * from t_external_hdfs_orc_012;


 -- 测试location和值未写，使用时报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_013(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) 
format 'orc';


 -- 测试location和值未写，使用时报错明确
CREATE EXTERNAL TABLE t_external_hdfs_orc_014(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_orc1')
format 'orc';

select * from  t_external_hdfs_orc_014 order by id;
