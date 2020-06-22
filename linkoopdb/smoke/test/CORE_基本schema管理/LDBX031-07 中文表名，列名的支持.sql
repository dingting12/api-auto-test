set echo on
-- 清空环境
drop table 中文表;

-- 创建中文表名和字段名的表
create  table 中文表 (标识 int, 姓名 varchar(255));

-- 插入数据
insert into 中文表 values(0, '张三'),(1, '李四');

-- 验证数据
select * from 中文表 order by 标识;