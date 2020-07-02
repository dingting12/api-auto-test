select
	cntrycode,
	count(*) as numcust,
	sum(c_acctbal) as totacctbal
FROM
   (
	select
		substr(c_phone,1,2) as cntrycode,
		c_acctbal
	from
		customer
	where
		substr(c_phone,1,2) in
			('24', '29', '19', '22', '16', '30', '31')
		and c_acctbal > (
			select
				avg(c_acctbal)
			from
				customer
			where
				c_acctbal > 0.00
				and substr(c_phone,1,2) in
					('24', '29', '19', '22', '16', '30', '31')
		)
		and not exists (
			select
				*
			from
				orders
			where
				o_custkey = c_custkey
		)
	) custsale
group by
	cntrycode
order by
	cntrycode;