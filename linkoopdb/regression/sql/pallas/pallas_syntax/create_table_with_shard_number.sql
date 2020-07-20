--Description:验证创建PALLAS表时配置linkoopdb.pallas.shard_number
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- positive test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- shard_number为最小值1
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'1') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- shard_number为最大值4096
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'4096') ENGINE PALLAS;

-- negative test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('shard_number':'8') ENGINE PALLAS;

-- properties key包含大写字符
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.Shard_number':'1') ENGINE PALLAS;

-- properties key包含空格
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number ':'1') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':8) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(linkoopdb.pallas.shard_number:'8') ENGINE PALLAS;

-- properties 多个key之间隔开符号错误
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

-- shard_duplicate_number为空
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'') ENGINE PALLAS;

-- shard_duplicate_number为NULL
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':NULL) ENGINE PALLAS;

-- shard_duplicate_number包含空格
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'1 ') ENGINE PALLAS;

-- shard_number值超过上限4096
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.shard_number':'8192') ENGINE PALLAS;






