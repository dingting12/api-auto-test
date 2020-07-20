--Description:验证创建PALLAS表时配置linkoopdb.pallas.dict_compress_enabled
--Date：2020-07-15
--Author：翟坤

SET ECHO ON
SET TIMING ON

-- positive test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- linkoopdb.pallas.dict_compress_enabled为true
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'true') ENGINE PALLAS;

-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- linkoopdb.pallas.dict_compress_enabled为false
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'false') ENGINE PALLAS;

-- negative test cases
-- 删除表
DROP TABLE T_SYNTAX_NORMAL IF EXISTS;

-- properties key错误/不存在
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('dict_compress_enableds':'8') ENGINE PALLAS;

-- properties key包含大写字符
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('Linkoopdb.pallas.dict_compress_enabled':'true') ENGINE PALLAS;

-- properties key包含空格
CREATE TABLE T_SYNTAX_NORMAL (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled ':'true') ENGINE PALLAS;

-- properties value缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':8) ENGINE PALLAS;

-- properties key缺少''
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties(linkoopdb.pallas.dict_compress_enabled:'8') ENGINE PALLAS;

-- properties缺少括号
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties 'linkoopdb.pallas.dict_compress_enabled':'8' ENGINE PALLAS;

-- linkoopdb.pallas.dict_compress_enabled为负数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'-4') ENGINE PALLAS;

-- linkoopdb.pallas.dict_compress_enabled为0
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'0') ENGINE PALLAS;

-- linkoopdb.pallas.dict_compress_enabled为大小写字母
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'Ab') ENGINE PALLAS;

-- linkoopdb.pallas.dict_compress_enabled为浮点数
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'4.56') ENGINE PALLAS;

-- linkoopdb.pallas.dict_compress_enabled为汉字
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'四个') ENGINE PALLAS;

-- linkoopdb.pallas.dict_compress_enabled为特殊字符
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'*&@') ENGINE PALLAS;

-- linkoopdb.pallas.dict_compress_enabled为空
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'') ENGINE PALLAS;

-- linkoopdb.pallas.dict_compress_enabled为NULL
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':NULL) ENGINE PALLAS;

-- linkoopdb.pallas.dict_compress_enabled包含空格
CREATE TABLE T_SYNTAX (A INT, B VARCHAR(255)) properties('linkoopdb.pallas.dict_compress_enabled':'false ') ENGINE PALLAS;






