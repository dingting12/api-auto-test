load data
infile 'lineitem.tbl'
into table lineitem
truncate   
fields terminated by '|'
(
    l_orderkey,
    l_partkey,
    l_suppkey,
    l_linenumber,
    l_quantity,
    l_extendedprice,
    l_discount,
    l_tax,
    l_returnflag,
    l_linestatus,
    l_shipdate     "to_date(:l_shipdate,'yyyy-mm-dd')",
    l_commitdate   "to_date(:l_commitdate,'yyyy-mm-dd')",
    l_receiptdate  "to_date(:l_receiptdate,'yyyy-mm-dd')",
    l_shipinstruct,
    l_shipmode,
    l_comment 
)
