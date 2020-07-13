set echo on

connect testdblink/testdblink@jdbc:teradata:tcp://192.168.1.136:0/testdblinkbase

drop table  testdblinkbase.t_datatype_teradata;

create table testdblinkbase.t_datatype_teradata(
tbyteint 	BYTEINT,
tsint 		SMALLINT,
tint 		INTEGER,
tbint		BIGINT,
tdec 		DECIMAL(10,5),
tnum		numeric(5,1),
tfloat 		FLOAT,
tchar 		CHAR(10),
tvar 		VARCHAR(20),
tdate 		DATE,
ttimestamp 	TIMESTAMP
);

insert into testdblinkbase.t_datatype_teradata values (1,2,3,4,54321.12345,5432.1,1.2,'zhang','zhangsan','2020-01-01','2020-01-01 20:10:10');