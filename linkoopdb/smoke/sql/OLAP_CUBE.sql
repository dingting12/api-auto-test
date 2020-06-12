--    Description: OLAP_CUBE
--    Date:         2020-06-12
--    Author:       丁婷

--652 T431 Extended grouping capabilities (previously "CUBE and ROLLUP operations")
drop table if exists T_OLAP_CUBE_ROOLLUP_001;

create table T_OLAP_CUBE_ROOLLUP_001 (
id int, 
job varchar(100), 
name varchar(100), 
salary int
);

insert into T_OLAP_CUBE_ROOLLUP_001 values 
(10,'Coding','Bruce',1000),
(10,'Programmer','Clair',1000),
(10,'Architect','Gideon',1000),
(10,'Director','Hill',1000),
(20,'Coding','Jason',2000),
(20,'Programmer','Joey',2000),
(20,'Architect','Martin',2000),
(20,'Director','Michael',2000),
(30,'Coding','Rebecca',3000),
(30,'Programmer','Rex',3000),
(30,'Architect','Richard',3000),
(30,'Director','Sabrina',3000),
(40,'Coding','Samuel',4000),
(40,'Programmer','Susy',4000),
(40,'Architect','Tina',4000),
(40,'Director','Wendy',4000);

--预期结果是5
select count(*) from (
select id,sum(salary) from T_OLAP_CUBE_ROOLLUP_001 group by rollup(id));

--预期结果是5
select count(*) from (
select id,sum(salary) from T_OLAP_CUBE_ROOLLUP_001 group by id with rollup);

--预期结果是5
select count(*) from (
select id,sum(salary) from T_OLAP_CUBE_ROOLLUP_001 group by cube(id));

--预期结果是5
select count(*) from (
select id,sum(salary) from T_OLAP_CUBE_ROOLLUP_001 group by id with cube);

drop table if exists T_OLAP_CUBE_ROOLLUP_001;

drop table if exists T_OLAP_CUBE_ROOLLUP_002;

CREATE TABLE T_OLAP_CUBE_ROOLLUP_002 (
  fact_1_id   int,
  fact_2_id   int,
  fact_3_id   int,
  fact_4_id   int,
  sales_value numeric(5,2) NOT NULL
);


insert into T_OLAP_CUBE_ROOLLUP_002 values 
(2,3,5,4,50.19),
(1,5,10,2,58.51),
(2,2,1,9,18.09),
(1,1,6,3,55.05),
(1,5,10,5,79.51),
(1,3,8,9,49.28),
(2,3,1,7,25.2),
(1,5,10,7,49.32),
(2,5,7,7,68.4),
(1,3,10,10,57.7);

SELECT fact_1_id,
       fact_2_id,
       SUM(sales_value) AS sales_value
FROM   T_OLAP_CUBE_ROOLLUP_002
GROUP BY ROLLUP (fact_1_id, fact_2_id)
ORDER BY fact_1_id, fact_2_id;

SELECT fact_1_id,
       fact_2_id,
       fact_3_id,
       SUM(sales_value) AS sales_value
FROM   T_OLAP_CUBE_ROOLLUP_002
GROUP BY ROLLUP (fact_1_id, fact_2_id, fact_3_id)
ORDER BY fact_1_id, fact_2_id, fact_3_id;

SELECT fact_1_id,
       fact_2_id,
       fact_3_id,
       SUM(sales_value) AS sales_value
FROM   T_OLAP_CUBE_ROOLLUP_002
GROUP BY fact_1_id, ROLLUP (fact_2_id, fact_3_id)
ORDER BY fact_1_id, fact_2_id, fact_3_id;

SELECT fact_1_id,
       fact_2_id,
       SUM(sales_value) AS sales_value
FROM   T_OLAP_CUBE_ROOLLUP_002
GROUP BY CUBE (fact_1_id, fact_2_id)
ORDER BY fact_1_id, fact_2_id;

SELECT fact_1_id,
       fact_2_id,
       fact_3_id,
       SUM(sales_value) AS sales_value
FROM   T_OLAP_CUBE_ROOLLUP_002
GROUP BY CUBE (fact_1_id, fact_2_id, fact_3_id)
ORDER BY fact_1_id, fact_2_id, fact_3_id;

SELECT fact_1_id,
       fact_2_id,
       fact_3_id,
       SUM(sales_value) AS sales_value
FROM   T_OLAP_CUBE_ROOLLUP_002
GROUP BY fact_1_id, CUBE (fact_2_id, fact_3_id)
ORDER BY fact_1_id, fact_2_id, fact_3_id;

drop table if exists T_OLAP_CUBE_ROOLLUP_002;
