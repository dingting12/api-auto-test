drop table part;
create table part  (
    p_partkey     integer not null,
        p_name        varchar(55) ,
        p_mfgr        char(25) ,
        p_brand       char(10) ,
        p_type        varchar(25) ,
        p_size        integer ,
        p_container   char(10) ,
        p_retailprice decimal(15,2) ,
        p_comment     varchar(23) ,PRIMARY KEY (p_partkey) );


drop table nation;
create table nation  (
    n_nationkey  integer not null,
        n_name       char(25) ,
        n_regionkey  integer not null,
        n_comment    varchar(152),PRIMARY KEY (n_nationkey));

drop table region;
create table region  (
    r_regionkey  integer not null,
        r_name       char(25) ,
        r_comment    varchar(152),PRIMARY KEY (r_regionkey));

drop table supplier;
create table supplier (
    s_suppkey     integer not null,
        s_name        char(25) ,
        s_address     varchar(40) ,
        s_nationkey   integer not null,
        s_phone       char(15) ,
        s_acctbal     decimal(15,2) ,
        s_comment     varchar(101),PRIMARY KEY (s_suppkey));

drop table partsupp;
create table partsupp (
        ps_partkey     integer not null,
        ps_suppkey     integer not null,
        ps_availqty    integer ,
        ps_supplycost  decimal(15,2)  ,
        ps_comment     varchar(199),PRIMARY KEY (ps_partkey,ps_suppkey));

drop table customer;
create table customer (
    c_custkey     integer not null,
        c_name        varchar(25) ,
        c_address     varchar(40) ,
        c_nationkey   integer not null,
        c_phone       char(15) ,
        c_acctbal     decimal(15,2)   ,
        c_mktsegment  char(10) ,
        c_comment     varchar(117),PRIMARY KEY (c_custkey));

drop table orders;
create table orders  (
    o_orderkey       number(20,0) not null,
        o_custkey        integer not null,
        o_orderstatus    char(1) ,
        o_totalprice     decimal(15,2) ,
        o_orderdate      date ,
        o_orderpriority  char(15) ,
        o_clerk          char(15) ,
        o_shippriority   integer ,
        o_comment        varchar(79),PRIMARY KEY (o_orderkey) );

drop table lineitem;
create table lineitem (
    l_orderkey    number(20,0) not null,
        l_partkey     integer not null,
        l_suppkey     integer not null,
        l_linenumber  integer not null,
        l_quantity    decimal(15,2) ,
        l_extendedprice  decimal(15,2) ,
        l_discount    decimal(15,2) ,
        l_tax         decimal(15,2) ,
        l_returnflag  char(1) ,
        l_linestatus  char(1) ,
        l_shipdate    date ,
        l_commitdate  date ,
        l_receiptdate date ,
        l_shipinstruct char(25) ,
        l_shipmode     char(10) ,
        l_comment      varchar(44),PRIMARY KEY (l_orderkey,l_linenumber) );

alter table NATION nologging;
alter table SUPPLIER nologging;
alter table part nologging;
alter table partsupp nologging;
alter table region nologging;
alter table lineitem nologging;
alter table customer nologging;
alter table orders nologging;


