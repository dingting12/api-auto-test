--Description:count
--Date：2020-06-05
--Author：耿晨雨
 

connect admin/123456


set timing on

set ECHO ON

set WHENEVER_SQLERROR CONTINUE

-- 清空环境
drop table P1000_CY_COUNT	if exists;

-- 创建count使用的表
create table P1000_CY_COUNT as (select * from P1000)with data;

-- 统计所有数据条数，条数为10000000
select count(*) from P1000_CY_COUNT;

-- 单个去重字段，统计SMALLINT类型字段无重复的条数，条数为961
select count(DISTINCT TSMALLINT ) from P1000_CY_COUNT;

-- 单个去重字段，统计INTEGER类型字段无重复的条数，条数为9999
select count(DISTINCT TINTEGER  ) from P1000_CY_COUNT;

-- 单个去重字段，统计BIGINT类型字段无重复的条数，条数为9999
select count(DISTINCT TBIGINT   ) from P1000_CY_COUNT;

-- 单个去重字段，统计REAL类型字段无重复的条数，条数为62465
select count(DISTINCT TREAL     ) from P1000_CY_COUNT;

-- 单个去重字段，统计DOUBLE类型字段无重复的条数，条数为62465
select count(DISTINCT TDOUBLE   ) from P1000_CY_COUNT;

-- 单个去重字段，统计FLOAT类型字段无重复的条数，条数为62465
select count(DISTINCT TFLOAT    ) from P1000_CY_COUNT;

-- 单个去重字段，统计DECIMAL类型字段无重复的条数，条数为62465
select count(DISTINCT TDECIMAL  ) from P1000_CY_COUNT;

-- 单个去重字段，统计NUMERIC类型字段无重复的条数，条数为923485
select count(DISTINCT TNUMERIC  ) from P1000_CY_COUNT;

-- 单个去重字段，统计DATE类型字段无重复的条数，条数为25932
select count(DISTINCT TDATE     ) from P1000_CY_COUNT;

-- 单个去重字段，统计TIMESTAMP类型字段无重复的条数，条数为9977700
select count(DISTINCT TTIMESTAMP) from P1000_CY_COUNT;

-- 单个去重字段，统计BOOL类型字段无重复的条数，条数为1
select count(DISTINCT TBOOL     ) from P1000_CY_COUNT;

-- 单个去重字段，统计CHAR类型字段无重复的条数，条数为9999
select count(DISTINCT TCHAR     ) from P1000_CY_COUNT;

-- 单个去重字段，统计VARCHAR类型字段无重复的条数，条数为9999
select count(DISTINCT TVARCHAR  ) from P1000_CY_COUNT;

-- 多个去重字段，统计SMALLINT、DOUBLE、BOOLEAN和VARCHAR类型字段无重复的条数，条数为9999881
select count(DISTINCT TSMALLINT,TDOUBLE,TBOOL,TVARCHAR) from P1000_CY_COUNT;

-- 多个去重字段，统计INTEGER、DECIMAL、BOOLEAN和CHAR类型字段无重复的条数，条数为9999988
select count(DISTINCT TINTEGER,TDECIMAL,TBOOL,TCHAR) from P1000_CY_COUNT;

-- 多个去重字段，统计BIGINT、NUMERIC、DATE、BOOLEAN和VARCHAR类型字段无重复的条数，条数为10000000
select count(DISTINCT TBIGINT,TNUMERIC,TDATE,TBOOL,TVARCHAR) from P1000_CY_COUNT;