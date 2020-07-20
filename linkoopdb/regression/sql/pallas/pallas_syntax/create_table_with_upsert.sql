--Description:验证创建PALLAS表时配置upsert
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- positive test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- upsert为true
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('upsert':'true') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- upsert为false
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('upsert':'false') ENGINE PALLAS;

-- negative test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upserts':'8') ENGINE PALLAS;

-- properties key包含大写字符
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('upSert':'true') ENGINE PALLAS;

-- properties key包含空格
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('upsert ':'true') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':8) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(upsert:'8') ENGINE PALLAS;

-- properties缺少括号
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties 'upsert':'8' ENGINE PALLAS;

-- upsert为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':'-4') ENGINE PALLAS;

-- upsert为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':'0') ENGINE PALLAS;

-- upsert为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':'Ab') ENGINE PALLAS;

-- upsert为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':'4.56') ENGINE PALLAS;

-- upsert为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':'四个') ENGINE PALLAS;

-- upsert为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':'*&@') ENGINE PALLAS;

-- upsert为空
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':'') ENGINE PALLAS;

-- upsert为NULL
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':NULL) ENGINE PALLAS;

-- upsert包含空格
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('upsert':'false ') ENGINE PALLAS;






