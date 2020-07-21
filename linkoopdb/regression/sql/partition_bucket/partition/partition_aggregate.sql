--Description:partition
--Date：2020-07-21
--Author：满意

SET ECHO ON
SET TIMING ON


drop table pagg_tab IF EXISTS;
CREATE TABLE pagg_tab (A INT, B INT, C VARCHAR(20), D INT) PARTITIONED BY (A);

INSERT INTO pagg_tab VALUES (null,0,'0000',0),(1,null,'0001',1),(2,2,'0002',2),(3,3,'0003',3),(4,4,null,4),(10,10,'0010',10),(11,11,'0011',11),(12,12,'0012',null),(13,13,'0013',13),(14,14,'0014',14),(0,0,'0000',0),(null,null,'0001',1),(2,2,'0002',2),(3,3,'0003',null),(4,4,'0004',4),(4,4,'0004',4),(10,10,'0010',10),(0,0,'0000',0),(1,1,'0001',1))


SELECT c, sum(a), avg(b), count(*), min(a), max(b) FROM pagg_tab GROUP BY c HAVING avg(d) < 5 ORDER BY 1, 2, 3;

SELECT a, sum(b), avg(b), count(*), min(a), max(b) FROM pagg_tab GROUP BY a HAVING avg(d) < 5 ORDER BY 1, 2, 3;

-- Check with multiple columns in GROUP BY
SELECT a, c, count(*) FROM pagg_tab GROUP BY a, c;
-- Check with multiple columns in GROUP BY, order in GROUP BY is reversed
SELECT a, c, count(*) FROM pagg_tab GROUP BY c, a;
-- Check with multiple columns in GROUP BY, order in target-list is reversed
SELECT c, a, count(*) FROM pagg_tab GROUP BY a, c;


-- Test when input relation for grouping is dummy
SELECT c, sum(a) FROM pagg_tab WHERE 1 = 2 GROUP BY c;

SELECT c, sum(a) FROM pagg_tab WHERE 1 = 2 GROUP BY c;

SELECT c, sum(a) FROM pagg_tab WHERE c = 'x' GROUP BY c;

SELECT c, sum(a), avg(b), count(*) FROM pagg_tab GROUP BY 1 HAVING avg(d) < 5 ORDER BY 1, 2, 3;

SELECT c FROM pagg_tab GROUP BY c ORDER BY 1;

-- ROLLUP, partitionwise aggregation does not apply
SELECT c, sum(a) FROM pagg_tab GROUP BY rollup(c) ORDER BY 1, 2;
