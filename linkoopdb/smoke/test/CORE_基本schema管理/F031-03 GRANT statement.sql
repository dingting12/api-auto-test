
-- 清空环境
drop user user cascade;
drop schema test IF  EXISTS cascade;

-- 创建用户
create user user password '123456';

GRANT CREATE_SCHEMA TO USER;

connect USER/123456;

-- 创建库
create schema test;

