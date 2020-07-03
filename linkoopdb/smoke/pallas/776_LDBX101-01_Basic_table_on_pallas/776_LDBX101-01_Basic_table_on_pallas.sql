--Description: 测试Basic table on pallas
--Date:         2020-07-03
--Author:       丁婷

set echo on

DROP TABLE IF EXISTS T_PALLAS_BASIC_001;

create table T_PALLAS_BASIC_001 (
tinteger integer, 
tsmallint smallint, 
tbigint bigint, 
treal real,
tdouble double,
tfloat float, 
tchar char(255), 
tvarchar varchar(8000),
PRIMARY KEY(tinteger)
) engine pallas;

insert into T_PALLAS_BASIC_001 values 
(3321,-357,-6525,1.3E4,-1.7E6,1.4E2,'verygood8','long char haha8'),
(111,111,111,111,111,111,'111','111'); 

select * from T_PALLAS_BASIC_001 order by tinteger;

insert into T_PALLAS_BASIC_001 values 
(33221,357,6525,2.6E4,1.8E6,3.4E2,'pallas1','pallas2');

select * from T_PALLAS_BASIC_001 order by tinteger;

UPDATE T_PALLAS_BASIC_001 SET TSMALLINT = 358,TBIGINT = 6666,TREAL = 2.7e4,
TDOUBLE = 8.8654E6, TCHAR = 'UPDATEPALLAS1' ,TVARCHAR = 'UPDATE2PALLAS2' WHERE TINTEGER = 33221;

select * from T_PALLAS_BASIC_001 order by tinteger;

UPDATE T_PALLAS_BASIC_001 SET TINTEGER = 3333 WHERE TCHAR = 'verygood8';

select * from T_PALLAS_BASIC_001 order by tinteger;

insert into T_PALLAS_BASIC_001 values 
(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

select * from T_PALLAS_BASIC_001 order by tinteger;

DELETE FROM T_PALLAS_BASIC_001 WHERE TINTEGER = 111;

select * from T_PALLAS_BASIC_001 order by tinteger;