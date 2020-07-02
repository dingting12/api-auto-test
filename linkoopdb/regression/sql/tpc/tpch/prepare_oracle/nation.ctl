load data
infile 'nation.tbl'
into table nation
truncate   
fields terminated by '|'
(
    n_nationkey,
    n_name,
    n_regionkey,
    n_comment
)
