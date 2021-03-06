set echo on

drop table t_Arithmetic  IF  EXISTS;

CREATE TABLE t_Arithmetic(
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

INSERT INTO t_Arithmetic VALUES
(1,1,1,1,1.23,23.43,546.56,789.90,-786.34,'weew','qouhdu','2019-01-03','2019-02-27 12:12:45','bW9ua2V5','bW9ua2V5'),
(0,2,2,2,23.78,32,546.56,377.90,212.33,'xchc','sdhhus','2018-03-21','2000-02-01 09:23:12','bW9ua2V52','4bW9ua2V5'),
(1,3,3,3,-38.09,98.09,546.56,89.78,-865.32,'mno','lpoi','2020-12-03','1998-07-31 23:13:08','bW9ua2V54','6bW9ua2V5');

select * from (select tbigint - tint n from t_Arithmetic) order by n;

select * from (select tbigint + tint n from t_Arithmetic) order by n;

select * from (select tbigint / tint n from t_Arithmetic) order by n;

select * from (select tbigint * tint n from t_Arithmetic) order by n;
            