--Description:pallas_syntax
--Date：2020-06-19
--Author：阮娜

SET ECHO ON
SET TIMING ON

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;
DROP TABLE T_SYNTAX IF EXISTS;

-- 正常
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8','linkoopdb.pallas.shard_duplicate_number':'3','linkoopdb.pallas.min_shard_duplicate_number':'2') ENGINE PALLAS;

-- create拼错
CREAT TABLE T_SYNTAX (A INT, B VARCHAR(255)) ENGINE PALLAS;

-- table拼错
CREATE TABALE T_SYNTAX (A INT, B VARCHAR(255)) ENGINE PALLAS;

-- 缺少engine
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) PALLAS;

-- pallas拼错
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) ENGINE PALAS;

-- 字段名后缺失类型
CREATE TABLE T_SYNTAX (A INTEGER, B) ENGINE PALLAS;

-- 缺少)
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255) ENGINE PALLAS;

-- 缺少括号
CREATE TABLE T_SYNTAX A INT, B VARCHAR(255) ENGINE PALLAS;

-- int类型拼错
CREATE TABLE T_SYNTAX (A INTGER, B VARCHAR(255)) ENGINE PALLAS;

-- varchar类型拼错
CREATE TABLE T_SYNTAX (A INTEGER, B VACHAR(255)) ENGINE PALLAS;

-- varchar长度为负数
CREATE TABLE T_SYNTAX (A INTEGER, B VARCHAR(-30)) ENGINE PALLAS;

-- varchar长度括号缺失
CREATE TABLE T_SYNTAX (A INTEGER, B VARCHAR30) ENGINE PALLAS;

-- varchar长度括号(缺失
CREATE TABLE T_SYNTAX (A INTEGER, B VARCHAR30)) ENGINE PALLAS;

-- smallint拼错
CREATE TABLE T_SYNTAX (A INTEGER, B SMALINT) ENGINE PALLAS;

-- bigint拼错
CREATE TABLE T_SYNTAX (A INTEGER, B BIGGINT) ENGINE PALLAS;

-- BOOL拼错
CREATE TABLE T_SYNTAX (A INTEGER, B BOLLEAN) ENGINE PALLAS;

-- char缺少长度
CREATE TABLE T_SYNTAX (A INTEGER, B CHAR) ENGINE PALLAS;

-- char长度为0
CREATE TABLE T_SYNTAX (A INTEGER, B CHAR(0)) ENGINE PALLAS;

-- date拼错
CREATE TABLE T_SYNTAX (A INTEGER, B DATA) ENGINE PALLAS;

-- decimal拼错
CREATE TABLE T_SYNTAX (A INTEGER, B DECMAL(10,2)) ENGINE PALLAS;

-- decimal总长度和小数部分之间缺少逗号
CREATE TABLE T_SYNTAX (A INTEGER, B DECIMAL(10 2)) ENGINE PALLAS;

-- double拼错
CREATE TABLE T_SYNTAX (A INTEGER, B DOUBLLE) ENGINE PALLAS;

-- FLOAT拼错
CREATE TABLE T_SYNTAX (A INTEGER, B FLAOT) ENGINE PALLAS;

-- REAL拼错
CREATE TABLE T_SYNTAX (A INTEGER, B REALL) ENGINE PALLAS;

-- NUMERIC拼错
CREATE TABLE T_SYNTAX (A INTEGER, B NUMBER(5,2)) ENGINE PALLAS;

-- TIMESTAMP拼错
CREATE TABLE T_SYNTAX (A INTEGER, B TIMETAMP) ENGINE PALLAS;

-- ARRAY前没有带类型
CREATE TABLE T_SYNTAX (A INTEGER, B ARRAY) ENGINE PALLAS;

-- ARRAY拼错
CREATE TABLE T_SYNTAX (A INTEGER, B VARCHAR(30) ARAY) ENGINE PALLAS;

-- ARRAY在类型前面
CREATE TABLE T_SYNTAX (A INTEGER, B ARRAY FLOAT) ENGINE PALLAS;

-- properties拼错
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) propertities('linkoopdb.pallas.shard_number':'8') ENGINE PALLAS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) propertities('shard_number':'8') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':8) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(linkoopdb.pallas.shard_number:'8') ENGINE PALLAS;

-- =
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number'='8') ENGINE PALLAS;

-- properties 多个key之间隔开符号异常
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8';'linkoopdb.pallas.shard_duplicate_number':'3') ENGINE PALLAS;

-- properties缺少括号
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties 'linkoopdb.pallas.shard_number':'8' ENGINE PALLAS;

-- shard_number不是2的n次方
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'10') ENGINE PALLAS;

-- shard_number为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'-4') ENGINE PALLAS;

-- shard_number为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'0') ENGINE PALLAS;

-- shard_number为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'Ab') ENGINE PALLAS;

-- shard_number为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'4.56') ENGINE PALLAS;

-- shard_number为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'四个') ENGINE PALLAS;

-- shard_number为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'*&@') ENGINE PALLAS;

-- shard_duplicate_number为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8','linkoopdb.pallas.shard_duplicate_number':'-2') ENGINE PALLAS;

-- shard_duplicate_number为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8','linkoopdb.pallas.shard_duplicate_number':'0') ENGINE PALLAS;

-- shard_duplicate_number为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8','linkoopdb.pallas.shard_duplicate_number':'Dc') ENGINE PALLAS;

-- shard_duplicate_number为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8','linkoopdb.pallas.shard_duplicate_number':'2.14') ENGINE PALLAS;

-- shard_duplicate_number为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8','linkoopdb.pallas.shard_duplicate_number':'二') ENGINE PALLAS;

-- shard_duplicate_number为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8','linkoopdb.pallas.shard_duplicate_number':'3%') ENGINE PALLAS;

-- min_shard_duplicate_number大于shard_duplicate_number
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8','linkoopdb.pallas.shard_duplicate_number':'3','linkoopdb.pallas.min_shard_duplicate_number':'4') ENGINE PALLAS;

-- min_shard_duplicate_number等于shard_duplicate_number
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8','linkoopdb.pallas.shard_duplicate_number':'3','linkoopdb.pallas.min_shard_duplicate_number':'3') ENGINE PALLAS;