set echo on

-- 验证SQL_FEATURES系统表是否可用
select * from information_schema.SQL_FEATURES order by FEATURE_ID limit 10;

-- 验证SQL_FEATURES系统表是否可用
select count(*) from information_schema.SQL_FEATURES;