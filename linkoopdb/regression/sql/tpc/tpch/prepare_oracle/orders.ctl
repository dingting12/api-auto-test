load data
infile 'orders.tbl'
into table orders
truncate   
fields terminated by '|'
(
   o_orderkey,
   o_custkey,
   o_orderstatus,
   o_totalprice,
   o_orderdate "to_date(:o_orderdate,'yyyy-mm-dd')",
   o_orderpriority,
   o_clerk,
   o_shippriority,
   o_comment
)
