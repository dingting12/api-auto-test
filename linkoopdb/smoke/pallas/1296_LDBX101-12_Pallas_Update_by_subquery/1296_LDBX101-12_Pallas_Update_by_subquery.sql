--Description: 测试pallas update by subquery
--Date:         2020-07-01
--Author:       丁婷
set echo on

drop table T_PALLAS_SUBQUERY_001 if exists cascade;
drop table T_PALLAS_SUBQUERY_002 if exists cascade;

CREATE TABLE T_PALLAS_SUBQUERY_001 (
DEPTNO INT,
DNAME VARCHAR(20),
LOC VARCHAR(20)
) engine pallas;

INSERT INTO T_PALLAS_SUBQUERY_001 VALUES 
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON'),
(50,'dhasji','vdsbhkfd'),
(60,'vf','dsadc'),
(70,'bghgh','mkuh'),
(80,'ewq','vmkuji'),
(90,'xcdf','vnjsy'),
(100,'nmooi','pkmkh'),
(110,'mcjkd','xjhxzy');

CREATE TABLE T_PALLAS_SUBQUERY_002 (
DEPTNO INT,
DNAME VARCHAR(20),
LOC VARCHAR(20)
) engine pallas;

INSERT INTO T_PALLAS_SUBQUERY_002 VALUES 
(10,'ACCOUNTING','qqq'),
(20,'RESEARCH','bbb'),
(30,'SALES','ccc'),
(40,'OPERATIONS','aaa'),
(50,'dhasji','www'),
(60,'vf','sss'),
(70,'bghgh','xxx'),
(80,'ewq','eee'),
(90,'xcdf','ddd'),
(100,'nmooi','rrr'),
(110,'mcjkd','ooo');

UPDATE T_PALLAS_SUBQUERY_001 t3 
SET loc=(SELECT loc FROM T_PALLAS_SUBQUERY_002 t4 WHERE t3.DEPTNO=t4.DEPTNO AND t3.DEPTNO>20);

SELECT * FROM T_PALLAS_SUBQUERY_001 order by DEPTNO;

SELECT * FROM T_PALLAS_SUBQUERY_002 order by DEPTNO;