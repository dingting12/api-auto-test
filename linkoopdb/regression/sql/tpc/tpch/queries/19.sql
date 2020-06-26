select
  sum(a.l_extendedprice * (1 - a.l_discount) ) as revenue
  from
    (select l_extendedprice, l_discount
     from lineitem l join part p on p.p_partkey = l.l_partkey
     where
       p_brand = 'Brand#12'
       and p_container IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
       and l_quantity >= 1 and l_quantity <= 11
       and p_size >= 1 and p_size <= 5
       and l_shipmode IN ('AIR', 'AIR REG')
       and l_shipinstruct = 'DELIVER IN PERSON'
     UNION ALL
     select l_extendedprice, l_discount
     from lineitem l join part p on p.p_partkey = l.l_partkey
     where
       p_brand = 'Brand#23'
       and p_container IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
       and l_quantity >= 10 and l_quantity <= 20
       and p_size >= 1 and p_size <= 10
       and l_shipmode IN ('AIR', 'AIR REG')
       and l_shipinstruct = 'DELIVER IN PERSON'
     UNION ALL
     select l_extendedprice, l_discount
     from lineitem l join part p on p.p_partkey = l.l_partkey
     where
       p_brand = 'Brand#34'
       and p_container IN ( 'LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
       and l_quantity >= 20 and l_quantity <= 30
       and p_size >= 1 and p_size <= 15
       and l_shipmode IN ('AIR', 'AIR REG')
       and l_shipinstruct = 'DELIVER IN PERSON' 
    ) a;

  