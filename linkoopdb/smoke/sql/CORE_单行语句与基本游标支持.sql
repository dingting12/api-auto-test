--    Description: 测试单行语句与基本游标支持
--    Date:         2020-06-10
--    Author:       丁婷

--256 E111 Single row SELECT statement
drop table if exists Test_Single_Row_001;
drop table if exists Test_Single_Row_002;

CREATE TABLE Test_Single_Row_001 (
	EMPNO INT,
	ENAME VARCHAR(20),
	JOB VARCHAR(20),
	MGR INT,
	HIREDATE DATE,
	SAL INT,
	COMM INT,
	DEPTNO INT
);
INSERT INTO Test_Single_Row_001 VALUES 
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);

CREATE TABLE Test_Single_Row_002 (
DEPTNO INT,
DNAME VARCHAR(20),
LOC VARCHAR(20)
);

INSERT INTO Test_Single_Row_002 VALUES 
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');

SELECT sal + (SELECT max(DEPTNO)  FROM Test_Single_Row_002) FROM Test_Single_Row_001 ;

drop table if exists Test_Single_Row_001;
drop table if exists Test_Single_Row_002;

--1276 E121-01 DECLARE CURSOR
DROP PROCEDURE sp_opencursor_test_001 IF EXISTS CASCADE;
drop table t_procedure_test_001 IF EXISTS ;
drop table t_procedure_test_002 IF EXISTS;

create table t_procedure_test_001(
  projid int, 
  projectdesc VARCHAR(30), 
  projectstatus varchar(50)
  );
  
insert into t_procedure_test_001 values 
 (1,'a','1'),
 (2,'b','0'),
 (3,'c','1'),
 (4,'d','0'),
 (5,'e','1'),
 (6,'f','0');

create table t_procedure_test_002(
c1 int, 
c2 varchar(30), 
c3 int
);
   
  
CREATE PROCEDURE sp_opencursor_test_001()
 BEGIN
 DECLARE var1 INTEGER DEFAULT 0;
 DECLARE var2 CHARACTER(30);
 DECLARE projcursor CURSOR FOR
 SELECT projid, projectdesc FROM t_procedure_test_001 ORDER BY projid;
 OPEN projcursor;
 L1: WHILE (SQLSTATE = '00000')
 DO
 FETCH projcursor INTO var1, var2;
 insert into t_procedure_test_002 values(var1, var2,SQLCODE);
 IF VAR1 = 6 THEN
   insert into t_procedure_test_002 values(100, SQLSTATE,SQLCODE);
  LEAVE L1;
  END IF;
 END WHILE;
 CLOSE projcursor;
 END;
/
 
 
delete from t_procedure_test_002;

CALL  sp_opencursor_test_001();

SELECT * FROM t_procedure_test_002 ORDER BY C1;


--1277 E121-02 ORDER BY columns need not be in select list

drop procedure sp_opencursor_test_002 if exists cascade;
drop table t_procedure_test_003 if exists cascade;

create table t_procedure_test_003(
id int,
name varchar(200)
);

insert into t_procedure_test_003 values
(1,'qq'),
(2,'aa'),
(3,'zz'),
(4,'ww'),
(5,'ss'),
(6,'xx');

CREATE PROCEDURE sp_opencursor_test_002()
 BEGIN
 DECLARE var1 INTEGER DEFAULT 0;
 DECLARE var2 CHARACTER(30);
 DECLARE projcursor CURSOR FOR
 SELECT id FROM t_procedure_test_003 ORDER BY name;
 open projcursor;
 insert into t_procedure_test_003 values(100,'qqqaaazzz');
 close projcursor;
 END;
/
 
 call sp_opencursor_test_002();

drop procedure sp_opencursor_test_002 if exists cascade;
drop table t_procedure_test_003 if exists cascade;


--1280 E121-06 Positioned UPDATE statement and E121-07 Positioned DELETE STATEMENT
DROP PROCEDURE sp_opencursor_test_003 IF EXISTS CASCADE;
DROP PROCEDURE sp_opencursor_test_004 IF EXISTS CASCADE;
DROP TABLE t_procedure_test_004 IF EXISTS CASCADE;

create table t_procedure_test_004 (col1 int primary key, col2 int) ;

insert into t_procedure_test_004 values
(1,2),
(3,4),
(5,6),
(7,8),
(9,10);


create procedure sp_opencursor_test_003()
  modifies sql data
  label_1: begin atomic
    for_label: for for_variable as cursor1 cursor for select * from t_procedure_test_004 for update do
      update t_procedure_test_004 set col2 = 1000  where current of cursor1;
    end for for_label;
  end label_1;
/
  
call sp_opencursor_test_003();
  
select * from t_procedure_test_004 order by col1;
  
create procedure sp_opencursor_test_004()
  modifies sql data
  label_1: begin atomic
    for_label: for for_variable as cursor1 cursor for select * from t_procedure_test_004 for update do
      delete from t_procedure_test_004  where current of cursor1;
    end for for_label;
  end label_1;
/
  
call sp_opencursor_test_004();
  
select count(*) from t_procedure_test_004;
  
DROP PROCEDURE sp_opencursor_test_003 IF EXISTS CASCADE;
DROP PROCEDURE sp_opencursor_test_004 IF EXISTS CASCADE;
DROP TABLE t_procedure_test_004 IF EXISTS CASCADE;

--1283 E121-10 FETCH statement: implicit NEXT
DROP PROCEDURE sp_opencursor_test_005 IF EXISTS CASCADE;
drop table if exists t_procedure_test_005;
drop table if exists t_procedure_test_006;

create table t_procedure_test_005(
c1 int, 
c2 varchar(30), 
sqlcode int, 
sqlstate varchar(30), 
activity int
);

create table t_procedure_test_006(
  projid int, 
  projectdesc VARCHAR(30), 
  projectstatus varchar(50)
 );
  
insert into t_procedure_test_006 values 
(1,'a','1'),
(2,'b','0'),
(3,'c','1'),
(4,'d','0'),
(5,'e','1'),
(6,'f','0');

CREATE PROCEDURE sp_opencursor_test_005 (INOUT par1 INTEGER, INOUT par2 VARCHAR(30))
 BEGIN
 DECLARE var1 INTEGER DEFAULT 0;
 DECLARE projcursor CURSOR FOR
 SELECT projid, projectdesc FROM t_procedure_test_006 ORDER BY projid;
 OPEN projcursor;
 Label1:LOOP
 set var1 = var1 + 1;
 FETCH projcursor INTO par1, par2;
 insert into t_procedure_test_005  values(var1, par2, :SQLCODE, :SQLSTATE, :ACTIVITY_COUNT);
 IF (SQLSTATE = '02000') THEN
 insert into t_procedure_test_005  values(666, par2, :SQLCODE, :SQLSTATE, :ACTIVITY_COUNT);
 LEAVE label1;
 END IF;
 IF (var1 >= 7) THEN
  insert into t_procedure_test_005  values(888, par2, :SQLCODE, :SQLSTATE, :ACTIVITY_COUNT);
  LEAVE label1;
  END IF;
 END LOOP label1;
 insert into t_procedure_test_005  values(1000, 'QQQ', :SQLCODE, :SQLSTATE, :ACTIVITY_COUNT);
 CLOSE projcursor;
 END;
/
 
 delete from t_procedure_test_005;
 
 call sp_opencursor_test_005(1,'0');
 
 SELECT * FROM t_procedure_test_005 ORDER BY C1;
