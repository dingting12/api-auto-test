load data
infile 'region.tbl'
into table region
truncate   
fields terminated by '|'
(
	r_regionkey,
	r_name,
	r_comment
)
