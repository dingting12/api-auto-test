--    Description: 测试 Consistent hash based distributed primary index for pallas table的one primary key
--    Date:         2020-07-01
--    Author:       丁婷

set echo on

--测试int
DROP TABLE T_PALLAS_ONE_PK_001 IF EXISTS CASCADE;
DROP TABLE T_PALLAS_ONE_PK_002 IF EXISTS CASCADE;
DROP TABLE T_PALLAS_ONE_PK_003 IF EXISTS CASCADE;

CREATE TABLE T_PALLAS_ONE_PK_001(
    tsmallint SMALLINT,
    tint int primary key,
    tbigint bigint,
    treal REAL,
    tdouble double,
    tfloat float,
    tdecimal decimal(6,2),
    tnumeric numeric(6,2),
    tdate date,
    ttimestamp timestamp,
    tvarchar varchar(50),
    tchar char(50)
) engine pallas; 

INSERT INTO T_PALLAS_ONE_PK_001 VALUES(1,1,1,1.1,1.1,1.1,1.11,1.11,DATE '2019-01-01',TIMESTAMP '2019-01-01 01:01:01','1111q','1111w');

CREATE TABLE T_PALLAS_ONE_PK_002(
    tsmallint SMALLINT,
    tint int,
    tbigint bigint,
    treal REAL,
    tdouble double,
    tfloat float,
    tdecimal decimal(6,2),
    tnumeric numeric(6,2),
    tdate date,
    ttimestamp timestamp,
    tvarchar varchar(50),
    tchar char(50)
);

INSERT INTO T_PALLAS_ONE_PK_002 VALUES(2,2,2,2.2,2.2,2.2,2.22,2.22,DATE '2019-02-02',TIMESTAMP '2019-02-02 02:02:02','2222q','2222w');

INSERT INTO T_PALLAS_ONE_PK_002 VALUES(3,3,3,3.3,3.3,3.3,3.33,3.33,DATE '2019-03-03',TIMESTAMP '2019-03-03 03:03:03','3333q','3333w');


INSERT INTO T_PALLAS_ONE_PK_001 SELECT * FROM T_PALLAS_ONE_PK_002;

SELECT * FROM T_PALLAS_ONE_PK_001 ORDER BY tint,tvarchar;


CREATE TABLE T_PALLAS_ONE_PK_003(
    tsmallint SMALLINT,
    tint int primary key,
    tbigint bigint,
    treal REAL,
    tdouble double,
    tfloat float,
    tdecimal decimal(6,2),
    tnumeric numeric(6,2),
    tdate date,
    ttimestamp timestamp,
    tvarchar varchar(50),
    tchar char(50)
)engine pallas;


INSERT INTO T_PALLAS_ONE_PK_003 VALUES(2,2,2,2.2,2.2,2.2,2.22,2.22,DATE '2019-02-02',TIMESTAMP '2019-02-02 02:02:02','2222q','2222w');

INSERT INTO T_PALLAS_ONE_PK_003 VALUES(3,3,3,3.3,3.3,3.3,3.33,3.33,DATE '2019-03-03',TIMESTAMP '2019-03-03 03:03:03','3333q','3333w');

DELETE FROM T_PALLAS_ONE_PK_001 WHERE tint<>1;

INSERT INTO T_PALLAS_ONE_PK_001 SELECT * FROM T_PALLAS_ONE_PK_003;

SELECT * FROM T_PALLAS_ONE_PK_001 ORDER BY tint,tvarchar;