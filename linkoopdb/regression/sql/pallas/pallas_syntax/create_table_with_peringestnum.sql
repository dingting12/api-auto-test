--Description:验证创建PALLAS表时配置peringestnum
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- positive test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- peringestnum为最小值1
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('peringestnum':'1') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- peringestnum为最大值1000000
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('peringestnum':'1000000') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- peringestnum小于1000的内部重设为1000
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('peringestnum':'999') ENGINE PALLAS;
SHOW TABLE PROPERTIES T_SYNTAX_NORMAL

-- negative test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnumm':'8') ENGINE PALLAS;

-- properties key包含大写字符
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('Peringestnum':'1') ENGINE PALLAS;

-- properties key包含空格
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('peringestnum ':'1') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':8) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(peringestnum:'8') ENGINE PALLAS;

-- properties缺少括号
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties 'peringestnum':'8' ENGINE PALLAS;

-- peringestnum的value为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':'-4') ENGINE PALLAS;

-- peringestnum的value为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':'0') ENGINE PALLAS;

-- peringestnum的value为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':'Ab') ENGINE PALLAS;

-- peringestnum的value为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':'4.56') ENGINE PALLAS;

-- peringestnum的value为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':'四个') ENGINE PALLAS;

-- peringestnum的value为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':'*&@') ENGINE PALLAS;

-- peringestnum的value为空
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':'') ENGINE PALLAS;

-- peringestnum的value为NULL
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':NULL) ENGINE PALLAS;

-- peringestnum的value包含空格
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':'1 ') ENGINE PALLAS;

-- peringestnum的value值超过上限1000001
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('peringestnum':'1000001') ENGINE PALLAS;