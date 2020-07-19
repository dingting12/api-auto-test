--Description:验证创建PALLAS表时配置perinsertnum
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- positive test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- perinsertnum为最小值1
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('perinsertnum':'1') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- perinsertnum为最大值1000000
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('perinsertnum':'100000') ENGINE PALLAS;


-- negative test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnumm':'8') ENGINE PALLAS;

-- properties key包含大写字符
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('Perinsertnum':'1') ENGINE PALLAS;

-- properties key包含空格
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('perinsertnum ':'1') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':8) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(perinsertnum:'8') ENGINE PALLAS;

-- properties缺少括号
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties 'perinsertnum':'8' ENGINE PALLAS;

-- perinsertnum的value为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':'-4') ENGINE PALLAS;

-- perinsertnum的value为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':'0') ENGINE PALLAS;

-- perinsertnum的value为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':'Ab') ENGINE PALLAS;

-- perinsertnum的value为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':'4.56') ENGINE PALLAS;

-- perinsertnum的value为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':'四个') ENGINE PALLAS;

-- perinsertnum的value为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':'*&@') ENGINE PALLAS;

-- perinsertnum的value为空
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':'') ENGINE PALLAS;

-- perinsertnum的value为NULL
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':NULL) ENGINE PALLAS;

-- perinsertnum的value包含空格
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':'1 ') ENGINE PALLAS;

-- perinsertnum的value值超过上限100001
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('perinsertnum':'100001') ENGINE PALLAS;