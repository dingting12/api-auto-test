set echo on
-- 清空环境
drop table udt_tab_sint IF EXISTS CASCADE;
drop table udt_tab_DOU IF EXISTS CASCADE;
drop table udt_tab_date IF EXISTS CASCADE;
drop table udt_tab_var IF EXISTS CASCADE;
drop table udt_tab_struct IF EXISTS CASCADE;
DROP TYPE udt_sint IF EXISTS CASCADE;
DROP TYPE udt_dou IF EXISTS CASCADE;
DROP TYPE udt_date IF EXISTS CASCADE;
DROP TYPE udt_var IF EXISTS CASCADE;
DROP TYPE udt_struct IF EXISTS CASCADE;



-- 创建SMALLINT类型的自定义类型
CREATE TYPE udt_sint AS SMALLINT;

-- 验证类型是否创建成功，并且验证类型
select data_type from INFORMATION_SCHEMA.USER_DEFINED_TYPES where user_defined_type_name = 'UDT_SINT';

-- 创建包含SMALLINT类型的自定义类型的表
create table udt_tab_sint(t udt_sint);

-- 插入数据
insert into udt_tab_sint values (1);

-- 查询结果
select * from udt_tab_sint;

-- 创建DOUBLE类型的自定义类型
CREATE TYPE udt_dou AS DOUBLE;

-- 验证类型是否创建成功，并且验证类型
select data_type from INFORMATION_SCHEMA.USER_DEFINED_TYPES where user_defined_type_name = 'UDT_DOU';

-- 创建包含DOUBLE类型的自定义类型的表
create table udt_tab_DOU(t t udt_dou);

-- 插入数据
insert into udt_tab_DOU values (2.3);

-- 查询结果
select * from udt_tab_DOU;

-- 创建DATE类型的自定义类型
CREATE TYPE udt_date AS DATE;

-- 验证类型是否创建成功，并且验证类型
select data_type from INFORMATION_SCHEMA.USER_DEFINED_TYPES where user_defined_type_name = 'UDT_DATE';

-- 创建包含DATE类型的自定义类型的表
create table udt_tab_date(t udt_date);

-- 插入数据
insert into udt_tab_date values ('2019-01-01');

-- 查询结果
select * from udt_tab_date;

-- 创建VARCHAR类型的自定义类型
CREATE TYPE udt_var AS varchar(50);

-- 验证类型是否创建成功，并且验证类型
select data_type from INFORMATION_SCHEMA.USER_DEFINED_TYPES where user_defined_type_name = 'UDT_VAR';

-- 创建包含VARCHAR类型的自定义类型的表
create table udt_tab_var(t udt_var);

-- 插入数据
insert into udt_tab_var values ('1');

-- 查询结果
select * from udt_tab_var;

-- 创建struct类型的自定义类型
CREATE TYPE IF NOT EXISTS udt_struct(col1 INT, col2 varchar(50), col3 double, col4 date);

-- 验证类型是否创建成功，并且验证类型
select data_type from INFORMATION_SCHEMA.USER_DEFINED_TYPES where user_defined_type_name = 'UDT_STRUCT';

-- 创建包含struct类型的自定义类型的表
create table udt_tab_struct(col1 udt_var,col2 udt_struct);

-- 插入数据
INSERT INTO udt_tab_struct VALUES('a',NEW udt_struct(1,'b',2.3,'2020-01-01'));

-- 查询结果
select * from udt_tab_struct;



