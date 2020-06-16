--    Description: 测试stored procedure
--    Date:         2020-06-16
--    Author:       丁婷

--测试733 LDBX043
drop TABLE t_diagnostics_tab1 IF EXISTS cascade;
drop table t_diagnostics_employee IF EXISTS cascade;
drop PROCEDURE sp_diagnostics_Sample3 IF EXISTS cascade;

create table t_diagnostics_employee (
last_name varchar(10), 
department_number INTEGER
);

insert into t_diagnostics_employee values 
('a',501),
('b',501),
('c',501),
('d',501);

CREATE  TABLE t_diagnostics_tab1(
c1 varchar(30),
c2 INTEGER
 );
 
insert into  t_diagnostics_tab1 values
('a',1),
('b',2);

CREATE PROCEDURE sp_diagnostics_Sample3(OUT SO VARCHAR(10), OUT RS VARCHAR(5), OUT ML INTEGER, OUT CN INTEGER,out co VARCHAR(10),
 OUT CI VARCHAR(10),out Omsg varchar(30),out lastnm varchar(10),IN deptnum INTEGER)
 BEGIN
 DECLARE CONTINUE HANDLER FOR SQLSTATE '21000'
 GET DIAGNOSTICS EXCEPTION 1
 CO = CLASS_ORIGIN,
 CI = CONDITION_IDENTIFIER,
 CN = CONDITION_NUMBER,
 ML = MESSAGE_LENGTH,
 RS = RETURNED_SQLSTATE,
 SO = SUBCLASS_ORIGIN,
 Omsg = MESSAGE_TEXT;
 L1:BEGIN
 DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
 BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
 DELETE FROM t_diagnostics_tab1;
  RESIGNAL sqlstate '21000' SET MESSAGE_TEXT = 'Table does not exist';
 END;
 SELECT last_name INTO :lastnm FROM t_diagnostics_employee WHERE department_number = :deptnum;
 END;
 SELECT last_name INTO :lastnm FROM t_diagnostics_employee WHERE department_number = :deptnum;
 END L1;
 END;
/
 
 CALL sp_diagnostics_Sample3( SO , RS ,ML , CN , co ,CI  ,Omsg , lastnm ,501);
 
 call SO;
 
drop TABLE t_diagnostics_tab1 IF EXISTS cascade;
drop table t_diagnostics_employee IF EXISTS cascade;
drop PROCEDURE sp_diagnostics_Sample3 IF EXISTS cascade;
 
-- 测试822 LDBX043-04
DROP PROCEDURE test_proc_compoundstatement_p5 IF EXISTS CASCADE;

CREATE PROCEDURE test_proc_compoundstatement_p5(OUT name1 VARCHAR(50),OUT name2 VARCHAR(50),OUT name3 VARCHAR(50),
OUT name4 VARCHAR(50),OUT name5 VARCHAR(50),OUT name6 VARCHAR(50))
BEGIN NOT ATOMIC
	
	DECLARE judge_name1 VARCHAR(50);
	DECLARE judge_name2 VARCHAR(50);
	DECLARE judge_name3 VARCHAR(50);
	DECLARE judge_name4 VARCHAR(50);	
	DECLARE judge_name5 VARCHAR(50);
	DECLARE judge_name6 VARCHAR(50);
	
	SET judge_name1='null';
	SET judge_name2='null';
	SET judge_name3='null';
	SET judge_name4='null';
	SET judge_name5='null';
	SET judge_name6='null';
	
	statement_4:BEGIN ATOMIC
	
	statement_5:BEGIN NOT ATOMIC
	
	statement_1: BEGIN NOT ATOMIC
	
	SET judge_name1='grgrg';
	
	SET judge_name2='jhyhjy';
	
    END statement_1;
    
    SET name1=judge_name1;
    
    SET name2=judge_name2;

    
    statement_2: BEGIN ATOMIC
	
	SET judge_name3='bghgh';
	
	SET judge_name4='oioio';
	
    END statement_2;    
    
    SET name3=judge_name3;
    
    SET name4=judge_name4;
    
    END statement_5;
    
    statement_6:BEGIN ATOMIC
    
    statement_3: BEGIN
	
	SET judge_name5='iuyiuy';
	
	SET judge_name6='mjghghg';
	
    END statement_3;    
    
    SET name5=judge_name5;
    
    SET name6=judge_name6;
    
    END statement_6;

    END statement_4;
END;
/

CALL test_proc_compoundstatement_p5(name1,name2,name3,name4,name5,name6);

CALL name1;

DROP PROCEDURE test_proc_compoundstatement_p5 IF EXISTS CASCADE;

--测试 LDBX043-06 存储过程支持open cursor、close cursor语句
drop table T_PROCEDURE_STORED_001 IF EXISTS cascade;
drop table T_PROCEDURE_STORED_002 IF EXISTS;
DROP PROCEDURE sp_opencursor_stored_001 IF EXISTS CASCADE;
 
create table T_PROCEDURE_STORED_001(
  projid int, 
  projectdesc VARCHAR(30), 
  projectstatus varchar(50)
  );
  
insert into T_PROCEDURE_STORED_001 values (1,'a','1');
insert into T_PROCEDURE_STORED_001 values (2,'b','0');
insert into T_PROCEDURE_STORED_001 values (3,'c','1');
insert into T_PROCEDURE_STORED_001 values (4,'d','0');
insert into T_PROCEDURE_STORED_001 values (5,'e','1');
insert into T_PROCEDURE_STORED_001 values (6,'f','0');

create table T_PROCEDURE_STORED_002(
 c1 int, 
 c2 varchar(30), 
 c3 int
);
 

 
CREATE PROCEDURE sp_opencursor_stored_001()
BEGIN
DECLARE var1 INTEGER DEFAULT 0;
DECLARE var2 CHARACTER(30);
DECLARE projcursor CURSOR FOR
SELECT projid, projectdesc FROM T_PROCEDURE_STORED_001 ORDER BY projid;
OPEN projcursor;
L1: WHILE (SQLSTATE = '00000')
DO
FETCH projcursor INTO var1, var2;
insert into T_PROCEDURE_STORED_002 values(var1, var2,SQLCODE);
IF VAR1 = 6 THEN
  insert into T_PROCEDURE_STORED_002 values(100, SQLSTATE,SQLCODE);
 LEAVE L1;
 END IF;
END WHILE;
CLOSE projcursor;
END;
/
 
delete from T_PROCEDURE_STORED_002;
 
CALL  sp_opencursor_stored_001();
 
SELECT * FROM T_PROCEDURE_STORED_002 ORDER BY C1;
 
drop table T_PROCEDURE_STORED_001 IF EXISTS cascade;
drop table T_PROCEDURE_STORED_002 IF EXISTS;
drop PROCEDURE sp_opencursor_stored_001 IF EXISTS CASCADE;
