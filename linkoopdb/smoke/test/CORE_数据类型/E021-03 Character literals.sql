set echo on

-- 开启转义
set session escape on;

-- 清空环境
drop table T_literals  IF  EXISTS;

-- 创建包含字符类型的表
create table T_literals (tinteger integer, CHARACTERS CHARACTER VARYING(1000),chars char(10),VARCHARs VARCHAR(100));

-- 插入包含特殊字符和中文的数据
INSERT INTO T_literals values(1233444,'dhfsdjkhdjk\-dkjj爱我中华哦哦哦哦哦哦','hello shinee','\'叮当法术便便变欧耶\'');

-- 验证数据
select * from T_literals;