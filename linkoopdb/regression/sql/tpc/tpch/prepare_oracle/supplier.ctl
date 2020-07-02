load data
infile 'supplier.tbl'
into table supplier
truncate   
fields terminated by '|'
(
    s_suppkey,
    s_name,
    s_address,
    s_nationkey,
    s_phone,
    s_acctbal,
    s_comment
)
