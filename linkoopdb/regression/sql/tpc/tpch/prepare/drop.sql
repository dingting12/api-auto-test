-- Description：tpch drop table
-- Date：2020-06-26
-- Author：满意

set echo on
set timing on

DROP TABLE ex_csv_part IF EXISTS;
DROP TABLE ex_csv_customer IF EXISTS;
DROP TABLE ex_csv_lineitem IF EXISTS;
DROP TABLE ex_csv_nation IF EXISTS;
DROP TABLE ex_csv_orders IF EXISTS;
DROP TABLE ex_csv_region IF EXISTS;
DROP TABLE ex_csv_supplier IF EXISTS;
DROP TABLE ex_csv_partsupp IF EXISTS;
DROP TABLE part IF EXISTS;
DROP TABLE customer IF EXISTS;
DROP TABLE lineitem IF EXISTS;
DROP TABLE nation IF EXISTS;
DROP TABLE orders IF EXISTS;
DROP TABLE region IF EXISTS;
DROP TABLE supplier IF EXISTS;
DROP TABLE partsupp IF EXISTS;