--    Description: 测试ldbdist
--    Date:         2020-06-16
--    Author:       丁婷

--测试2891 LDBX048-01-04 one machine
DROP TABLE T_LDBDIST_SINGFILE_001 if exists;
DROP TABLE T_LDBDIST_MANYFILE_001 if exists;
DROP TABLE T_LDBDIST_SINGDIR_001 if exists;
DROP TABLE T_LDBDIST_MANYDIR_001 if exists;
DROP TABLE T_LDBDIST_ZHENGZE_001 if exists;
DROP TABLE T_LDBDIST_MIXFILE_001 if exists;

CREATE EXTERNAL TABLE T_LDBDIST_SINGFILE_001 (
a char(20),
b VARCHAR(20),
c int,
d decimal(5,3),
e float(2),
f date,
g timestamp
) LOCATION ('ldbdist://192.168.1.71:54323/single/singles.csv') FORMAT 'csv' (DELIMITER ',');

select * from T_LDBDIST_SINGFILE_001;

CREATE EXTERNAL TABLE T_LDBDIST_MANYFILE_001 (
a char(20),
b VARCHAR(20),
c int,
d decimal(5,3),
e float(2),
f date,
g timestamp
) LOCATION ('ldbdist://192.168.1.71:54323/files/files1.csv,ldbdist://192.168.1.71:54323/files/files2.csv,ldbdist://192.168.1.71:54323/files/files3.csv') FORMAT 'csv' (DELIMITER ',');

select * from T_LDBDIST_MANYFILE_001 order by f;


CREATE EXTERNAL TABLE T_LDBDIST_SINGDIR_001 (
a char(20),
b VARCHAR(20),
c int,
d decimal(5,3),
e float(2),
f date,
g timestamp
) LOCATION ('ldbdist://192.168.1.71:54323/files') FORMAT 'csv' (DELIMITER ',');

select * from T_LDBDIST_SINGDIR_001 order by f;


CREATE EXTERNAL TABLE T_LDBDIST_MANYDIR_001 (
a char(20),
b VARCHAR(20),
c int,
d decimal(5,3),
e float(2),
f date,
g timestamp
) LOCATION ('ldbdist://192.168.1.71:54323/single,ldbdist://192.168.1.71:54323/files') FORMAT 'csv' (DELIMITER ',');


select * from T_LDBDIST_MANYDIR_001 order by f;

CREATE EXTERNAL TABLE T_LDBDIST_ZHENGZE_001 (
a char(20),
b VARCHAR(20),
c int,
d decimal(5,3),
e float(2),
f date,
g timestamp
)LOCATION ('ldbdist://192.168.1.71:54323/files/files[1-3].csv') FORMAT 'csv' (DELIMITER ',');

select * from T_LDBDIST_ZHENGZE_001 order by f; 

CREATE EXTERNAL TABLE T_LDBDIST_MIXFILE_001 (
a char(20),
b VARCHAR(20),
c int,
d decimal(5,3),
e float(2),
f date,
g timestamp
)LOCATION ('ldbdist://192.168.1.71:54323/files/files[1-3].csv,ldbdist://192.168.1.71:54323/single') FORMAT 'csv' (DELIMITER ',');


select * from T_LDBDIST_MIXFILE_001 order by f;

DROP TABLE T_LDBDIST_SINGFILE_001 if exists;
DROP TABLE T_LDBDIST_MANYFILE_001 if exists;
DROP TABLE T_LDBDIST_SINGDIR_001 if exists;
DROP TABLE T_LDBDIST_MANYDIR_001 if exists;
DROP TABLE T_LDBDIST_ZHENGZE_001 if exists;
DROP TABLE T_LDBDIST_MIXFILE_001 if exists;