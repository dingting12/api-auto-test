--    Description: 测试cast&case,包括F481,F221,F261,F201
--    Date:         2020-06-09
--    Author:       丁婷
set echo on

--删除表
drop table if exists T_Cast_Case_001;

-- 创建并插入数据到表T_Cast_Case_001
CREATE TABLE T_Cast_Case_001 (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

INSERT INTO T_Cast_Case_001 VALUES 
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-2-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-2-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-4-2',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-9-28',1150,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-5-1',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-6-9',2450,NULL,10),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,0,30),
(7900,'JAMES','CLERK',7698,'1981-12-8',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-8',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);

-- 测试292 F481 Expanded NULL predicate的is not null和is null
select count(*) from (
select * from T_Cast_Case_001 where (sal + comm) is not null);

select * from T_Cast_Case_001 where rand() is null order by empno;

-- 测试228 F261-01 Simple CASE
select empno,ename,case job
 when 'CLERK' then '职员' 
 when 'SALESMAN' then '推销员' 
 when 'MANAGER' then '主管' 
 when 'PRESIDENT' then '经理' 
 else '未知' end case 
 from T_Cast_Case_001 
 order by empno;
 
-- 测试229 F261-02 Searched CASE 
 SELECT CASE WHEN sal <= 500 THEN '1' 
WHEN sal > 500 AND sal <= 600  THEN '2'
WHEN sal > 600 AND sal <= 800  THEN '3'
WHEN sal > 800 AND sal <= 1000 THEN '4'
ELSE NULL END salary_class,COUNT(*) 
FROM T_Cast_Case_001 
GROUP BY CASE WHEN sal <= 500 THEN '1'
WHEN sal > 500 AND sal <= 600  THEN '2'
WHEN sal > 600 AND sal <= 800  THEN '3'
WHEN sal > 800 AND sal <= 1000 THEN '4'
ELSE NULL END;

-- 测试230 F261-03 NULLIF 
select nullif(ename,'SMITH') from T_Cast_Case_001 order by empno;

-- 测试231 F261-04 COALESCE
SELECT empno,ename,COALESCE(job,'qwertyuiop') from T_Cast_Case_001 order by empno;


--删除表
drop table if exists T_Cast_Case_002;

--创建T_Cast_Case_002,并插入数据
create table T_Cast_Case_002(
ID int default 666,
USER_NAME VARCHAR(20) default '测试',
COURSE VARCHAR(20) default '测试',
SCORE int default 0);

INSERT INTO T_Cast_Case_002(id) values(21);

-- 226 F221 Explicit defaults
SELECT * FROM T_Cast_Case_002;


--删除表
drop table if exists T_cast_function_001;
drop table if exists T_cast_function_002;

-- 创建T_cast_function_001,T_cast_function_002,并插入数据
create table T_cast_function_001(
bool boolean,
small smallint,
int1 int,
big bigint,
deci decimal(3,2),
real1 real,
double1 double,
float1 float,
num numeric(5,2),
date1 date,
times timestamp,
varch1 varchar(30),
char1 char(50),
clob1 clob
)
/

create table T_cast_function_002(
bit1 bit(8),
binary1 binary(20),
varbin1 varbinary(20)
)
/

insert into T_cast_function_001 values
(true,132,2098,9036890,3.67,54.982,902.01,90.1,893.31,'2020-02-02','2019-10-01 19:20:01','123','true','true'),
(false,112,347,9036290,9.37,44.982,821.01,40.1,856.31,'2020-02-03','2019-10-03 19:20:01','true','11','插入海量数据!!!'),
(false,112,348,9036290,9.37,44.982,821.01,40.1,856.31,'2020-02-03','2019-10-03 19:20:01','str','df','插入海量数据!!!'),
(false,112,349,9036290,9.37,44.982,821.01,40.1,856.31,'2020-02-03','2019-10-03 19:20:01','456','sd','插入海量数据!!!');


insert into T_cast_function_002 values
('10100','11001','hlsljoipipknjjoi');

-- 测试2827 F201 CAST function基本数据类型
select int1,
cast(bool as varchar(10)) as b1,
cast(small as bigint) as b2,
cast(int1 as double) as b3,
cast(big as double) as b4,
cast(deci as bigint) as b5,
cast(real1 as decimal) as b6,
cast(num as float) as b7, 
cast(double1 as int) as b8,
cast(float1 as bigint) as b9, 
cast(char1 as int) as b10,
cast(varch1 as bigint) as b11,
cast(date1 as char(100))as b12,
cast(times as varchar(100)) as b13,
cast(clob1 as varchar(100)) as b14
from T_cast_function_001 
order by int1;

-- 测试2827 F201 CAST function基本数据类型
select bit1,
cast(bit1 as bit) as b1 ,
cast(binary1 as char ) as b9,
cast(varbin1 as varchar ) as b10
from T_cast_function_002 ;

-- 删除表
drop table if exists T_cast_function_003;


-- 创建T_cast_function_003,并插入数据
create table T_cast_function_003(
id int,
bool boolean array,
small smallint array,
int1 int array,
big bigint array,
deci decimal(3,2) array,
real1 real array,
double1 double array,
float1 float array,
num numeric(5,2) array,
date1 date array,
times timestamp array,
varch1 varchar(30) array,
char1 char(50) array
)
/

insert into T_cast_function_003 values
(1,array[true,false],array[132,68],array[2098],array[9036890],array[3.67],array[54.982],array[902.01],array[90.1],array[893.31],array['2020-02-02'],array['2019-10-01 19:20:01'],array['123'],array['true']),
(2,array[false],array[112],array[348],array[9036290],array[9.37],array[44.982],array[821.01],array[40.1],array[856.31],array['2020-02-03'],array['2019-10-03 19:20:01'],array['true'],array['11']),
(3,array[false],array[112],array[348],array[9036290],array[9.37],array[44.982],array[821.01],array[40.1],array[856.31],array['2020-02-03'],array['2019-10-03 19:20:01'],array['str'],array['df']),
(4,array[false],array[112],array[348],array[9036290],array[9.37],array[44.982],array[821.01],array[40.1],array[856.31],array['2020-02-03'],array['2019-10-03 19:20:01'],array['456'],array['sd']);


--测试2827 F201 CAST function数组类型
select id,
cast(bool as char(10) array) as b1,
cast(small as int array) as b2,
cast(int1 as real array) as b3,
cast(big as char(10) array) as b4,
cast(deci as bigint array) as b5,
cast(real1 as int array) as b6,
cast(num as float array) as b7,
cast(double1 as int array) as b8,
cast(float1 as int array) as b9,
cast(char1 as varchar(10) array) as b10,
cast(varch1 as smallint array) as b11,
cast(date1 as varchar(100) array) as b12,
cast(times as date array) as b13 
from T_cast_function_003
order by id;

--删除表
drop table if exists T_cast_function_004;

-- 创建表T_cast_function_004，并插入数据
create table T_cast_function_004(
id int,
course struct<course:string,score:int>
)
/

insert into T_cast_function_004 values
(1, json_to_struct('{"course":60,"score":80}')),
(2, json_to_struct('{"course":"!!!!!","score":1234567}'));


insert into T_cast_function_004  values
(3,cast('{"course":60,"score":80}' as struct<course:string,score:int>));

--测试2827 F201 CAST functions truct类型
select id,struct_to_json(T_cast_function_004.course) from T_cast_function_004 order by id;
