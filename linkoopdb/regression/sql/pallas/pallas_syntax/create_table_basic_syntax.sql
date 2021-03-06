--Description:验证创建PALLAS表的基本语法
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;
DROP TABLE T_SYNTAX IF EXISTS;

-- 正常
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) ENGINE PALLAS;

-- create拼错
CREAT TABLE T_SYNTAX (A INT, B VARCHAR(255)) ENGINE PALLAS;

-- table拼错
CREATE TABALE T_SYNTAX (A INT, B VARCHAR(255)) ENGINE PALLAS;

-- 缺少engine
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) PALLAS;

-- engine拼错
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) EGINE PALLAS;

-- pallas拼错
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) ENGINE PALAS;

-- 字段名后缺失类型
CREATE TABLE T_SYNTAX (A INTEGER, B) ENGINE PALLAS;

-- 缺少)
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255) ENGINE PALLAS;

-- 缺少括号
CREATE TABLE T_SYNTAX A INT, B VARCHAR(255) ENGINE PALLAS;








