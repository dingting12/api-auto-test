-- 设置是否在日志中回显执行的SQL
set echo on
-- 显示当前SQL语句执行的时间，单位是秒
set timing on
-- 显示当前SQL完成时的系统时间
set time on

connect admin/123456
DROP TABLE TKE2 IF EXISTS;
CREATE TABLE TKE2
(ID INTEGER,
 NAME VARCHAR(20)
);
INSERT INTO TKE2 VALUES(1,'HELLO');
INSERT INTO TKE2 VALUES(2,'LALAL');
COMMIT;
SELECT * FROM TKE2 ORDER BY ID;
