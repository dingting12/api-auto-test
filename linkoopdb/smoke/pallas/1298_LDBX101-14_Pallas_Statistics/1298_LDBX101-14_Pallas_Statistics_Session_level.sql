--Description: 测试pallas statistics
--Date:         2020-07-03
--Author:       丁婷

set echo on

--测试session level
drop table T_PALLAS_STATISTICS_SESSION_001 if exists;
drop table T_PALLAS_STATISTICS_SESSION_002 if exists;

create table T_PALLAS_STATISTICS_SESSION_001(
id int
) engine pallas;

insert into T_PALLAS_STATISTICS_SESSION_001 values
(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(2),(3),(4);

ANALYZE TABLE T_PALLAS_STATISTICS_SESSION_001 COMPUTE STATISTICS;

explain all plan for select * from T_PALLAS_STATISTICS_SESSION_001 where id = 1;

set session work cbo_enabled false;

explain all plan for select * from T_PALLAS_STATISTICS_SESSION_001 where id = 1;


create table T_PALLAS_STATISTICS_SESSION_002 (
id int
) engine pallas;

insert into T_PALLAS_STATISTICS_SESSION_002 values (1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(1),(2),(3),(4);

ANALYZE TABLE T_PALLAS_STATISTICS_SESSION_002 COMPUTE STATISTICS WITH HISTOGRAM;

explain all plan for select * from T_PALLAS_STATISTICS_SESSION_002 where id = 1;

set session work cbo_enabled true;

set session work histogram_enabled true;

explain all plan for select * from T_PALLAS_STATISTICS_SESSION_002 where id = 1;
