--    Description: 测试RECT_CONTAIN function
--    Date:         2020-07-03
--    Author:       丁婷

set echo on

DROP TABLE T_RECT_CONTAIN_PALLAS_001 IF EXISTS;
DROP TABLE T_RECT_CONTAIN_PALLAS_002 IF EXISTS;

CREATE EXTERNAL TABLE T_RECT_CONTAIN_PALLAS_001 (
customer_id INT,
x double,
y double,
times TIMESTAMP
)LOCATION('ldbdist://192.168.1.73:54322/test_distance_within/t_distance_within.csv') FORMAT 'csv' (DELIMITER ','); 

SELECT count(*) FROM T_RECT_CONTAIN_PALLAS_001;

SELECT *
FROM (
	SELECT customer_id
		, distance_within('ldbdist://192.168.1.73:54322/test_distance_within/distance_within.txt', x, y, '0.05D') AS area
	FROM T_RECT_CONTAIN_PALLAS_001
)
WHERE area != ''
ORDER BY CUSTOMER_ID;

SELECT COUNT(*)
FROM (
	SELECT customer_id
		, distance_within('ldbdist://192.168.1.73:54322/test_distance_within/distance_within.txt', x, y, '2.5') AS area
	FROM T_RECT_CONTAIN_PALLAS_001
)
WHERE area != '';

CREATE EXTERNAL TABLE T_RECT_CONTAIN_PALLAS_002 (
customer_id INT,
x double,
y double,
times TIMESTAMP
) LOCATION('ldbdist://192.168.1.73:54322/test_circle_contain/t_circle_contain.csv') FORMAT 'csv' (DELIMITER ',')

SELECT COUNT(*) FROM T_RECT_CONTAIN_PALLAS_002

SELECT CUSTOMER_ID, area
FROM (
	SELECT customer_id, CIRCLE_contain('ldbdist://192.168.1.73:54322/test_circle_contain/circle_contain.txt', 0, 0) AS area
	FROM T_RECT_CONTAIN_PALLAS_002
)
WHERE area != ''
ORDER BY CUSTOMER_ID;

SELECT CUSTOMER_ID, area
FROM (
	SELECT customer_id, CIRCLE_contain('ldbdist://192.168.1.73:54322/test_circle_contain/circle_contain.txt', 116.5493696303, 39.7968550627) AS area
	FROM T_RECT_CONTAIN_PALLAS_002
)
WHERE area != ''
ORDER BY CUSTOMER_ID;