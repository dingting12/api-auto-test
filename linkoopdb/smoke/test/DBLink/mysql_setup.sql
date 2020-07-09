set echo on

connect test/123456@jdbc:mysql:tcp://192.168.1.72:3307/ldb_test

drop table if exists t_datatype_mysql;

create table t_datatype_mysql(
ttint 	TINYINT(1),
tsint 	SMALLINT(2),
tmint 	MEDIUMINT(3),
tint 	INTEGER(4),
tbint 	BIGINT(5),
tfloat 	FLOAT(6,2),
tdou 	DOUBLE(8,2),
tdec 	DECIMAL(10,5),
tdate 	DATE,
tdtime 	DATETIME,
ttimestamp TIMESTAMP,
tchar 	CHAR(10),
tvar 	VARCHAR(20),
tttext 	TINYTEXT,
ttext 	TEXT,
tmtext 	MEDIUMTEXT,
tltext 	LONGTEXT
);

insert into t_datatype_mysql values (1,2,3,4,5,10.15,20.26,31.37,'2020-12-2','2020-01-01 20:10:30','2020-10-10 10:30:20','zhangsan','aiyawodetianya','wodetianya xiayule','jiayou','buyaosuibianjierenhua','abcdefghijklmnopqrsstuvwxyz');
