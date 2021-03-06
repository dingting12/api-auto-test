--    Description: 测试pallas complex data type udt
--    Date:         2020-07-01
--    Author:       丁婷

set echo on

drop table T_PALLAS_COMPLEXTYPE_UDT_001 if exists cascade;
drop table T_PALLAS_COMPLEXTYPE_UDT_002 if exists cascade;
drop type STRUCTURE_TYPE_UDT_PALLAS_001 if exists;
drop type STRUCTURE_TYPE_UDT_PALLAS_002 if exists;

create type STRUCTURE_TYPE_UDT_PALLAS_001 (
  EMPNO INT,
  ENAME VARCHAR(20),
  JOB VARCHAR(20),
  MGR INT,
  SAL INT,
  COMM INT,
  DEPTNO INT
);

create table T_PALLAS_COMPLEXTYPE_UDT_001 (
id int, 
st STRUCTURE_TYPE_UDT_PALLAS_001
) engine pallas;

insert into T_PALLAS_COMPLEXTYPE_UDT_001 values 
(201,new STRUCTURE_TYPE_UDT_PALLAS_001(7369,'SMITH','CLERK',7902,800,NULL,20)),
(202,new STRUCTURE_TYPE_UDT_PALLAS_001(7499,'ALLEN','SALESMAN',7698,1600,300,30)),
(203,new STRUCTURE_TYPE_UDT_PALLAS_001(7521,'WARD','SALESMAN',7698,1250,500,30)),
(204,new STRUCTURE_TYPE_UDT_PALLAS_001(7566,'JONES','MANAGER',7839,2975,NULL,20)),
(205,new STRUCTURE_TYPE_UDT_PALLAS_001(7654,'MARTIN','SALESMAN',7698,1150,1400,30)),
(206,new STRUCTURE_TYPE_UDT_PALLAS_001(7698,'BLAKE','MANAGER',7839,2850,NULL,30)),
(207,new STRUCTURE_TYPE_UDT_PALLAS_001(7782,'CLARK','MANAGER',7839,2450,NULL,10)),
(208,new STRUCTURE_TYPE_UDT_PALLAS_001(7839,'KING','PRESIDENT',NULL,5000,NULL,10)),
(209,new STRUCTURE_TYPE_UDT_PALLAS_001(7844,'TURNER','SALESMAN',7698,1500,0,30)),
(210,new STRUCTURE_TYPE_UDT_PALLAS_001(7900,'JAMES','CLERK',7698,950,NULL,30)),
(211,new STRUCTURE_TYPE_UDT_PALLAS_001(7902,'FORD','ANALYST',7566,3000,NULL,20)),
(212,new STRUCTURE_TYPE_UDT_PALLAS_001(7934,'MILLER','CLERK',7782,1300,NULL,10));


create type STRUCTURE_TYPE_UDT_PALLAS_002 (
DEPTNO INT,
DNAME VARCHAR(20),
LOC VARCHAR(20)
);

create table T_PALLAS_COMPLEXTYPE_UDT_002 (
id int, 
st STRUCTURE_TYPE_UDT_PALLAS_002
) engine pallas;

insert into T_PALLAS_COMPLEXTYPE_UDT_002 values 
(301,new STRUCTURE_TYPE_UDT_PALLAS_002(10,'ACCOUNTING','NEW YORK')),
(302,new STRUCTURE_TYPE_UDT_PALLAS_002(20,'RESEARCH','DALLAS')),
(303,new STRUCTURE_TYPE_UDT_PALLAS_002(30,'SALES','CHICAGO')),
(304,new STRUCTURE_TYPE_UDT_PALLAS_002(40,'OPERATIONS','BOSTON'));

select count(*) from T_PALLAS_COMPLEXTYPE_UDT_001 where st.sal > 1500;

select count(*) from (select id from T_PALLAS_COMPLEXTYPE_UDT_001 order by st.empno desc,id);

select st.ename,st.sal from T_PALLAS_COMPLEXTYPE_UDT_001 where st.sal = 2450 and st.deptno in (select st.deptno from T_PALLAS_COMPLEXTYPE_UDT_002);