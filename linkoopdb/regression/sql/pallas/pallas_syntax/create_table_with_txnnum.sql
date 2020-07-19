--Description:验证创建PALLAS表时配置txnnum
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- positive test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- txnnum为最小值1
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('txnnum':'1') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- txnnum为最大值1000000
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('txnnum':'1000000') ENGINE PALLAS;

-- negative test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnumm':'8') ENGINE PALLAS;

-- properties key包含大写字符
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('Txnnum':'1') ENGINE PALLAS;

-- properties key包含空格
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('txnnum ':'1') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':8) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(txnnum:'8') ENGINE PALLAS;

-- properties缺少括号
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties 'txnnum':'8' ENGINE PALLAS;

-- txnnum的value为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':'-4') ENGINE PALLAS;

-- txnnum的value为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':'0') ENGINE PALLAS;

-- txnnum的value为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':'Ab') ENGINE PALLAS;

-- txnnum的value为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':'4.56') ENGINE PALLAS;

-- txnnum的value为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':'四个') ENGINE PALLAS;

-- txnnum的value为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':'*&@') ENGINE PALLAS;

-- txnnum的value为空
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':'') ENGINE PALLAS;

-- txnnum的value为NULL
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':NULL) ENGINE PALLAS;

-- txnnum的value包含空格
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':'1 ') ENGINE PALLAS;

-- txnnum的value值超过上限1000001
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('txnnum':'1000001') ENGINE PALLAS;