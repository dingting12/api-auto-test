set echo on
-- 清空环境
drop table t_system_user  IF  EXISTS;

-- 创建表
CREATE TABLE IF NOT EXISTS t_system_user (
TABNO INT,
TABNAME VARCHAR(20)
);


-- 插入数据
INSERT INTO t_system_user VALUES (7369,'T_SYSTEM_USER');
INSERT INTO t_system_user VALUES (7499,'T_SYSTEM_USER1');
INSERT INTO t_system_user VALUES (7521,'WARD');


select TABLE_NAME from INFORMATION_SCHEMA.system_tables WHERE TABLE_NAME = (select TABNAME from t_system_user where TABNAME='T_SYSTEM_USER');