--Description:验证创建PALLAS表时配置insert.cache.count
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- positive test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- insert.cache.count为最小值1
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('insert.cache.count':'1') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- insert.cache.count为最大值10000
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('insert.cache.count':'10000') ENGINE PALLAS;

-- negative test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('cache.count':'8') ENGINE PALLAS;

-- properties key包含大写字符
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('insert.Cache.count':'1') ENGINE PALLAS;

-- properties key包含空格
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('insert.cache.count ':'1') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':8) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(insert.cache.count:'8') ENGINE PALLAS;

-- properties缺少括号
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties 'insert.cache.count':'8' ENGINE PALLAS;

-- insert.cache.count的value为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':'-4') ENGINE PALLAS;

-- insert.cache.count的value为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':'0') ENGINE PALLAS;

-- insert.cache.count的value为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':'Ab') ENGINE PALLAS;

-- insert.cache.count的value为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':'4.56') ENGINE PALLAS;

-- insert.cache.count的value为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':'四个') ENGINE PALLAS;

-- insert.cache.count的value为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':'*&@') ENGINE PALLAS;

-- insert.cache.count的value为空
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':'') ENGINE PALLAS;

-- insert.cache.count的value为NULL
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':NULL) ENGINE PALLAS;

-- insert.cache.count的value包含空格
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':'1 ') ENGINE PALLAS;

-- insert.cache.count的value值超过上限10000
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('insert.cache.count':'10001') ENGINE PALLAS;