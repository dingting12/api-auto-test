--Description:column_number
--Date：2020-06-08
--Author：阮娜

SET ECHO ON
SET TIMING ON

-- 删除136500列的hdfs表
DROP TABLE IF EXISTS H_COLUMNS_136500;

-- 创建136500列的hdfs表

-- 删除32760列pallas表
DROP TABLE IF EXISTS P_COLUMNS_32760;

-- 创建32760列pallas表