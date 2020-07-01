--    Description: 测试Primary index for pallas table
--    Date:         2020-06-30
--    Author:       丁婷

set echo on

-- 测试pallas主键
DROP TABLE IF EXISTS T_PALLAS_PK_001;

create table T_PALLAS_PK_001 (
a int,
b varchar(100),
PRIMARY KEY(b)
) engine pallas;

INSERT INTO T_PALLAS_PK_001 VALUES 
(1,'a'),
(2,'b'),
(3,'c'),
(4,'cc'),
(5,'d'),
(5,'e'),
(NULL,'null'),
(6,'f'),
(null,'g');

INSERT INTO T_PALLAS_PK_001 VALUES (88,null);

select a,b from T_PALLAS_PK_001 order by a,b;

INSERT INTO T_PALLAS_PK_001 VALUES (1,'a');

