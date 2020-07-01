-- Description：tpch statistics
-- Date：2020-06-30
-- Author：满意

set echo on
set timing on

analyze table part compute statistics;

analyze table customer compute statistics;

analyze table lineitem compute statistics;

analyze table nation compute statistics;

analyze table orders compute statistics;

analyze table region compute statistics;

analyze table supplier compute statistics;

analyze table partsupp compute statistics;