drop table t_cast  IF  EXISTS;

CREATE TABLE t_cast(
	tbit BIT,
	tbigint BIGINT,
    tint INTEGER,
    tsmallint SMALLINT,
    treal REAL,
    tdouble DOUBLE,
    tfloat FLOAT,
    tdecimal DECIMAL(10,2),
    tnumeric NUMERIC(10,2),
    tcharacter CHARACTER(20),
    tvarchar VARCHAR(20),
    tdate DATE,
    ttimestramp TIMESTAMP,
    tbinary BINARY(8000),
    tvarbinary VARBINARY(8000)
);




insert into t_cast (tbigint) values (1.1);

insert into t_cast (tint) values (2.2);

insert into t_cast (tsmallint) values (3.3);

insert into t_cast (treal) values (1);

insert into t_cast (tdouble) values (2);

insert into t_cast (tfloat) values (3);

insert into t_cast (tdecimal) values (4);

insert into t_cast (tnumeric) values (5);

select * from t_cast order by tbigint,tint,tsmallint,treal,tdouble,tfloat,tdecimal,tnumeric;