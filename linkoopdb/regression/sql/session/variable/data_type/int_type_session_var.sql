--Description:int type session variable test
--Date：2020-07-17
--Author：王煜

--connect
connect admin/123456@jdbc:linkoopdb:tcp://192.168.1.73:9105/ldb
--记录执行时间
set TIMING off
--返回结果
set TERMOUT on
--是否打印执行的SQL语句
set ECHO ON

--------------------------------------------------------
----INT
DECLARE tint INT;

SHOW SESSION_VARIABLES;

SET tint=1;

SHOW SESSION_VARIABLES;

