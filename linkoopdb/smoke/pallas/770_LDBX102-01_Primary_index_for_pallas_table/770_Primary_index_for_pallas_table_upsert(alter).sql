--    Description: 测试Primary index for pallas table
--    Date:         2020-06-30
--    Author:       丁婷

set echo on

-- 测试主键带upsert,单个主键

DROP TABLE T_PALLAS_UPSERT_ALTER_001 IF EXISTS CASCADE;
 
CREATE TABLE T_PALLAS_UPSERT_ALTER_001(
   id INT PRIMARY KEY,
   name VARCHAR(50),
   sal NUMERIC(10,2),
   deptid INT,
   birthdate DATE
 )engine pallas;

INSERT INTO T_PALLAS_UPSERT_ALTER_001 VALUES
(1,'cd',2301.2,10,DATE '1990-01-23'),
(2,'qwr',3610.35,20,DATE '1991-03-09'),
(3,'ciy',1000.00,30,DATE '1992-10-06'),
(4,'hhh',85263.23,40,DATE '1993-12-30');
	   
SELECT * FROM T_PALLAS_UPSERT_ALTER_001 ORDER BY id,name;

--设置upsert为true
ALTER TABLE T_PALLAS_UPSERT_ALTER_001 set properties ('upsert':'true');	 

INSERT INTO T_PALLAS_UPSERT_ALTER_001 VALUES(1,'wowow',500.09,50,DATE '1800-01-01');  

INSERT INTO T_PALLAS_UPSERT_ALTER_001 VALUES(10,'owni',2389.23,100,DATE '1983-01-01');

select * from T_PALLAS_UPSERT_ALTER_001 ORDER BY id,name;

UPDATE T_PALLAS_UPSERT_ALTER_001
SET id=13,name='qoqo'
WHERE id=3;

--设置upsert为false
ALTER TABLE T_PALLAS_UPSERT_ALTER_001 set properties ('upsert':'false');

INSERT INTO T_PALLAS_UPSERT_ALTER_001 VALUES(1,'ninini',2039.29,60,DATE '1700-12-12');

select * from T_PALLAS_UPSERT_ALTER_001 ORDER BY id,name;



-- 测试主键带upsert,多个主键
DROP TABLE T_PALLAS_UPSERT_ALTER_002 IF EXISTS CASCADE;

 CREATE TABLE T_PALLAS_UPSERT_ALTER_002(
   id INT,
   name VARCHAR(50),
   sal NUMERIC(10,2),
   deptid INT,
   birthdate DATE,
   PRIMARY KEY(id,name)
 ) engine pallas;
 
 INSERT INTO T_PALLAS_UPSERT_ALTER_002  VALUES
(1,'cd',2301.2,10,DATE '1990-01-23'),
(2,'qwr',3610.35,20,DATE '1991-03-09'),
(3,'ciy',1000.00,30,DATE '1992-10-06'),
(4,'hhh',85263.23,40,DATE '1993-12-30'); 
	   
INSERT INTO T_PALLAS_UPSERT_ALTER_002 VALUES(1,'wowow',500.09,50,DATE '1800-01-01');

INSERT INTO T_PALLAS_UPSERT_ALTER_002 VALUES(2,'qwr',500.09,50,DATE '1801-01-01');

SELECT * FROM T_PALLAS_UPSERT_ALTER_002 ORDER BY id,name;

ALTER TABLE T_PALLAS_UPSERT_ALTER_002 set properties ('upsert':'true');

INSERT INTO T_PALLAS_UPSERT_ALTER_002 VALUES(1,'wiwiwi',500.09,50,DATE '1800-01-01');

INSERT INTO T_PALLAS_UPSERT_ALTER_002 VALUES(2,'qwr',500.09,50,DATE '1801-01-01');

INSERT INTO T_PALLAS_UPSERT_ALTER_002 VALUES(5,'qwr',500.09,50,DATE '1801-01-01');

SELECT * FROM T_PALLAS_UPSERT_ALTER_002 ORDER BY id,name;

UPDATE T_PALLAS_UPSERT_ALTER_002
SET id=13,name='qoqo'
WHERE id=3 and name='ciy';

ALTER TABLE T_PALLAS_UPSERT_ALTER_002 set properties ('upsert':'false');

INSERT INTO T_PALLAS_UPSERT_ALTER_002 VALUES(1,'ninini',2039.29,60,DATE '1700-12-12');

INSERT INTO T_PALLAS_UPSERT_ALTER_002 VALUES(4,'hhh',2039.29,60,DATE '1700-12-12');

SELECT * FROM T_PALLAS_UPSERT_ALTER_002 ORDER BY id,name;
