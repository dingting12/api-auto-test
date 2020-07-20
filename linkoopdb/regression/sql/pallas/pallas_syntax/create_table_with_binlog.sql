--Description:验证创建PALLAS表时配置binlog
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- positive test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- binlog为true
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('binlog':'true') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- binlog为false
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('binlog':'false') ENGINE PALLAS;

-- negative test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlogs':'8') ENGINE PALLAS;

-- properties key包含大写字符
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('binLog':'true') ENGINE PALLAS;

-- properties key包含空格
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('binlog ':'true') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':8) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(binlog:'8') ENGINE PALLAS;

-- properties缺少括号
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties 'binlog':'8' ENGINE PALLAS;

-- binlog为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':'-4') ENGINE PALLAS;

-- binlog为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':'0') ENGINE PALLAS;

-- binlog为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':'Ab') ENGINE PALLAS;

-- binlog为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':'4.56') ENGINE PALLAS;

-- binlog为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':'四个') ENGINE PALLAS;

-- binlog为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':'*&@') ENGINE PALLAS;

-- binlog为空
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':'') ENGINE PALLAS;

-- binlog为NULL
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':NULL) ENGINE PALLAS;

-- binlog包含空格
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('binlog':'false ') ENGINE PALLAS;






