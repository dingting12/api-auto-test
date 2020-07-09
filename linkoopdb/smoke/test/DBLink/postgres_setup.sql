set echo on

connect postgres/123456@jdbc:postgresql:tcp://192.168.1.72:5432/postgres

drop table if exists t_datatype_postgres ;

create table t_datatype_postgres(
tsint 	SMALLINT,
tint 	INTEGER,
tbint 	BIGINT,
tnum	NUMERIC(10,5),
tdec 	DECIMAL(10,5),
treal	REAL,
tfloat 	FLOAT,
tvar 	VARCHAR(20),
tchar 	CHAR(10),
ttext 	TEXT,
ttimestamp TIMESTAMP,
tdate 	DATE,
tbool	boolean
);

insert into t_datatype_postgres values (1,2,3,12345.54321,12345.09876,2.3,3.4,'zhangsan','lisi','zhendenan','2019-01-01 20:10:10','2020-01-01',true);
