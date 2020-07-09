set echo on

connect sa/LinkoopDB123@jdbc:sqlserver:tcp://192.168.1.72:1433/insen

drop table if exists t_datatype_sqlserver;

create table t_datatype_sqlserver(
tbint 		BIGINT,
tint 		INTEGER,
tsint 		SMALLINT,
ttint 		TINYINT,
treal		REAL,
tfloat 		FLOAT(6),
tdec 		DECIMAL(10,5),
tnum		numeric(5,1),
tchar 		CHAR(10),
tvar 		VARCHAR(20),
tnchar		nchar(10),
tnvarchar	nvarchar(20),
tdate 		DATE,
tdtime 		DATETIME,
tsdtime		smalldatetime,
ttimestamp 	TIMESTAMP,
ttext 		TEXT,
tntext 		NTEXT
);


insert into t_datatype_sqlserver (tbint,tint,tsint,ttint,treal,tfloat,tdec,tnum,tchar,tvar,tnchar,tnvarchar,tdate,tdtime,tsdtime,ttext,tntext)values (1,2,3,4,1.2,3.456,12345.67890,9087.5,'zhangsan','lisi','wangwu','zhaoliu','2020-07-03','1900-01-01 00:00:00','2000-01-01 10:00:00','abcdefghijklmnopqrst','abcdefghijklmnopqrstuvwxyz');
