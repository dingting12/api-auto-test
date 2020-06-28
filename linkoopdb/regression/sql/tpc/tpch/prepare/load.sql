-- Description：tpch load data
-- Date：2020-06-26
-- Author：满意

set echo on
set timing on


insert into part select * from ext_csv_part;

insert into supplier select * from ext_csv_supplier;

insert into partsupp select * from ext_csv_partsupp;

insert into customer select * from ext_csv_customer;

insert into orders select * from ext_csv_orders;

insert into lineitem select * from ext_csv_lineitem;

insert into nation select * from ext_csv_nation;

insert into region select * from ext_csv_region;
