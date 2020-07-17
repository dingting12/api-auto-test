loaddriver F:\db_ex\driver\linkoopdb-jdbc-2.2.2.jar com.datapps.linkoopdb.jdbc.JdbcDriver

connect admin/123456@jdbc:linkoopdb:tcp://192.168.1.74:9105/ldb

--建表
DROP TABLE Test_Builtin_Func_1 IF EXISTS;
CREATE TABLE Test_Builtin_Func_1 (id int,name VARCHAR(100),salary double,grade double);
INSERT INTO Test_Builtin_Func_1 VALUES (1,'zs',8000, 97),(2,'ls',6000,65),(3,'ww',7000,88);
INSERT INTO Test_Builtin_Func_1 VALUES (3,'ys',7000,77);
SELECT * FROM Test_Builtin_Func_1;


--ABS
SELECT abs(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT abs(-1565567.6535643665434565777777734534546) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT abs(-922337203685477580999888765) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT abs(9223372036854775809998986778987) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT abs(id) FROM Test_Builtin_Func_1 order by id;

--null,oracle报错：无效数字
SELECT abs(name) FROM Test_Builtin_Func_1;

--报错，长度超出范围
SELECT abs(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--ACOS
SELECT acos(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT acos(-1) FROM Test_Builtin_Func_1 LIMIT 1;

--null,oracle报错：无效数字
SELECT acos(name) FROM Test_Builtin_Func_1;

--报错，长度超出范围
SELECT acos(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;

--超出范围，没报错
SELECT acos(-1565567.6535643665434565777777734534546) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT acos(-922337203685477580999888765) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT acos(9223372036854775809998986778987) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT ACOS(id) FROM Test_Builtin_Func_1 order by id;


--APPROX_COUNT_DISTINCT
SELECT APPROX_COUNT_DISTINCT(id) FROM Test_Builtin_Func_1;

SELECT APPROX_COUNT_DISTINCT(name) FROM Test_Builtin_Func_1;

SELECT APPROX_COUNT_DISTINCT(id,name) FROM Test_Builtin_Func_1;

SELECT APPROX_COUNT_DISTINCT(id,0.1,0.2,842978934) FROM Test_Builtin_Func_1;


--approx_percentile
SELECT approx_percentile(10.0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT approx_percentile(10.0, array[0.5, 0.4, 0.1]) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT approx_percentile(10.454444444566777, array[0.5, 0.4, 0.1], 100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT approx_percentile(10.0000000000000097888564654353454636, array[0.5, 0.4, 0.1], 100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT approx_percentile(10.0432600000000097888564654353454636, array[0.5, 0.4, 0.1], 100000000798989879745465545464534366784500000000000) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT approx_percentile(9223372036854775809998986778987, array[0.5, 0.4, 0.1], 100) FROM Test_Builtin_Func_1 LIMIT 1;


--array_contains
SELECT array_contains(array[1.2, 2.1, 3], 2.1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT array_contains(array[1.2, 2.1, 3], 2.2) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT array_contains(array[name], 'ys') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT array_contains(array['name'], 'name') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT array_contains(array[name], name) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT array_contains(array[name], 'name') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT array_contains(array[id], 1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT array_contains(array[id], id) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT array_contains(array[], 2.2) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT array_contains(0, 0) FROM Test_Builtin_Func_1 LIMIT 1;


--ascii
SELECT ascii('abc') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT ascii('ABC') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT ascii(3.14) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT ascii('&') FROM Test_Builtin_Func_1 LIMIT 1;


--ASIN
SELECT asin(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT asin(-1) FROM Test_Builtin_Func_1 LIMIT 1;

--报错，类型不匹配
SELECT asin(name) FROM Test_Builtin_Func_1;

--报错，长度超出范围
SELECT asin(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;

--NAN
SELECT asin(-1565567.6535643665434565777777734534546) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT asin(-922337203685477580999888765) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT asin(9223372036854775809998986778987) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT asin(id) FROM Test_Builtin_Func_1 ORDER BY id;


--ASSERT_TRUE
SELECT assert_true(1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT assert_true(1 >= 1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT assert_true(1 > 1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT assert_true((1*(1+3)/4) > 0) FROM Test_Builtin_Func_1 LIMIT 1;


--ATAN
SELECT atan(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT atan(-1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT atan(-1565567.6535643665434565777777734534546) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT atan(-922337203685477580999888765) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT atan(9223372036854775809998986778987) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT atan(id) FROM Test_Builtin_Func_1 ORDER BY id;

--报错，类型不匹配
SELECT atan(name) FROM Test_Builtin_Func_1;

--报错，长度超出范围
SELECT atan(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--ATAN2
SELECT atan2(-922337203685477580999888765,9223372036854775809998986778987) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT atan2(-0.4444444443224333547685878378856783467204678547657382,9223372036854775809998986778987) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT atan2(-922337203685477580999888765,-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT atan2(id,name) FROM Test_Builtin_Func_1 LIMIT 1;


--BASE64
SELECT base64('sql') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT base64(' ') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT base64(binary(name)) FROM Test_Builtin_Func_1 order by id;

--异常测试
SELECT base64(bin(name)) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT base64(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT base64(name) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT base64(12847320) FROM Test_Builtin_Func_1 LIMIT 1;


--BIN
SELECT bin(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT bin(8987) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT bin(-1565567.6535643665434565777777734534546) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT bin(-922337203685477580999888765) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT bin(9223372036854775809998986778987) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT bin(-0.4444444443224333547685878378856783467204678547657382,9223372036854775809998986778987) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT bin(name) FROM Test_Builtin_Func_1 LIMIT 1;


--BIT_LENGTH
SELECT bit_length(name) FROM Test_Builtin_Func_1;

SELECT bit_length(bin(1234354)) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT bit_length(binary('name')) FROM Test_Builtin_Func_1 LIMIT 1;


--BOOLEAN
SELECT boolean(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT boolean(1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT boolean(1-1*234) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT boolean(ID) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT boolean(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT boolean(NAME) FROM Test_Builtin_Func_1 LIMIT 1;


--BROUND
--SELECT bround(2.55211243253, 1000000000000000000000) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT bround(2.55211243253, 100000000000000000000) FROM Test_Builtin_Func_1 LIMIT 1;


--CBRT
SELECT cbrt(7436723673292305) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT cbrt(9223372036854775809998986778987) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT cbrt(id) FROM Test_Builtin_Func_1 order by id;

--异常测试
SELECT cbrt(name) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT cbrt(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--CEIL
SELECT ceil(0) FROM Test_Builtin_Func_1 limit 1;

SELECT ceil(9223372036854775809998986778987.7472362) FROM Test_Builtin_Func_1 limit 1;

SELECT ceil(0.0000000000000000001) FROM Test_Builtin_Func_1 limit 1;

--异常测试
SELECT ceil(name) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT ceil(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--CHAR
SELECT char(1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT char(66) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT char(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT char(24454432) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT char('123') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT char(name) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT char(-0.44444444432243335477657382) FROM Test_Builtin_Func_1 LIMIT 1;


--CHAR_LENGTH
SELECT CHAR_LENGTH(name) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT CHAR_LENGTH(' 你好 ') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT CHAR_LENGTH('2020-04-03 11:11:11') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT CHAR_LENGTH(DATE '2020-04-03 11:11:11') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT CHAR_LENGTH(id) FROM Test_Builtin_Func_1 ORDER BY id;


--CHARACTER_LENGTH
SELECT CHARACTER_LENGTH(name) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT CHARACTER_LENGTH(' 你好 ') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT CHARACTER_LENGTH('2020-04-03 11:11:11') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT CHARACTER_LENGTH(DATE '2020-04-03 11:11:11') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT CHARACTER_LENGTH(id) FROM Test_Builtin_Func_1 ORDER BY id;


--CHR
SELECT chr(95) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT chr(01) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT chr(0101) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT chr(101) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT chr(0x101) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT chr(name) FROM Test_Builtin_Func_1 LIMIT 1;


--COALESCE
SELECT coalesce(1, 2, 14,143,12,12,41,122,12,21,13,1,1,21,15,61,91,71,81,19) FROM Test_Builtin_Func_1 limit 1;

SELECT coalesce(4, 2, 14,143,12,12,41,122,12,21,13,1,1,21,15,61,91,71,81,19,null) FROM Test_Builtin_Func_1 limit 1;

SELECT coalesce(null, 2, 14,143,12,12,41,122,12,21,13,1,1,21,15,61,91,71,81,19,null) FROM Test_Builtin_Func_1 limit 1;

SELECT coalesce(NULL,4, 2, 14,143,12,12,41,122,12,21,13,1,1,21,15,61,91,71,81,19) FROM Test_Builtin_Func_1 limit 1;

--执行不停止
--SELECT coalesce(NULL,4, 2, 14,143,12,12,41,122,12,21.21,13,1,1,21,15,61,91,71,81,19,323.33,67,34,21,5789,324543,78,2311,44,46,54,78,98,7655,666774,6432,687,09,5,99,9098,8987,6665,89,88,8,557,780) FROM Test_Builtin_Func_1 limit 1;

--SELECT coalesce(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL) FROM Test_Builtin_Func_1 limit 1;

--异常测试
SELECT coalesce(-0.4444444443224333547685878378856783467204678547657382,NULL,null) FROM Test_Builtin_Func_1 LIMIT 1;


--CONCAT
SELECT concat('ldb的话沙发和文件拷贝VCD加快了我iu活动和巴西马赛克了', '12345689客户公分的身高多少', '那肯定深刻的撒觉得你塞克我','“yweuuiqkjrwehj327890ewy188yruerfmsdjkew紧急时刻到了封杀，。;;[]{}\|!@#$%*)&#&(@&!_+-=`发货金额为','edrgierqj3289','erwqefgre329083uqa5ykhfgbhyfsdkhjfdkahauewiry8w9rrhfhfhfgh') FROM Test_Builtin_Func_1 limit 1;

SELECT concat('LDB', null, 'wd') FROM Test_Builtin_Func_1 limit 1;

SELECT concat('Linkoop DB', 'SQL', 1246575839263747372995734736761) FROM Test_Builtin_Func_1 limit 1;

SELECT concat('Linkoop DB', 'SQL', null) FROM Test_Builtin_Func_1 limit 1;

SELECT concat('1', '2', '2',4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,44,4,4,4,4,4,4,4,4,4,4,4,4,2,4,4,4,4,4,4,4,4,3,4,43,3,4,5,5,4,6,6,89,8,90) FROM Test_Builtin_Func_1 limit 1;

--返回结果为null
SELECT concat('1', '2', '2',4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,44,4,4,4,4,4,4,4,4,4,4,4,4,2,4,4,4,4,4,4,4,4,3,4,43,3,4,5,5,4,6,null) FROM Test_Builtin_Func_1 limit 1;


--CONCAT_WS
SELECT concat_ws('LDB', null, 'wd') FROM Test_Builtin_Func_1 limit 1;

SELECT concat_ws('LDB', ' ', 'wd') FROM Test_Builtin_Func_1 limit 1;

SELECT concat_ws('LDB', '', 'wd') FROM Test_Builtin_Func_1 limit 1;

SELECT concat_ws(' l ', 'ndy', 'wd') FROM Test_Builtin_Func_1 limit 1;

SELECT concat_ws('Linkoop DB', 'SQL', 1246575839263747372995734736761) FROM Test_Builtin_Func_1 limit 1;

SELECT concat_ws('Linkoop DB', 'SQL', null) FROM Test_Builtin_Func_1 limit 1;

SELECT concat_ws('1', '2', '2',4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,44,4,4,4,4,4,4,4,4,4,4,4,4,2,4,4,4,4,4,4,4,4,3,4,43,3,4,5,5,4,6,6,89,8,90) FROM Test_Builtin_Func_1 limit 1;

SELECT concat_ws('1', '2', '2',4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,44,4,4,4,4,4,4,4,4,4,4,4,4,2,4,4,4,4,4,4,4,4,3,4,43,3,4,5,5,4,6,null) FROM Test_Builtin_Func_1 limit 1;


--CONV
SELECT conv('100', 2, 10) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv('100', 10, 2) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv('2', 10, 2) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv('2444', 10, 16) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv('4444', 10, 8) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv('23432', 16, 8) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv('2322', 8, 16) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv('234432', 8, 2) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv('23443224322', 8, -10) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv(634, 16, 8) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv(null, 16, 8) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv(null, null, null) from Test_Builtin_Func_1 LIMIT 1;

SELECT conv(-0.44444444487382,10,8) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT conv(12435,10,2.4) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT conv(12435,10,2.7) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT conv(conv(12435,10,2.7),10,8) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
--s1000
SELECT conv(12435,NULL,null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT conv(-0.4444444443224333547685878378856783467204678547657382,8,2) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT conv(12435,10,2,4) FROM Test_Builtin_Func_1 LIMIT 1;


--CORR
SELECT corr(-123.2,-456.2) from Test_Builtin_Func_1 LIMIT 1;

SELECT corr(salary,grade) from Test_Builtin_Func_1;

SELECT corr(salary,id) from Test_Builtin_Func_1;

--异常测试
SELECT corr(name,id) from Test_Builtin_Func_1 LIMIT 1;

SELECT corr(salary,name) from Test_Builtin_Func_1;

--COS
SELECT cos(342342689) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT cos(salary) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试
SELECT cos(name) FROM Test_Builtin_Func_1;

SELECT cos(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--COSH
SELECT cosh(0.44444444482) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT cosh(id) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT cosh(0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT cosh(name) FROM Test_Builtin_Func_1 LIMIT 1;


--COT
SELECT cot(0.44444444482) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT cot(id) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT cot(0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT cot(name) FROM Test_Builtin_Func_1 LIMIT 1;


--COVAR_POP
SELECT covar_pop(salary,grade) from Test_Builtin_Func_1 LIMIT 1;

SELECT covar_pop(grade,salary) from Test_Builtin_Func_1 LIMIT 1;

SELECT covar_pop(0,0) from Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT covar_pop(0.4444444443224333547685878378856783467204678547657382,43) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT covar_pop(name,salary) from Test_Builtin_Func_1 LIMIT 1;


--COVAR_SAMP
SELECT COVAR_SAMP(salary,grade) from Test_Builtin_Func_1 LIMIT 1;

SELECT COVAR_SAMP(grade,salary) from Test_Builtin_Func_1 LIMIT 1;

SELECT COVAR_SAMP(0,0) from Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT COVAR_SAMP(0.4444444443224333547685878378856783467204678547657382,43) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT COVAR_SAMP(name,salary) from Test_Builtin_Func_1 LIMIT 1;


--CRC32
SELECT CRC32(' ') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT CRC32(null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT CRC32(name) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试
SELECT CRC32(salary) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT CRC32(id) FROM Test_Builtin_Func_1 ORDER BY id;


--CURRENT_DATABASE
SELECT CURRENT_DATABASE() FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT CURRENT_DATABASE(a) FROM Test_Builtin_Func_1 LIMIT 1;


--DEGREES
SELECT degrees(374383982733) FROM Test_Builtin_Func_1 limit 1;

SELECT degrees(salary) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试
SELECT degrees(0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 limit 1;


--ELT
SELECT elt(6, 'scala', 'java', 'hello world','a','b','c','d','e') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT elt(id, 'scala', 'java', 'hello world') FROM Test_Builtin_Func_1 ORDER BY id;

SELECT elt(6, 'scala', 'java',NULL, 'hello world','a','b','c','d','e') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT elt(6, 'scala', 'java','hello world','a','b','c','d','e',123) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT elt(0, 'scala', 'java', 'hello world','a','b','c','d','e') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT elt(65, 'scala', 'java', 'hello world','a','b','c','d','e') FROM Test_Builtin_Func_1 LIMIT 1;


--ENCODE
SELECT encode('abc', 'utf-8') from Test_Builtin_Func_1 LIMIT 1;

SELECT encode('abc', 'gbk') from Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT encode('abc', '12') from Test_Builtin_Func_1 LIMIT 1;


--EXP
SELECT exp(99) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT exp(id) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试
SELECT exp(name) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT exp(0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--COLLECT_LIST
SELECT collect_list(name) FROM  Test_Builtin_Func_1;

SELECT collect_list(id),collect_list(salary) FROM  Test_Builtin_Func_1;

--异常测试
SELECT collect_list('a','b','c') FROM Test_Builtin_Func_1;

SELECT collect_list(id,name,salary) FROM Test_Builtin_Func_1;


--COLLECT_SET
SELECT collect_set(id),collect_set(salary) FROM  Test_Builtin_Func_1;

--异常测试
SELECT collect_set('a','b','c') FROM Test_Builtin_Func_1;

SELECT collect_set(id,name,salary) FROM Test_Builtin_Func_1;


--EXPLODE
SELECT EXPLODE(array[1,2,3,45])FROM  Test_Builtin_Func_1;

--异常测试
SELECT EXPLODE(collect_set(id)) FROM  Test_Builtin_Func_1;

SELECT EXPLODE(id) FROM  Test_Builtin_Func_1;


--EXPLODE_OUTER
SELECT EXPLODE_OUTER(array[1,2,3,45])FROM  Test_Builtin_Func_1;

SELECT EXPLODE_OUTER(id) FROM  Test_Builtin_Func_1;

--异常测试
SELECT EXPLODE_OUTER(collect_set(id)) FROM  Test_Builtin_Func_1;


--EXPM1
SELECT EXPM1(id) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试
SELECT EXPM1(name) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT EXPM1(0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--FACTORIAL
SELECT factorial(salary) FROM Test_Builtin_Func_1;

SELECT factorial(id) FROM Test_Builtin_Func_1;

--异常测试
SELECT factorial(name) FROM Test_Builtin_Func_1;

SELECT factorial(20) FROM Test_Builtin_Func_1 ;

SELECT factorial(21) FROM Test_Builtin_Func_1 ;


--FIND_IN_SET
SELECT find_in_set('a',null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT find_in_set(null,null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT find_in_set(null,'a') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT find_in_set('a','b,b,c,d,e,a,aa,aaa,aaaaa') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT find_in_set('a','b,b,c,d,e,aa,aaa,aaaaa') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT find_in_set(1,'0,2,1,45') FROM Test_Builtin_Func_1 LIMIT 1;


--FIRST
SELECT first(name) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first('hello','123,','ew') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first(NULL,'hello','123,','ew') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first('wow',name,'omg') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first(NULL,'wow',name,'omg') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first(first(name),'wow','omg') FROM Test_Builtin_Func_1 LIMIT 1;


--FIRST_VALUE
SELECT first_value(name) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first_value('hello','123,','ew') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first_value(NULL,'hello','123,','ew') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first_value('wow',name,'omg') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first_value(NULL,'wow',name,'omg') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT first_value(first_value(name),'wow','omg') FROM Test_Builtin_Func_1 LIMIT 1;


--FLOOR
SELECT floor(1233443895.375) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT floor(-213.748) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT floor(name) FROM Test_Builtin_Func_1;

SELECT floor(0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--FORMAT_NUMBER
SELECT format_number(12332.123456, '##################.###') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_number(12332.123456, '##################.####') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_number(12332.123456, '##################.##') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_number(12332.123456,2) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_number(12332.123456,0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_number(12332.923456,0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_number(salary,10) FROM Test_Builtin_Func_1;

--异常测试
SELECT format_number(name,0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_number(0.4444444443224333547685878378856783467204678547657382,0) FROM Test_Builtin_Func_1 LIMIT 1;


--FORMAT_STRING
SELECT format_string('Hello World %d %s', 100, 'days') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_string('Hello World', 100, 'days') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_string('Hello World %d', 100, 'days') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_string('Hello World %x %d %X %c %s %s %f', 100, 100,100,100,100,name,salary) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT format_string('Hello World %d %s', 100,100,100,100,100,100,100,100,100,1001,11) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT format_string('Hello World %d %s', 100) FROM Test_Builtin_Func_1 LIMIT 1;


--GET_JSON_OBJECT
SELECT GET_JSON_OBJECT('{"a":"b"}', '$.a') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT GET_JSON_OBJECT('{
 "store":
        {
         "fruit":[{"weight":8,"type":"apple"}, {"weight":9,"type":"pear"}],  
         "bicycle":{"price":19.95,"color":"red"}
         }, 
 "email":"amy@only_for_json_udf_test.net", 
 "owner":"amy" 
}
', '$.store') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT GET_JSON_OBJECT('{
 "store":
        {
         "fruit":[{"weight":8,"type":"apple"}, {"weight":9,"type":"pear"}],  
         "bicycle":{"price":19.95,"color":"red"}
         }, 
 "email":"amy@only_for_json_udf_test.net", 
 "owner":"amy" 
}
', '$.email') FROM Test_Builtin_Func_1 LIMIT 1;


SELECT GET_JSON_OBJECT('{
 "store":
        {
         "fruit":[{"weight":8,"type":"apple"}, {"weight":9,"type":"pear"}],  
         "bicycle":{"price":19.95,"color":"red"}
         }, 
 "email":"amy@only_for_json_udf_test.net", 
 "owner":"amy" 
}
', '$.store.fruit[0].weight') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT GET_JSON_OBJECT('{
 "store":
        {
         "fruit":[{"weight":8,"type":"apple"}, {"weight":9,"type":"pear"}],  
         "bicycle":{"price":19.95,"color":"red"}
         }, 
 "email":"amy@only_for_json_udf_test.net", 
 "owner":"amy" 
}
', '$.store.fruit[3].weight') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT GET_JSON_OBJECT('{
 "store":
        {
         "fruit":[{"weight":8,"type":"apple"}, {"weight":9,"type":"pear"}],  
         "bicycle":{"price":19.95,"color":"red"}
         }, 
 "email":"amy@only_for_json_udf_test.net", 
 "owner":"amy" 
}
', '$.[3]') FROM Test_Builtin_Func_1 LIMIT 1;


--GREATEST
SELECT greatest(10, 9, 2, 4, 3,null) FROM Test_Builtin_Func_1 LIMIT 1;

--SELECT greatest(10, 9, 2, 4, 3,345,342,12,43534,5463,34,2,2313,213,45,436,76,786,886,767,876,768,867,64,4,3,3,3,3,2,1,5,3,54,5,6,7,7,6,8) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT greatest(10,9,floor(3.4)) FROM Test_Builtin_Func_1 LIMIT 1;


--HASH
SELECT hash(null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT hash(123) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT hash(date '2020-02-20') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT hash(name) FROM Test_Builtin_Func_1 ORDER BY id;


--HEX
SELECT hex(id) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT hex('linkoopdb') FROM Test_Builtin_Func_1  LIMIT 1;

SELECT id,hex(salary) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT hex(name) FROM Test_Builtin_Func_1  ORDER BY id;


--HYPOT
SELECT hypot(0,0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT hypot(5,12) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT hypot(id,name) FROM Test_Builtin_Func_1 LIMIT 1;


--IF
SELECT if(1 < 2, 'a', null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT if(1 > 2, 'a', null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT if(1 < 2, null, 'b') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT if(null, null, 'b') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT IF(0,NULL,1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT if(1 < 2, 'a', 'b','c') FROM Test_Builtin_Func_1 LIMIT 1;


--IFNULL
select ifnull(id,null) from Test_Builtin_Func_1 ORDER BY id;

select ifnull(NULL,id) from Test_Builtin_Func_1 ORDER BY id;


--INITCAP
SELECT initcap(name) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT initcap(salary) FROM Test_Builtin_Func_1 ORDER BY id;


--INPUT_FILE_NAME
SELECT input_file_name() FROM Test_Builtin_Func_1 LIMIT 1;


--ISNAN
SELECT ISNAN(asin(-1565567.6535643665434565777777734534546)) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT ISNAN(asin(id)) FROM Test_Builtin_Func_1 LIMIT 1;


--ISNOTNULL
SELECT isnotnull(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT isnotnull(null) FROM Test_Builtin_Func_1 LIMIT 1;


--JSON_PATH
SELECT JSON_PATH('{ "store": {
    "book": [
      { "category": "reference",
        "author": "Nigel Rees",
        "title": "Sayings of the Century",
        "price": 8.95
      },
      { "category": "fiction",
        "author": "Evelyn Waugh",
        "title": "Sword of Honour",
        "price": 12.99
      },
      { "category": "fiction",
        "author": "Herman Melville",
        "title": "Moby Dick",
        "isbn": "0-553-21311-3",
        "price": 8.99
      },
      { "category": "fiction",
        "author": "J. R. R. Tolkien",
        "title": "The Lord of the Rings",
        "isbn": "0-395-19395-8",
        "price": 22.99
      }
    ],
    "bicycle": {
      "color": "red",
      "price": 19.95
    }
  }
}','$.store.book[*].author') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT JSON_PATH('{ "store": {
    "book": [
      { "category": "reference",
        "author": "Nigel Rees",
        "title": "Sayings of the Century",
        "price": 8.95
      },
      { "category": "fiction",
        "author": "Evelyn Waugh",
        "title": "Sword of Honour",
        "price": 12.99
      },
      { "category": "fiction",
        "author": "Herman Melville",
        "title": "Moby Dick",
        "isbn": "0-553-21311-3",
        "price": 8.99
      },
      { "category": "fiction",
        "author": "J. R. R. Tolkien",
        "title": "The Lord of the Rings",
        "isbn": "0-395-19395-8",
        "price": 22.99
      }
    ],
    "bicycle": {
      "color": "red",
      "price": 19.95
    }
  }
}','$.store..price') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT JSON_PATH('{ "store": {
    "book": [
      { "category": "reference",
        "author": "Nigel Rees",
        "title": "Sayings of the Century",
        "price": 8.95
      },
      { "category": "fiction",
        "author": "Evelyn Waugh",
        "title": "Sword of Honour",
        "price": 12.99
      },
      { "category": "fiction",
        "author": "Herman Melville",
        "title": "Moby Dick",
        "isbn": "0-553-21311-3",
        "price": 8.99
      },
      { "category": "fiction",
        "author": "J. R. R. Tolkien",
        "title": "The Lord of the Rings",
        "isbn": "0-395-19395-8",
        "price": 22.99
      }
    ],
    "bicycle": {
      "color": "red",
      "price": 19.95
    }
  }
}','$..book[?(@.isbn)]') FROM Test_Builtin_Func_1 LIMIT 1;




--LCASE
SELECT lcase(null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT lcase('数据库') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT lcase('ABC DEF GHI IDis') FROM Test_Builtin_Func_1 LIMIT 1;


--LEAST
SELECT least(10, null, 2, 4, 3) FROM Test_Builtin_Func_1 limit 1;

SELECT least( null,null) FROM Test_Builtin_Func_1 limit 1;

SELECT least(10, -1, 2, 4, 3,32,45,667,-604823,325,534,6,45,3,4,43,43,15,7889) FROM Test_Builtin_Func_1 limit 1;


--LEFT
SELECT LEFT('linkoopdb',0) FROM Test_Builtin_Func_1 limit 1;

SELECT LEFT('linkoopdb','i') FROM Test_Builtin_Func_1 limit 1;

SELECT LEFT('linkoopdb',10000000000000000000000) FROM Test_Builtin_Func_1 limit 1;


--LENGTH
SELECT LENGTH('  ') FROM Test_Builtin_Func_1 limit 1;

SELECT LENGTH(name) FROM Test_Builtin_Func_1 order by id;
--异常测试
SELECT LENGTH(timestamp '2019-02-11 09:22:23') FROM Test_Builtin_Func_1 limit 1;

SELECT LENGTH( ) FROM Test_Builtin_Func_1 limit 1;

SELECT LENGTH(abc) FROM Test_Builtin_Func_1 limit 1;


--LEVENSHTEIN
SELECT levenshtein('2019-02-11 09:22:23', '2019-12-23 09:44:23') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT levenshtein(id, name) FROM Test_Builtin_Func_1 LIMIT 1;


--LN
SELECT ln(1234443.376367367347743834932390239066466565646) FROM Test_Builtin_Func_1 LIMIT 1;


--LOCATE
SELECT locate('bar', 'barbarbar') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT locate('bar', 'barbarbar',3) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT locate('bar', 'barbarbar',1000000) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT locate('bar', 'barbarbar',-1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT locate('bar', 'barbarbar',0) FROM Test_Builtin_Func_1 LIMIT 1;


--LOG10
SELECT log10(10000000000000000) FROM Test_Builtin_Func_1 limit 1;

SELECT log10(0) FROM Test_Builtin_Func_1 limit 1;

SELECT log10(-10000000000000000) FROM Test_Builtin_Func_1 limit 1;


--LOG1P
SELECT log1p(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT log1p(1000000000000000000000000) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT log1p(-1000000000000000000000000) FROM Test_Builtin_Func_1 LIMIT 1;


--LOG2
SELECT log2(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT log2(1000000000000000000000000) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT log2(-1000000000000000000000000) FROM Test_Builtin_Func_1 LIMIT 1;


--LOWER
SELECT lower('ABDC DUJW WJ') FROM Test_Builtin_Func_1 limit 1;

SELECT lower('1212435') FROM Test_Builtin_Func_1 limit 1;

--异常测试
SELECT lower(122334) FROM Test_Builtin_Func_1 limit 1;


--LPAD
SELECT lpad('hi', 5, '??') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT lpad('hi',10, '??') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT lpad('hi',0, '??') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT lpad('hi',-10, '??') FROM Test_Builtin_Func_1 LIMIT 1;


--MD5
SELECT md5('6666') FROM Test_Builtin_Func_1 LIMIT 1;


--MOD
SELECT mod(10, 3) FROM Test_Builtin_Func_1 LIMIT 1;

--NANVL
SELECT nanvl(asin(-1565567.6535643665434565777777734534546),null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT nanvl(asin(-922337203685477580999888765),1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT nanvl(asin(9223372036854775809998986778987),'abcd') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT nanvl(asin(id),id) FROM Test_Builtin_Func_1 ORDER BY id;


--NEGATIVE
SELECT NEGATIVE(id) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT NEGATIVE('asd') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT NEGATIVE(null) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NEGATIVE(0) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NEGATIVE(-1565567.6535643665434565777777734534546) FROM Test_Builtin_Func_1  LIMIT 1;


--NULLIF
SELECT NULLIF(asin(id),id) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT NULLIF(null,null) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NULLIF(9,null) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NULLIF(null,9) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NULLIF(9,9) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT NULLIF(99999639) FROM Test_Builtin_Func_1  LIMIT 1;


--NVL
SELECT NVL(asin(id),id) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT NVL(null,null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT NVL(9,null) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL(null,9) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL(9,9) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL(99999639) FROM Test_Builtin_Func_1  LIMIT 1;


--NVL2
SELECT NVL2(asin(id),id,NEGATIVE(id)) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT NVL2(null,NULL,null) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL2(9,10,null) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL2(null,9,12) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL2(9,null,12) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL2(null,null,12) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL2(122,null,null) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL2(99999639) FROM Test_Builtin_Func_1  LIMIT 1;

SELECT NVL2(99999639,21) FROM Test_Builtin_Func_1  LIMIT 1;


--PARSE_URL
SELECT PARSE_URL('http://www.google.com/PATH?query=1', 'HOST') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PARSE_URL('http://www.google.com/PATH?query=1', 'QUERY') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PARSE_URL('http://www.google.com/PATH?query=1', 'PATH') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PARSE_URL('http://facebook.com/path/p1.php?query=1', 'REF') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PARSE_URL('http://facebook.com/path/p1.php?query=1', 'PROTOCOL') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PARSE_URL('http://facebook.com/path/p1.php?query=1', 'FILE') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PARSE_URL('http://facebook.com/path/p1.php?query=1', 'AUTHORITY') FROM Test_Builtin_Func_1 LIMIT 1;



--PERCENTILE
SELECT PERCENTILE(1124.56345, 0.5, 100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PERCENTILE(1124.56345, 0.2, 100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PERCENTILE(1124.56345, 0.2) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT PERCENTILE(1124.56345, 2.2, 100) FROM Test_Builtin_Func_1 LIMIT 1;

--PERCENTILE_APPROX
SELECT PERCENTILE_APPROX(1124.56345, 0.5, 100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PERCENTILE_APPROX(1124.56345, 0.2, 100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PERCENTILE_APPROX(1124.56345, 0.2) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT PERCENTILE_APPROX(1124.56345, 2.2, 100) FROM Test_Builtin_Func_1 LIMIT 1;



--PMOD
SELECT PMOD(-1, 3) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PMOD(3, 1) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PMOD(1, 3) FROM Test_Builtin_Func_1 LIMIT 1;



--POSITION
SELECT POSITION('ldb' IN 'linkoopdb') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POSITION('ko' IN 'linkoopdb') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POSITION('oo' IN 'linkoopdb') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POSITION(' ' IN 'linkoo pdb') FROM Test_Builtin_Func_1 LIMIT 1;


--POSITIVE

SELECT POSITIVE(1+2/23*22123*1222) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POSITIVE(1+2-23*(22123*1222)) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POSITIVE(1+2/(23*22123*1222)) FROM Test_Builtin_Func_1 LIMIT 1;



--POW
SELECT POW(null, 3) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POW(null, null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POW(4, null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POW(0, 0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POW(1.765, -23.45) FROM Test_Builtin_Func_1 LIMIT 1;

--POWER
SELECT POWER(null, 3) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POWER(null, null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POWER(4, null) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POWER(0, 0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT POWER(1.765, -23.45) FROM Test_Builtin_Func_1 LIMIT 1;


-- PRINTF
SELECT PRINTF('Hello World %d %s', 100, 'days') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PRINTF('Hello World %d', 100, 'days') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PRINTF('Hello World %s', 100, 'days') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT PRINTF('Hello World %d', 100, 'days') FROM Test_Builtin_Func_1 LIMIT 1;





--RADIANS
SELECT RADIANS(180) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT RADIANS(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT RADIANS(90) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT RADIANS(0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT RADIANS(1.1235) FROM Test_Builtin_Func_1 LIMIT 1;




--RAND
SELECT RAND() FROM Test_Builtin_Func_1;

SELECT RAND(1) FROM Test_Builtin_Func_1;

SELECT RAND(12356) FROM Test_Builtin_Func_1;

SELECT RAND(1.2357) FROM Test_Builtin_Func_1;

SELECT RAND(id) FROM Test_Builtin_Func_1;


-- RANDN
SELECT RANDN() FROM Test_Builtin_Func_1;

SELECT RANDN(1) FROM Test_Builtin_Func_1;

SELECT RANDN(12356) FROM Test_Builtin_Func_1;

SELECT RANDN(1.2357) FROM Test_Builtin_Func_1;

SELECT RANDN(id) FROM Test_Builtin_Func_1;




--REGEXP_EXTRACT
SELECT REGEXP_EXTRACT('100-200', '(\d)', 1) FROM Test_Builtin_Func_1 limit 1;

SELECT REGEXP_EXTRACT('oom&ssm&dmm', '(o|d|s)m', 1) FROM Test_Builtin_Func_1 limit 1;

SELECT REGEXP_EXTRACT('oom&ssm&dmm', '(o|d|s)m', 0) FROM Test_Builtin_Func_1 limit 1;

SELECT REGEXP_EXTRACT('oom&ssm&dmm', '(o|d|s)m', 2) FROM Test_Builtin_Func_1 limit 1;

SELECT REGEXP_EXTRACT('22.629024982452393,113.84886883199215', '(\d+),(\d+)', 1) FROM Test_Builtin_Func_1 limit 1;



--REGEXP_REPLACE
SELECT regexp_replace('100-200', '(\d)', 'num') FROM Test_Builtin_Func_1 limit 1;

SELECT regexp_replace('oom&ssm&dmm', '(o|d|s)m', '*') FROM Test_Builtin_Func_1 limit 1;


--REPEAT
SELECT repeat('123', 1000) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT repeat('123', 1000.4325) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT repeat('123', -1000) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT repeat(123, -1000) FROM Test_Builtin_Func_1 LIMIT 1;


--REPLACE
SELECT replace('ABCabc','e324','ewrewq') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT replace('ABCabc','e324') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT replace('ABCabcerfsdfwer','sdfwe','ewrewq') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT replace('aabbaabbccdd','ab','ewrewq') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT replace(1223345,23,'ewrewq') FROM Test_Builtin_Func_1 LIMIT 1;


--REVERSE
SELECT reverse(name) FROM Test_Builtin_Func_1 ORDER BY id;

SELECT reverse('EMS解放和维护广大') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT reverse('126364759869746363525424244264会降低房价恢复健康撒dsjkfh j') FROM Test_Builtin_Func_1 LIMIT 1;


--RIGHT
SELECT right('Linkoop db', 2) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT right('Linkoop db', 2.9) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT right('Linkoop db', 100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT right('Linkoop db', -100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT right('Linkoop db', -10000000000000000000) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT right('Linkoop db', 10000000000000000000) FROM Test_Builtin_Func_1 LIMIT 1;


--RINT
SELECT rint(-444444444322433354768.58783788567882) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT rint(444444444322433354768.58783788567882) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT rint(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--RLIKE
SELECT rlike('^\abc$', 'a') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT rlike('a', '^\abc$') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT rlike('天王盖地虎，小鸡炖蘑菇', '虎，菇') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT rlike('天王盖地虎，小鸡炖蘑菇', '虎，小') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT rlike(123, 12) FROM Test_Builtin_Func_1 LIMIT 1;


--ROUND
SELECT round(2.53453253254245345345, 0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT round(2.53453253254245345345, -10) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT round(2.53453253254245345345, 5) FROM Test_Builtin_Func_1 LIMIT 1;

--SELECT round(2.53453253254245345345, 4555432343432323223) FROM Test_Builtin_Func_1 LIMIT 1;

--SELECT round(2.5345325325424534534543524235435, 4555432343432323223) FROM Test_Builtin_Func_1 LIMIT 1;


--RPAD
SELECT rpad('hi', 5, '??') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT rpad('hi',10, '??') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT rpad('hi',0, '??') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT rpad('hi', 5000000000007658887, '??') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT rpad('hi',-10, '??') FROM Test_Builtin_Func_1 LIMIT 1;


--SHA
SELECT sha(binary('linkoopdb')) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT sha('linkoopdb') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT sha(123) FROM Test_Builtin_Func_1 LIMIT 1;


--SHA1
SELECT sha1(binary('linkoopdb')) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT sha1('linkoopdb') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT sha1(123) FROM Test_Builtin_Func_1 LIMIT 1;


--SHA2
SELECT sha2(binary('linkoopdb'), 256) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT sha2(binary('linkoopdb'), 224) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT sha2(binary('linkoopdb'), 384) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT sha2(binary('linkoopdb'), 512) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT sha2(binary('linkoopdb'), 666) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT sha2(binary('linkoopdb')) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT sha2(123, 256) FROM Test_Builtin_Func_1 LIMIT 1;


--SHIFTLEFT
SELECT shiftleft(14, 2) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT shiftleft(14.43, 2) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT shiftleft(-14.43, 2) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT shiftleft(null, 2) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT shiftleft(null, null) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT shiftleft(14.43, 4536543432) FROM Test_Builtin_Func_1 LIMIT 1;


--SIGNUM
SELECT signum(salary) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试
SELECT signum(name) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT signum('2020-02-20') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT signum(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--SIN
SELECT sin(342342689) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT sin(salary) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试
SELECT sin(name) FROM Test_Builtin_Func_1;

SELECT sin(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;

--SINH
SELECT SINH(342342689) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT SINH(salary) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试
SELECT SINH(name) FROM Test_Builtin_Func_1;

SELECT SINH(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--SIZE

--异常测试
SELECT size(name) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT size(map(1,2,3)) FROM Test_Builtin_Func_1 LIMIT 1;


--SOUNDEX
SELECT SOUNDEX('Linkoopdb') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT SOUNDEX('互访对赛') FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试
SELECT SOUNDEX(salary) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT SOUNDEX(id) FROM Test_Builtin_Func_1 LIMIT 1;




--SPACE
SELECT CONCAT(SPACE(0), '1')  FROM Test_Builtin_Func_1 LIMIT 1;

SELECT CONCAT(SPACE(100), '1')  FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试

SELECT CONCAT(SPACE(100000000000), '1')  FROM Test_Builtin_Func_1 LIMIT 1;


--SPLIT
SELECT split('oneAtwoBthreeC', '[A]') from Test_Builtin_Func_1 LIMIT 1;

SELECT split('www.baidu.com.cn', '[.]') from Test_Builtin_Func_1 LIMIT 1;

SELECT split('www&baidu&com&cn', '[&]') from Test_Builtin_Func_1 LIMIT 1;

SELECT split('oneAtwoBthreeC', 'ABC') from Test_Builtin_Func_1 LIMIT 1;


--SQRT
SELECT SQRT(0.0) FROM Test_Builtin_Func_1 limit 1;

SELECT SQRT(-34567.0) FROM Test_Builtin_Func_1 limit 1;

--异常测试

SELECT SQRT(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;



--SUBSTR
SELECT substr('L inkoop DB', -100) FROM Test_Builtin_Func_1 limit 1;

SELECT substr('L inkoop DB', 0) FROM Test_Builtin_Func_1 limit 1;

SELECT substr('L inkoop DB', 0, 2) FROM Test_Builtin_Func_1 limit 1;

SELECT substr('L inkoop DB', 3, 100) FROM Test_Builtin_Func_1 limit 1;

SELECT substr('L inkoop DB', 76, 2) FROM Test_Builtin_Func_1 limit 1;


--SUBSTRING_INDEX
SELECT substring_index('www.apache.org.com', '.', 3) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT substring_index('www.apache.org.com', '.', 0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT substring_index('www.apache.org.com', '.', 6) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT substring_index('www.apache.org.com', '.', -10) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT substring_index('www.apache.org.com', '.', 2.6) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT substring_index('www.apache.org.com', '-', 3) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT substring_index('www-apache-org.com', '-', 1) FROM Test_Builtin_Func_1 LIMIT 1;


--TAN
SELECT tan(342342689) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT tan(salary) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试

SELECT tan(name) FROM Test_Builtin_Func_1;

SELECT tan(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;

--TANH
SELECT tanh(342342689) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT tanh(salary) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试

SELECT tanh(name) FROM Test_Builtin_Func_1;

SELECT tanh(-0.4444444443224333547685878378856783467204678547657382) FROM Test_Builtin_Func_1 LIMIT 1;


--TRANSLATE
SELECT TRANSLATE('linkoopdb','nob','123') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT TRANSLATE('linkoopdb','abc','123') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT TRANSLATE(name,'s','123') FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试

SELECT TRANSLATE(123456,123,456) FROM Test_Builtin_Func_1 LIMIT 1;


--UCASE
SELECT ucase('linkoopdb') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT ucase(name) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试

SELECT ucase(date '2020-02-20') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT ucase(salary) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT ucase(id) FROM Test_Builtin_Func_1 LIMIT 1;



--UPPER
SELECT upper('linkoopdb') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT upper(name) FROM Test_Builtin_Func_1 ORDER BY id;

--异常测试

SELECT upper(date '2020-02-20') FROM Test_Builtin_Func_1 LIMIT 1;

SELECT upper(salary) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT upper(id) FROM Test_Builtin_Func_1 LIMIT 1;



--TRUNC
SELECT trunc(12345.324,0) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT trunc(12345.324,100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT trunc(12345.32434265645,100) FROM Test_Builtin_Func_1 LIMIT 1;

SELECT trunc(12345.32434265645,3) FROM Test_Builtin_Func_1 LIMIT 1;

--异常测试

SELECT trunc('1234.3232',3) FROM Test_Builtin_Func_1 LIMIT 1;
