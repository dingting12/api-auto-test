drop table t_function  IF  EXISTS;

CREATE TABLE t_function(
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

INSERT INTO t_function VALUES
(1,1,1,1,1.23,23.43,546.56,789.90,-786.34,'weew','qouhdu','2019-01-03','2019-02-27 12:12:45','bW9ua2V5','bW9ua2V5'),
(0,2,2,2,23.78,32,546.56,377.90,212.33,'xchc','sdhhus','2018-03-21','2000-02-01 09:23:12','bW9ua2V52','4bW9ua2V5'),
(1,3,3,3,-38.09,98.09,546.56,89.78,-865.32,'mno','lpoi','2020-12-03','1998-07-31 23:13:08','bW9ua2V54','6bW9ua2V5');


select * from (select CHARACTER_LENGTH(tcharacter) l from t_function) order by l;

select * from (select OCTET_LENGTH(tcharacter) l from t_function) order by l;

select * from (select concat(tcharacter,tvarchar) var from t_function) order by var;

select * from (select SUBSTRING(tvarchar,1,2) str from t_function) order by str;

select * from (select SUBSTRING(tvarchar,3) str from t_function) order by str;

select * from (select UPPER(tvarchar) str from t_function) order by str;

select * from (select LOWER(tvarchar) str from t_function) order by str;

select * from (SELECT TRIM(BOTH 'o' FROM tvarchar) str FROM t_function) order by str;

select * from (SELECT TRIM(LEADING 's' FROM tvarchar) str FROM t_function) order by str;

select * from (SELECT TRIM(TRAILING 'i' FROM tvarchar)  str FROM t_function) order by str;

select * from (SELECT POSITION('u' IN tvarchar) str FROM t_function) order by str;