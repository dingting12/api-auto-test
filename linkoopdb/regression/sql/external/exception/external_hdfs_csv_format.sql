--    Description: 测试external hdfs csv格式
--    Date:         2020-06-19
--    Author:       丁婷
set echo on

drop table if exists t_external_hdfs_csv_001;
drop table if exists t_external_hdfs_csv_002;
drop table if exists t_external_hdfs_csv_003;
drop table if exists t_external_hdfs_csv_004;
drop table if exists t_external_hdfs_csv_005;
drop table if exists t_external_hdfs_csv_006;
drop table if exists t_external_hdfs_csv_007;
drop table if exists t_external_hdfs_csv_008;
drop table if exists t_external_hdfs_csv_009;
drop table if exists t_external_hdfs_csv_010;
drop table if exists t_external_hdfs_csv_011;
drop table if exists t_external_hdfs_csv_012;
drop table if exists t_external_hdfs_csv_013;
drop table if exists t_external_hdfs_csv_014;
drop table if exists t_external_hdfs_csv_015;
drop table if exists t_external_hdfs_csv_016;
drop table if exists t_external_hdfs_csv_017;
drop table if exists t_external_hdfs_csv_018;
drop table if exists t_external_hdfs_csv_019;
drop table if exists t_external_hdfs_csv_020;
drop table if exists t_external_hdfs_csv_021;
drop table if exists t_external_hdfs_csv_022;

-- 测试EXTERNAL关键字未写，创建表需报错明确
CREATE  TABLE t_external_hdfs_csv_001(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '|');

-- 测试EXTERNAL关键字写错，创建表需报错明确
CREATE EXTERNAL1 TABLE t_external_hdfs_csv_002(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv'(delimiter '|');

-- 测试format关键字未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_003(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')(delimiter '|');
 

-- 测试format关键字写错，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_004(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
 format1 'csv' (delimiter '|');
 
 -- 测试format值写错，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_005(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
 format 'csv1' (delimiter '|');
 
 -- 测试format值双引号，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_006(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format "csv" (delimiter '|');


 -- 测试format值未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_007(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format (delimiter '|');

 -- 测试format关键字未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_008(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
'csv' (delimiter '|');
 
-- 测试location值未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_009(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location
format 'csv' (delimiter '|');

 -- 测试location未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_010(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) ('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '|');

 -- 测试location写错，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_011(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location2('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '|');

 -- 测试location值写错，使用时报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_012(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb731/external_file/show_csv1.csv')
format 'csv' (delimiter '|');

select * from t_external_hdfs_csv_012;

-- 测试location值无权限，使用时报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_022(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/node74/stream74/linkoopdb/data/show_csv1.csv')
format 'csv' (delimiter '|');

select * from t_external_hdfs_csv_022;


 -- 测试location和值未写，使用时报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_013(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) 
format 'csv' (delimiter '|');
 
-- 测试delimeter参数未写，创建表需报错明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_014(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' ;

-- 测试delimeter参数为|
CREATE EXTERNAL TABLE t_external_hdfs_csv_015(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '|');

select * from t_external_hdfs_csv_015;


-- 测试delimeter参数为空格
CREATE EXTERNAL TABLE t_external_hdfs_csv_016(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP,
  descs VARCHAR(200),
  items INT
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv4.csv')
format 'csv' (delimiter ' ');

select * from t_external_hdfs_csv_016;


-- 测试delimeter参数为,
CREATE EXTERNAL TABLE t_external_hdfs_csv_017(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP,
  descs VARCHAR(200),
  items INT
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv5.csv')
format 'csv' (delimiter ',');

select * from t_external_hdfs_csv_017;


-- 测试delimeter参数为@
CREATE EXTERNAL TABLE t_external_hdfs_csv_018(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv6.csv')
format 'csv' (delimiter '@');

select * from t_external_hdfs_csv_018;

-- 测试delimeter参数为ASCII码BEL
CREATE EXTERNAL TABLE t_external_hdfs_csv_019(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/BELASCII.csv')
format 'csv' (delimiter '');

select * from t_external_hdfs_csv_019;

-- 测试delimeter参数为@,数据中分隔符为为逗号
CREATE EXTERNAL TABLE t_external_hdfs_csv_020(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv5.csv')
format 'csv' (delimiter '@');

select * from t_external_hdfs_csv_020;

-- 测试delimeter参数异常情况为||,报错需明确
CREATE EXTERNAL TABLE t_external_hdfs_csv_021(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '||');



-- 测试参数header
-- 删除表
drop table if exists t_external_hdfs_csv_he_dt1;
drop table if exists t_external_hdfs_csv_he_dt2;
drop table if exists t_external_hdfs_csv_he_dt3;
drop table if exists t_external_hdfs_csv_he_dt4;
drop table if exists t_external_hdfs_csv_he_dt5;

-- 测试参数header默认值为false
CREATE EXTERNAL TABLE t_external_hdfs_csv_he_dt1(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '|');

select * from t_external_hdfs_csv_he_dt1;

-- 测试参数header值为false
CREATE EXTERNAL TABLE t_external_hdfs_csv_he_dt2(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '|' header 'false');

select * from t_external_hdfs_csv_he_dt2;

-- 测试参数header为true,第一行都是字符串
CREATE EXTERNAL TABLE t_external_hdfs_csv_he_dt3(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '|' header 'true');

select * from t_external_hdfs_csv_he_dt3;

-- 测试参数header为true,但第一行不全是字符串
CREATE EXTERNAL TABLE t_external_hdfs_csv_he_dt4(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv15.csv')
format 'csv' (delimiter '|' header 'true');

select * from t_external_hdfs_csv_he_dt4;


-- 测试参数header异常值为truee
CREATE EXTERNAL TABLE t_external_hdfs_csv_he_dt5(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv15.csv')
format 'csv' (delimiter '|' header 'truee');

select * from t_external_hdfs_csv_he_dt5;


-- 测试参数quote
-- 删除表
drop table if exists t_external_hdfs_csv_quo_dt1;
drop table if exists t_external_hdfs_csv_quo_dt2;
drop table if exists t_external_hdfs_csv_quo_dt3;
-- 测试quote为@
CREATE EXTERNAL TABLE t_external_hdfs_csv_quo_dt1(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv10.csv')
format 'csv' (delimiter '|' quote '@');

select * from t_external_hdfs_csv_quo_dt1;

-- 测试quote为@,被包裹的字段含有分隔符
CREATE EXTERNAL TABLE t_external_hdfs_csv_quo_dt2(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv16.csv')
format 'csv' (delimiter '|' quote '@');

select * from t_external_hdfs_csv_quo_dt2;

-- 测试quote异常情况为@@
CREATE EXTERNAL TABLE t_external_hdfs_csv_quo_dt3(
  id INT,
  name VARCHAR(200),
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv10.csv')
format 'csv' (delimiter '|' quote '@@');


-- 测试参数escape
-- 删除表
drop table if exists t_external_hdfs_csv_esc_dt1;
drop table if exists t_external_hdfs_csv_esc_dt2;

-- 测试参数escape为/
CREATE EXTERNAL TABLE t_external_hdfs_csv_esc_dt1(
  id INT,
  name VARCHAR(200), 
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '|' ESCAPE '/' header 'true');

select * from t_external_hdfs_csv_esc_dt1;


-- 测试ESCAPE异常情况为//
CREATE EXTERNAL TABLE t_external_hdfs_csv_esc_dt2(
  id INT,
  name VARCHAR(200), 
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv1.csv')
format 'csv' (delimiter '|' ESCAPE '//' header 'true');

--测试转义未开启的show create table
set session escape off;

DROP TABLE IF EXISTS t_external_hdfs_csv_esc_dt3;
 
CREATE EXTERNAL TABLE t_external_hdfs_csv_esc_dt3(
"A" INTEGER ,
"B" VARCHAR(50) 
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/json.csv')
FORMAT 'csv'( DELIMITER '\,' ESCAPE '\\' QUOTE '\"');

SELECT * FROM t_external_hdfs_csv_esc_dt3;


show CREATE TABLE t_external_hdfs_csv_esc_dt3;

--测试转义开启的show create table
set session escape on;

DROP TABLE IF EXISTS t_external_hdfs_csv_esc_dt4;
DROP TABLE IF EXISTS t_external_hdfs_csv_esc_dt5;

--测试转义字符为\\
CREATE EXTERNAL TABLE t_external_hdfs_csv_esc_dt4(
"A" INTEGER ,
"B" VARCHAR(50) 
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/json.csv')
FORMAT 'csv'( DELIMITER '\,' ESCAPE '\\' QUOTE '\'');

SELECT * FROM t_external_hdfs_csv_esc_dt4;


show CREATE TABLE t_external_hdfs_csv_esc_dt4;

CREATE EXTERNAL TABLE t_external_hdfs_csv_esc_dt5(
"A" INTEGER ,
"B" VARCHAR(50) 
)
LOCATION ('hdfs://node73:8020/user/testdb73/external_file/json.csv')
FORMAT 'csv'( DELIMITER '\,' ESCAPE '\'' QUOTE '\'');

SELECT * FROM t_external_hdfs_csv_esc_dt5;


show CREATE TABLE t_external_hdfs_csv_esc_dt5;

set session escape off;




-- 测试参数NULL
-- 删除表
drop table if exists t_external_hdfs_csv_null_dt1;
drop table if exists t_external_hdfs_csv_null_dt2;

-- 测试NULL为!!!
CREATE EXTERNAL TABLE t_external_hdfs_csv_null_dt1(
  id INT,
  name VARCHAR(200), 
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv12.csv')
format 'csv' (delimiter '|' ESCAPE '$' header 'true' NULL '!!!');

select * from t_external_hdfs_csv_null_dt1;

-- 测试NULL为ds,数据中有dsdsddfs
CREATE EXTERNAL TABLE t_external_hdfs_csv_null_dt2(
  id INT,
  name VARCHAR(200), 
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv12.csv')
format 'csv' (delimiter '|' ESCAPE '$' header 'true' NULL 'ds');

select * from t_external_hdfs_csv_null_dt2;


-- 测试参数ignoreLeadingWhiteSpace
-- 删除表
drop table if exists t_external_hdfs_csv_ws_dt1;
drop table if exists t_external_hdfs_csv_ws_dt2;
drop table if exists t_external_hdfs_csv_ws_dt3;

-- 测试ignoreLeadingWhiteSpace默认值为false
CREATE EXTERNAL TABLE t_external_hdfs_csv_ws_dt1(
  id INT,
  name VARCHAR(200), 
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv17.csv')
format 'csv' (delimiter '|' header 'true');

select * from t_external_hdfs_csv_ws_dt1;

-- 测试ignoreLeadingWhiteSpace值为true
CREATE EXTERNAL TABLE t_external_hdfs_csv_ws_dt2(
  id INT,
  name VARCHAR(200), 
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv17.csv')
format 'csv' (delimiter '|' header 'true' ignoreLeadingWhiteSpace 'true');

select * from t_external_hdfs_csv_ws_dt2;

-- 测试ignoreLeadingWhiteSpace异常情况truee
CREATE EXTERNAL TABLE t_external_hdfs_csv_ws_dt3(
  id INT,
  name VARCHAR(200), 
  sal DOUBLE,
  birthday TIMESTAMP
) location('hdfs://node73:8020/user/testdb73/external_file/show_csv17.csv')
format 'csv' (delimiter '|' header 'true' ignoreLeadingWhiteSpace 'truee');


-- 测试encoding
-- 删除表
--drop table if exists  t_external_hdfs_csv_enco_dt1;
--drop table if exists  t_external_hdfs_csv_enco_dt2;
--drop table if exists  t_external_hdfs_csv_enco_dt3;
--drop table if exists  t_external_hdfs_csv_enco_dt4;
--drop table if exists  t_external_hdfs_csv_enco_dt5;
--drop table if exists  t_external_hdfs_csv_enco_dt6;
--drop table if exists  t_external_hdfs_csv_enco_dt7;
--drop table if exists  t_external_hdfs_csv_enco_dt8;
--drop table if exists  t_external_hdfs_csv_enco_dt8;
--drop table if exists  t_external_hdfs_csv_enco_dt10;
--drop table if exists  t_external_hdfs_csv_enco_dt11;


-- 创建DB表，数据和表都设置编码格式为ISO-8859-1
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt1(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_8859.csv')
--format 'csv' (delimiter '|' encoding 'ISO-8859-1');
--
--select * from t_external_hdfs_csv_enco_dt1;


-- 创建DB表，数据和表都设置编码格式为GB2312
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt2(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_2312.csv')
--format 'csv' (delimiter '|' encoding 'GB2312');

--select * from t_external_hdfs_csv_enco_dt2;

---- 创建DB表，数据和表都设置编码格式为GBK
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt3(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_gbk.csv')
--format 'csv' (delimiter '|' encoding 'GBK');
--
--select * from t_external_hdfs_csv_enco_dt3;
--
---- 创建DB表，数据和表都设置编码格式为UTF-16
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt4(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_utf16.csv')
--format 'csv' (delimiter '|' encoding 'UTF-16');
--
--select * from t_external_hdfs_csv_enco_dt4;
--
---- 创建DB表，数据和表都设置编码格式为UTF-8
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt5(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_utf8.csv')
--format 'csv' (delimiter '|' encoding 'UTF-8');
--
--select * from t_external_hdfs_csv_enco_dt5;
--
--
---- 创建DB表，数据设置编码格式为ISO-8859-1,表设置为UTF-8
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt6(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_8859.csv')
--format 'csv' (delimiter '|' encoding 'UTF-8');
--
--select * from t_external_hdfs_csv_enco_dt6;
--
--
---- 创建DB表，数据设置编码格式为ISO-8859-1,表设置为GBK
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt7(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_8859.csv')
--format 'csv' (delimiter '|' encoding 'GBK');
--
--select * from t_external_hdfs_csv_enco_dt7;
--
---- 创建DB表，数据设置编码格式为GBK,表设置为ISO-8859-1
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt8(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_gbk.csv')
--format 'csv' (delimiter '|' encoding 'ISO-8859-1');
--
--select * from t_external_hdfs_csv_enco_dt8;
--
---- 创建DB表，数据设置编码格式为GBK,表设置为UTF-8
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt9(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_gbk.csv')
--format 'csv' (delimiter '|' encoding 'UTF-8');
--
--select * from t_external_hdfs_csv_enco_dt9;
--
---- 创建DB表，数据设置编码格式为UTF-8,表设置为ISO-8859-1
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt10(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_utf8.csv')
--format 'csv' (delimiter '|' encoding 'ISO-8859-1');
--
--select * from t_external_hdfs_csv_enco_dt10;
--
--
---- 创建DB表，数据设置编码格式为UTF-8,表设置为GBK
--CREATE EXTERNAL TABLE t_external_hdfs_csv_enco_dt11(
--  id INT,
--  name1 VARCHAR(200), 
--  name2 VARCHAR(200), 
--  name3 VARCHAR(200),
--  name4 VARCHAR(200),
--  sal DOUBLE,
--  birthday TIMESTAMP
--) location('hdfs://node73:8020/user/testdb73/external_file/encoding_utf8.csv')
--format 'csv' (delimiter '|' encoding 'GBK');
--
--select * from t_external_hdfs_csv_enco_dt11;
