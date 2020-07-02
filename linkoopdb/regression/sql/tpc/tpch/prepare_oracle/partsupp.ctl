load data
infile 'partsupp.tbl'
into table partsupp
truncate   
fields terminated by '|'
(
        ps_partkey     ,
        ps_suppkey     ,
        ps_availqty    ,
        ps_supplycost  ,
        ps_comment     
)
