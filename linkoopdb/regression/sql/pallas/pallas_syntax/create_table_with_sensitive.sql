--Description:验证创建PALLAS表时配置sensitive
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- positive test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- sensitive为true
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('sensitive':'0') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- sensitive为false
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('sensitive':'1') ENGINE PALLAS;

-- negative test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitives':'8') ENGINE PALLAS;

-- properties key包含大写字符
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('Sensitive':'true') ENGINE PALLAS;

-- properties key包含空格
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('sensitive ':'true') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':1) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(sensitive:'1') ENGINE PALLAS;

-- properties缺少括号
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties 'sensitive':'1' ENGINE PALLAS;

-- sensitive为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'-4') ENGINE PALLAS;

-- sensitive为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'0') ENGINE PALLAS;

-- sensitive为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'Ab') ENGINE PALLAS;

-- sensitive为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'4.56') ENGINE PALLAS;

-- sensitive为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'四个') ENGINE PALLAS;

-- sensitive为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'*&@') ENGINE PALLAS;

-- sensitive为空
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'') ENGINE PALLAS;

-- sensitive为NULL
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':NULL) ENGINE PALLAS;

-- sensitive包含空格
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'0 ') ENGINE PALLAS;

-- sensitive=true
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'true') ENGINE PALLAS;

-- sensitive=false
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('sensitive':'false') ENGINE PALLAS;






