select s_name, s_address
   from nation n join supplier s 
     on s.s_nationkey = n.n_nationkey and n.n_name = 'CANADA'
   join (
	select ps_suppkey
	from (
	  select ps.ps_suppkey, ps.ps_availqty, sum_quantity
	  from partsupp ps join (
	    select distinct p_partkey
	    from part where p_name like 'forest%'
	  ) t1 on ps.ps_partkey = t1.p_partkey 
	  join (
	    select l_partkey, l_suppkey, 0.5 * sum(l_quantity) as sum_quantity
	    from lineitem where l_shipdate >= '1994-01-01' and l_shipdate < '1995-01-01'
	    group by l_partkey, l_suppkey
	  ) t2 on ps.ps_partkey = t2.l_partkey and ps.ps_suppkey = t2.l_suppkey
	) t3 where t3.ps_availqty > t3.sum_quantity
	group by ps_suppkey
   ) t4 on s.s_suppkey = t4.ps_suppkey
order by s_name;