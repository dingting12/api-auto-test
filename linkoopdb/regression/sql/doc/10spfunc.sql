--Description: doc 10 stored procedure and function
--Date：2020-07-13
--Author：满意

-- 10.1 用户自定义函数(UDF)
drop jar 'testUdf-0.0.1-SNAPSHOT.jar';

add jar '$TEST_ROOT/regression/sql/doc/testUdf-0.0.1-SNAPSHOT.jar' not check exists;

drop function function_test_int if exists;

drop table db_udf_int if exists;


CREATE FUNCTION function_test_int(price int) RETURNS int
LANGUAGE JAVA DETERMINISTIC NO SQL
EXTERNAL NAME 'com.datapps.dbudf.testdbudf.UDFbigint';
/

CREATE TABLE db_udf_int(price int);

INSERT INTO db_udf_int VALUES
(12),
(302);

select function_test_int(price) from db_udf_int ;

--10.2 UDT
--10.2.2. 创建UDT
drop table TDV_TABLE IF EXISTS CASCADE;
DROP TYPE udt_wy_1 IF EXISTS CASCADE;
DROP TYPE tdv_type_1 IF EXISTS CASCADE;


CREATE TYPE udt_wy_1 AS SMALLINT;

CREATE TYPE IF NOT EXISTS tdv_type_1(
col1 INT,
col2 INT,
col3 VARCHAR(200)
);

CREATE TABLE TDV_TABLE(
col1 udt_wy_1,
col2 tdv_type_1
);

INSERT INTO TDV_TABLE VALUES(2,NEW tdv_type_1(9527, 9528, 'Teradata-syntaxtest'));

select * from TDV_TABLE;

-- 10.3存储过程
DROP PROCEDURE call_test1 IF EXISTS CASCADE;

CREATE PROCEDURE call_test1 (IN V1 INTEGER, INOUT V2 INTEGER,
OUT V3 INTEGER)
BEGIN
SET V3 = V1 + 2;
SET V2 = V2 * V2;
END;
/

CALL call_test1 (3,4,V3);

CALL V3;

CALL call_test1 (3+2, 5*3, V3);

CALL V3;


DROP PROCEDURE test_call1 IF EXISTS CASCADE;

CREATE PROCEDURE test_call1(IN w1 INTEGER, OUT w2 INTEGER)
BEGIN
SET w2 = 100/w1 + 100;
END;
/

CALL test_call1(4,w2);

CALL w2;

DROP PROCEDURE test_call2 IF EXISTS CASCADE;

CREATE PROCEDURE test_call2(IN v1 INTEGER, OUT v2 INTEGER)
BEGIN
DECLARE a INTEGER;
SET a = v1 + 2;
CALL test_call1(:a,:v2);
END;
/

CALL test_call2(2,v2);

CALL v2;

DROP PROCEDURE test_declare_variable IF EXISTS CASCADE;

DROP TYPE udt_wy_1 IF EXISTS CASCADE;

CREATE TYPE udt_wy_1 AS SMALLINT;

CREATE TYPE IF NOT EXISTS
tdv_type(col1 INT, col2 INT, col3 VARCHAR(200));

DROP TABLE tdv_table IF EXISTS CASCADE;

CREATE TABLE TDV_TABLE(col1 udt_wy_1, col2 tdv_type);

INSERT INTO TDV_TABLE VALUES(2,NEW tdv_type(9527, 9528, 'Teradata-syntax-test'));



create procedure test_declare_variable(var1 udt_wy_1)
modifies sql data
block_1: begin atomic
declare var2 tdv_type default new tdv_type(9527, 9528, 'Teradata-syntax-test');
insert into tdv_table values(var1, var2);
end block_1;
/

call test_declare_variable(1);

select * from tdv_table order by col1;

call test_declare_variable(2);

select * from tdv_table order by col1;

call test_declare_variable(3);

select * from tdv_table order by col1;





DROP PROCEDURE test_value IF EXISTS CASCADE;

CREATE PROCEDURE test_value(IN p1 INTEGER, OUT pmsg CHAR(30))
BEGIN
IF p1 > 0 THEN
SET pmsg = 'Positive value';
ELSEIF p1 = 0 THEN
SET pmsg = 'Zero Value';
ELSE
SET pmsg = 'Negative Value';
END IF;
END;
/

call test_value(-1,pmsg);
call pmsg;
call test_value(1,pmsg);
call pmsg;
call test_value(0,pmsg);
call pmsg;


DROP PROCEDURE sp_log IF EXISTS CASCADE;

CREATE PROCEDURE sp_log ( INOUT p1 INTEGER)
BEGIN
WHILE p1 > 0 DO
SET p1 = p1 - 1;
END WHILE
END;
/

call sp_log(5);
call p1;

DROP PROCEDURE sp_loop IF EXISTS CASCADE;

CREATE PROCEDURE sp_loop ()
  BEGIN
  DECLARE vcount INTEGER DEFAULT 0;
  LOOP_LABEL: LOOP
  SET vcount = vcount + 1;
  IF vcount > 5 THEN
  LEAVE loop_label;
  END IF;
  END LOOP loop_label;
  END;
/

CALL sp_loop();

--测试repeat
DROP PROCEDURE test_repeat_statement IF EXISTS CASCADE;

DROP table trs_table IF EXISTS ;



CREATE TABLE trs_table(COL1 INT);

CREATE PROCEDURE test_repeat_statement()
  MODIFIES SQL DATA
  label_1: BEGIN ATOMIC
  DECLARE VAR_1 INTEGER DEFAULT 0;
  repeat_label: REPEAT
  INSERT INTO trs_table VALUES(VAR_1);
  SET VAR_1 = VAR_1 + 1;
  UNTIL VAR_1 > 10 END REPEAT repeat_label;
  END label_1;
/

CALL test_repeat_statement();

select * from trs_table order by COL1;

--测试ITERATE

DROP PROCEDURE test_iterate_statement IF EXISTS CASCADE;
DROP table tis_table IF EXISTS ;

CREATE TABLE tis_table(COL1 INT, COL2 INT);

CREATE PROCEDURE test_iterate_statement()
  MODIFIES SQL DATA
  label_1: BEGIN ATOMIC
  DECLARE VAR_1 INT DEFAULT 0;
  DECLARE VAR_2 INT DEFAULT 0;
  while_1_lable: WHILE VAR_1 <= 10
  DO
  SET VAR_1 = VAR_1 + 1;
  SET VAR_2 = 1;
  while_2_label: WHILE VAR_2 <= 2
  DO
  IF MOD(VAR_1, 2) = MOD(VAR_2, 2) THEN
  ITERATE while_1_lable;
  END IF;
  INSERT INTO tis_table VALUES(VAR_1, VAR_2);
  SET VAR_2 = VAR_2 + 1;
  END WHILE while_2_label;
  INSERT INTO tis_table VALUES(-1, -1);
  END WHILE while_1_lable;
  END label_1;
/

CALL test_iterate_statement();

select * from tis_table order by COL1;


--测试标签使用
DROP PROCEDURE sp_loop IF EXISTS CASCADE;

CREATE PROCEDURE sp_loop ()
  BEGIN
  DECLARE vcount INTEGER DEFAULT 0;
  LOOP_LABEL: LOOP
  SET vcount = vcount + 1;
  IF vcount > 5 THEN
  LEAVE loop_label;
  END IF;
  END LOOP loop_label;
  END;
/

call sp_loop ();


--存储过程中支持进行增删改查操作

DROP PROCEDURE Test_changedata_p1 IF EXISTS CASCADE;
DROP table employee IF EXISTS cascade;



CREATE TABLE employee(
   employee_number INTEGER,
   manager_employee_number INTEGER,
   department_number INTEGER,
   job_code INTEGER,
   last_name CHAR(20) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   hire_date DATE NOT NULL,
   birthdate DATE NOT NULL,
   salary_amount DECIMAL(10,2) NOT NULL
);

CREATE PROCEDURE Test_changedata_p1(OUT flag VARCHAR(50),OUT name CHAR(5))
MODIFIES SQL DATA
BEGIN
  DECLARE num INT;
  SET num=0;
  INSERT INTO employee VALUES(1025,0801,201,211100,'Short','Michael',
now(),now(),34700);
  SET num=(SELECT count(*) FROM employee);
  IF num=2 THEN SET flag='true';
  END IF;
  SET name=(SELECT LAST_NAME FROM employee WHERE EMPLOYEE_NUMBER=1025);
END;
/

call Test_changedata_p1(flag,name);

call flag;

call name;

select * from employee order by employee_number;


--10.3.4 游标的定义与使用
DROP TABLE t_proc_emp IF EXISTS CASCADE;

CREATE TABLE t_proc_emp (
    EMPNO INT,
    ENAME VARCHAR(20),
    JOB VARCHAR(20),
    MGR INT,
    HIREDATE DATE,
    SAL INT,
    COMM INT,
    DEPTNO INT
);

INSERT INTO t_proc_emp VALUES (1000,'SMITH','CLERK',7902,TO_DATE('1980-12-17','yyyy-mm-dd'),800,NULL,20);
INSERT INTO t_proc_emp VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('1981-2-20','yyyy-mm-dd'),1600,300,30);

DROP PROCEDURE sp_cur5 IF EXISTS CASCADE;

CREATE PROCEDURE sp_cur5 (OUT prowcount INTEGER)
BEGIN
DECLARE newvar INT DEFAULT 0;
FOR loopvar AS cur1 CURSOR FOR
SELECT empno AS emp, deptno AS dept FROM t_proc_emp
WHERE empno < 1005 ORDER BY 1
DO
SET newvar = newvar + 1;
END FOR;
SET prowcount = newvar;
END;
/

CALL sp_cur5(prowcount);

CALL prowcount;


DROP TABLE t_project_wy_1 IF EXISTS CASCADE;

create table t_project_wy_1(
  projid int,
  projectdesc VARCHAR(30),
  projectstatus varchar(50)
);

insert into t_project_wy_1 values (1,'a','1');
insert into t_project_wy_1 values (2,'b','0');
insert into t_project_wy_1 values (3,'c','1');

DROP TABLE t_tmp_wy_1 IF EXISTS CASCADE;

create table t_tmp_wy_1(
c1 int,
c2 varchar(30),
c3 int
);

DROP PROCEDURE sp_opencursor_wy_1 IF EXISTS CASCADE;

CREATE PROCEDURE sp_opencursor_wy_1()
BEGIN
DECLARE var1 INTEGER DEFAULT 0;
DECLARE var2 CHARACTER(30);
DECLARE projcursor CURSOR FOR
SELECT projid, projectdesc FROM t_project_wy_1 ORDER BY projid;
OPEN projcursor;
L1: WHILE (SQLSTATE = '00000')
DO
FETCH projcursor INTO var1, var2;
insert into t_tmp_wy_1 values(var1, var2,SQLCODE);
IF VAR1 = 3 THEN
  insert into t_tmp_wy_1 values(100, SQLSTATE,SQLCODE);
  LEAVE L1;
  END IF;
END WHILE;
CLOSE projcursor;
END;
/

call sp_opencursor_wy_1();

select * from t_tmp_wy_1;



DROP table test_proc_cursor_employee IF EXISTS CASCADE;

DROP PROCEDURE upd_cur1 IF EXISTS CASCADE;

CREATE TABLE test_proc_cursor_employee(
     employee_number INTEGER primary key,
     manager_employee_number INTEGER,
     department_number INTEGER,
     job_code INTEGER,
     last_name CHAR(20) NOT NULL,
     first_name VARCHAR(30) NOT NULL,
     hire_date DATE NOT NULL,
     birthdate DATE NOT NULL,
     salary_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO test_proc_cursor_employee VALUES(0801,0801,100,111100,'Trainer','I.B.','2018-11-14','2018-11-14',100000);
INSERT INTO test_proc_cursor_employee VALUES(1001,1003,401,412101,'Hoover','William',now(),now(),25525);
INSERT INTO test_proc_cursor_employee VALUES(1002,1003,401,413201,'Brown','Alan',now(),now(),43100);
INSERT INTO test_proc_cursor_employee VALUES(1003,0801,401,411100,'Trader','James',now(),now(),37850);
INSERT INTO test_proc_cursor_employee VALUES(1004,1003,401,412101,'Johnson','Darlene',now(),now(),36300);
INSERT INTO test_proc_cursor_employee VALUES(1005,0801,403,431100,'Ryan','Loretta',now(),now(),31200);
INSERT INTO test_proc_cursor_employee VALUES(1006,1019,301,312101,'Stein','John',now(),now(),29450);
INSERT INTO test_proc_cursor_employee VALUES(1007,1005,403,432101,'Villegas','Arnando',now(),now(),49700);
INSERT INTO test_proc_cursor_employee VALUES(1008,1019,301,312102,'Kanieski','Carol',now(),now(),29250);
INSERT INTO test_proc_cursor_employee VALUES(1009,1005,403,432101,'Lombardo','Domingus',now(),now(),31000);
INSERT INTO test_proc_cursor_employee VALUES(1010,1003,401,412101,'Rogers','Frank',now(),now(),46000);
INSERT INTO test_proc_cursor_employee VALUES(1011,0801,402,421100,'Daly','James',now(),now(),52500);
INSERT INTO test_proc_cursor_employee VALUES(1012,1005,403,432101,'Hopkins','Paulene',now(),now(),37900);
INSERT INTO test_proc_cursor_employee VALUES(1013,1003,401,412102,'Phillips','Charles',now(),now(),24500);
INSERT INTO test_proc_cursor_employee VALUES(1014,1011,402,422101,'Crane','Robert',now(),now(),24500);
INSERT INTO test_proc_cursor_employee VALUES(1015,1017,501,512101,'Wilson','Edward',now(),now(),53625);
INSERT INTO test_proc_cursor_employee VALUES(1016,0801,302,321100,'Rogers','Nora',now(),now(),56500);
INSERT INTO test_proc_cursor_employee VALUES(1017,0801,501,511100,'Runyon','Irene',now(),now(),66000);
INSERT INTO test_proc_cursor_employee VALUES(1018,1017,501,512101,'Ratzlaff','Larry',now(),now(),54000);
INSERT INTO test_proc_cursor_employee VALUES(1019,0801,301,311100,'Kubic','Ron',now(),now(),57700);
INSERT INTO test_proc_cursor_employee VALUES(1020,1005,403,432101,'Charles','John',now(),now(),39500);
INSERT INTO test_proc_cursor_employee VALUES(1021,1025,201,222101,'Morrissey','Jim',now(),now(),38750);
INSERT INTO test_proc_cursor_employee VALUES(1022,1003,401,412102,'Machado','Albert',now(),now(),32300);
INSERT INTO test_proc_cursor_employee VALUES(1023,1017,501,512101,'Rabbit','Peter',now(),now(),26500);
INSERT INTO test_proc_cursor_employee VALUES(1024,1005,403,432101,'Brown','Allen',now(),now(),43700);
INSERT INTO test_proc_cursor_employee VALUES(1025,0801,201,211100,'Short','Michael',now(),now(),34700);

CREATE PROCEDURE upd_cur1 ()
MODIFIES SQL DATA
BEGIN
 DECLARE salary DECIMAL(10,2);
 FOR for_loop AS cursor1 CURSOR FOR
 SELECT employee_number, salary_amount FROM test_proc_cursor_employee
 WHERE department_number = 403
 DO
  SET salary = for_loop.salary_amount;
  IF salary < 30000 THEN UPDATE test_proc_cursor_employee
 SET salary_amount = salary * 1.10 WHERE CURRENT OF cursor1;
 ELSEIF salary < 40000 AND salary>=30000 THEN UPDATE
test_proc_cursor_employee
 SET salary_amount = salary * 1.08 WHERE CURRENT OF cursor1;
 ELSEIF salary < 50000 AND salary>=40000 THEN UPDATE
test_proc_cursor_employee
 SET salary_amount = salary * 1.05 WHERE CURRENT OF cursor1;
 END IF;
 END FOR;
END;
/

call upd_cur1();

select * from test_proc_cursor_employee order by employee_number;



DROP TABLE transaction_sample IF EXISTS CASCADE;

--创建一张带有主键的pallas表
CREATE TABLE transaction_sample(
id INT PRIMARY KEY,
name VARCHAR(200),
age INT
) engine pallas;

INSERT INTO transaction_sample VALUES
(1,'dsdsd',12),
(2,'coi',14),
(3 ,'qopo',15);

SELECT * FROM transaction_sample ORDER BY id;

DROP TABLE IF EXISTS transaction_errorlog;

--创建用来存储错误信息的表
CREATE TABLE transaction_errorlog (
Sql_code INT, 
Sql_State VARCHAR(5),
state_desc VARCHAR(200)
);

DROP PROCEDURE sp_transaction IF EXISTS CASCADE;

CREATE PROCEDURE sp_transaction(OUT spmsg VARCHAR(200))
BEGIN
  DECLARE counts1 INT;
  DECLARE counts2 INT;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
  BEGIN
  IF :SQLSTATE='40000' THEN
  INSERT INTO transaction_errorlog VALUES(:SQLCODE,:SQLSTATE,'INSERT
is failed! Found duplitcate primary key');
  END IF;
  END;
  SET counts1=SELECT count(*) FROM transaction_sample;
  SET counts2=0;
  LABEL_1:BEGIN ATOMIC
  BEGIN TRANSACTION;
  INSERT INTO transaction_sample VALUES(4,'cnoci',20); 
  INSERT INTO transaction_sample VALUES(1,'dsdsd',12); 
  END TRANSACTION;
  END LABEL_1;
  SET counts2=SELECT count(*) FROM transaction_sample;
  IF counts1 = counts2 THEN SET spmsg='transaction failed';
  ELSE SET spmsg='transaction successed'
  END IF;
END;
/


DELETE FROM transaction_errorlog;

CALL sp_transaction(spmsg);

CALL spmsg; 

SELECT * FROM transaction_sample ORDER BY id; 

SELECT * FROM transaction_errorlog; 





DROP TABLE t_project_wy_1 IF EXISTS CASCADE;

create table t_project_wy_1(
  projid int,
  projectdesc VARCHAR(30),
  projectstatus varchar(50)
);

DROP PROCEDURE sp_test1 IF EXISTS CASCADE;

CREATE PROCEDURE sp_test1()
BEGIN
DECLARE var1 INTEGER;
DECLARE var2 CHARACTER(30);
DECLARE projcursor CURSOR FOR
SELECT projid, projectdesc
FROM t_project_wy_1
ORDER BY projid;
OPEN projcursor;
FETCH projcursor INTO var1, var2;
CLOSE projcursor;
END;
/

call sp_test1();


DROP TABLE t_test1 IF EXISTS CASCADE;

DROP TABLE t_test2 IF EXISTS CASCADE;

CREATE TABLE t_test1(
  id INT,
  name VARCHAR(50)
);

INSERT INTO t_test1 VALUES
(1,'vf'),
(2,'oiu'),
(3,'ncou');

CREATE TABLE t_test2(
  id INT,
  name VARCHAR(50)
);

INSERT INTO t_test2 VALUES(1,'vf'),(2,'oiu');

drop PROCEDURE sp_test11 IF EXISTS CASCADE; 

CREATE PROCEDURE sp_test11()
DYNAMIC RESULT SETS 2
BEGIN
  DECLARE cur1 CURSOR FOR SELECT * FROM t_test1;
  DECLARE cur2 CURSOR FOR SELECT * FROM t_test2;
  DECLARE cur3 CURSOR FOR SELECT * FROM t_test2 WHERE id=1;
  OPEN cur1;
  OPEN cur2;
  OPEN cur3;
END;
/

CALL sp_test11();


--10.3.5 ACTIVITY_COUNT,SQLSTATUS,SQLCODE的定义与使用
drop table ac IF EXISTS CASCADE; 
drop table AC_TBL IF EXISTS CASCADE; 
drop table t_sqlstate_emp_wy1 IF EXISTS CASCADE; 
drop table t_sqlstate_errorlog_wy1 IF EXISTS CASCADE;

create table ac(
  id int,
  username VARCHAR(50),
  age INT,
  pwd VARCHAR(255)
);

insert into ac values(1,'a',10,'a11rww');
insert into ac values(2,'b',20,'a22rww');
insert into ac values(3,'c',30,'accrww');

create table AC_TBL (C1 INT);

CREATE TABLE t_sqlstate_emp_wy1
(
employee_number INTEGER,
manager_employee_number INTEGER,
department_number INTEGER,
job_code INTEGER,
last_name CHAR(20) NOT NULL,
first_name VARCHAR(30) NOT NULL,
hire_date DATE NOT NULL,
birthdate DATE NOT NULL,
salary_amount DECIMAL(10,2) NOT NULL
);
INSERT INTO t_sqlstate_emp_wy1 VALUES(0801,0801,100,111100,'Trainer','I.B.',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),100000);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1001,1003,401,412101,'Hoover','William',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),25525);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1002,1003,401,413201,'Brown','Alan',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),43100);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1003,0801,401,411100,'Trader','James',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),37850);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1004,1003,401,412101,'Johnson','Darlene',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),36300);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1005,0801,403,431100,'Ryan','Loretta',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),31200);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1006,1019,301,312101,'Stein','John',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),29450);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1007,1005,403,432101,'Villegas','Arnando',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),49700);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1008,1019,301,312102,'Kanieski','Carol',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),29250);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1009,1005,403,432101,'Lombardo','Domingus',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),31000);
INSERT INTO t_sqlstate_emp_wy1 VALUES (1010,1003,401,412101,'Rogers','Frank',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),46000);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1011,0801,402,421100,'Daly','James',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),52500);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1012,1005,403,432101,'Hopkins','Paulene',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),37900);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1013,1003,401,412102,'Phillips','Charles',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),24500);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1014,1011,402,422101,'Crane','Robert',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),24500);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1015,1017,501,512101,'Wilson','Edward',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),53625);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1016,0801,302,321100,'Rogers','Nora',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),56500);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1017,0801,501,511100,'Runyon','Irene',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),66000);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1018,1017,501,512101,'Ratzlaff','Larry',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),54000);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1019,0801,301,311100,'Kubic','Ron',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),57700);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1020,1005,403,432101,'Charles','John',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),39500);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1021,1025,201,222101,'Morrissey','Jim',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),38750);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1022,1003,401,412102,'Machado','Albert',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),32300);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1023,1017,501,512101,'Rabbit','Peter',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),26500);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1024,1005,403,432101,'Brown','Allen',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),43700);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1024,1005,1003,432101,'Brown','Allen',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),43700);

CREATE TABLE t_sqlstate_errorlog_wy1(
  Sql_code INT,
  Sql_State CHAR(5)
);

drop PROCEDURE test_activitycount_p7 IF EXISTS CASCADE;

create PROCEDURE test_activitycount_p7 (INOUT p1_wy1 INTEGER, IN name_wy1
varchar(50))
begin
  insert AC_TBL (:ACTIVITY_COUNT);
  UPDATE ac SET id = p1_wy1 + :ACTIVITY_COUNT where username = name_wy1;
  insert AC_TBL (:ACTIVITY_COUNT);
  UPDATE ac SET id = p1_wy1 where id = :ACTIVITY_COUNT;
END;
/

call test_activitycount_p7(p1_wy1,'c');

call p1_wy1;

--SQLCODE,SQLSTATE demo
drop PROCEDURE p_sqlstate_wy1 IF EXISTS CASCADE;

CREATE PROCEDURE p_sqlstate_wy1 (IN deptnum_wy1 INTEGER, OUT lastnm_wy1
CHAR(20))
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
  INSERT INTO t_sqlstate_errorlog_wy1 VALUES (:SQLCODE, :SQLSTATE);
  END;
  SELECT last_name INTO :lastnm_wy1 FROM t_sqlstate_emp_wy1 WHERE
department_number = :deptnum_wy1;
  INSERT INTO t_sqlstate_errorlog_wy1 VALUES (0, 'ok');
END;
/

call p_sqlstate_wy1(1003,lastnm_wy1);

call lastnm_wy1;


--10.3.6. SELECT INTO的使用
drop table employee IF EXISTS CASCADE;
drop PROCEDURE test_proc_select IF EXISTS CASCADE;

CREATE TABLE employee(
 employee_number INTEGER,
 manager_employee_number INTEGER,
 department_number INTEGER,
 job_code INTEGER,
 last_name CHAR(20) NOT NULL,
 first_name VARCHAR(30) NOT NULL,
 hire_date DATE NOT NULL,
 birthdate DATE NOT NULL,
 salary_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO employee VALUES(0801,0801,100,111100,'Trainer','I.B.','2018-11-14','2018-11-14',100000);
INSERT INTO employee VALUES(1001,1003,401,412101,'Hoover','William',now(),now(),25525);
INSERT INTO employee VALUES(1002,1003,401,413201,'Brown','Alan',now(),now(),43100);
INSERT INTO employee VALUES(1003,0801,401,411100,'Trader','James',now(),now(),37850);
INSERT INTO employee VALUES(1004,1003,401,412101,'Johnson','Darlene',now(),now(),36300);
INSERT INTO employee VALUES(1005,0801,403,431100,'Ryan','Loretta',now(),now(),31200);
INSERT INTO employee VALUES(1006,1019,301,312101,'Stein','John',now(),now(),29450);
INSERT INTO employee VALUES(1007,1005,403,432101,'Villegas','Arnando',now(),now(),49700);
INSERT INTO employee VALUES(1008,1019,301,312102,'Kanieski','Carol',now(),now(),29250);
INSERT INTO employee VALUES(1009,1005,403,432101,'Lombardo','Domingus',now(),now(),31000);
INSERT INTO employee VALUES (1010,1003,401,412101,'Rogers','Frank',now(),now(),46000);
INSERT INTO employee VALUES(1011,0801,402,421100,'Daly','James',now(),now(),52500);
INSERT INTO employee VALUES(1012,1005,403,432101,'Hopkins','Paulene',now(),now(),37900);
INSERT INTO employee VALUES(1013,1003,401,412102,'Phillips','Charles',now(),now(),24500);
INSERT INTO employee VALUES(1014,1011,402,422101,'Crane','Robert',now(),now(),24500);
INSERT INTO employee VALUES(1015,1017,501,512101,'Wilson','Edward',now(),now(),53625);
INSERT INTO employee VALUES(1016,0801,302,321100,'Rogers','Nora',now(),now(),56500);
INSERT INTO employee VALUES(1017,0801,501,511100,'Runyon','Irene',now(),now(),66000);
INSERT INTO employee VALUES(1018,1017,501,512101,'Ratzlaff','Larry',now(),now(),54000);
INSERT INTO employee VALUES(1019,0801,301,311100,'Kubic','Ron',now(),now(),57700);
INSERT INTO employee VALUES(1020,1005,403,432101,'Charles','John',now(),now(),39500);
INSERT INTO employee VALUES(1021,1025,201,222101,'Morrissey','Jim',now(),now(),38750);
INSERT INTO employee VALUES(1022,1003,401,412102,'Machado','Albert',now(),now(),32300);
INSERT INTO employee VALUES(1023,1017,501,512101,'Rabbit','Peter',now(),now(),26500);
INSERT INTO employee VALUES(1024,1005,403,432101,'Brown','Allen','2018-11-14','2018-11-14',43700);
INSERT INTO employee VALUES(1025,0801,201,211100,'Short','Michael',now(),now(),34700);

CREATE PROCEDURE test_proc_select(IN enum INT,IN fname VARCHAR(50),IN
hdate DATE,IN sal DECIMAL(10,2),OUT lname VARCHAR(50))
BEGIN
  SELECT last_name INTO lname FROM employee
  WHERE employee_number = enum
  AND first_name = fname
  AND hire_date = hdate
  AND salary_amount=sal;
END;
/
call test_proc_select(0801,'I.B.','2018-11-14',100000,lname);

call lname;

--10.3.7. 存储过程中的诊断语句
drop table tab1 IF EXISTS CASCADE;
drop PROCEDURE getdiag1 IF EXISTS CASCADE;

CREATE TABLE tab1 (c1 INTEGER);

CREATE PROCEDURE getdiag1 (OUT OParam INTEGER,INOUT rowcount INTEGER)
BEGIN
SELECT c1 INTO OParam FROM tab1; -- Returns warning NODATA FOUND
GET DIAGNOSTICS rowcount = ROW_COUNT;
IF (rowcount = 0) THEN
SET OParam = 0;
END IF;
END;
/

CALL getdiag1(OParam, NULL);

call OParam;

drop PROCEDURE sp_diagnostics_Sample4 IF EXISTS CASCADE;

drop table t_diagnostics_employee IF EXISTS;

drop table t_diagnostics_tab1 IF EXISTS;

create table t_diagnostics_employee (last_name varchar(10), department_number INTEGER);

insert into t_diagnostics_employee values ('a',501);
insert into t_diagnostics_employee values ('b',501);
insert into t_diagnostics_employee values ('c',501);
insert into t_diagnostics_employee values ('d',501);

CREATE  TABLE t_diagnostics_tab1(c1 varCHAR(30), c2 INTEGER);

insert into  t_diagnostics_tab1 values('a',1);
insert into  t_diagnostics_tab1 values('b',2);

CREATE PROCEDURE sp_diagnostics_Sample4(OUT SO VARCHAR(30), OUT RS VARCHAR(5), OUT ML INT, OUT CN INT,out co VARCHAR(30),
 OUT CI VARCHAR(30),out Omsg varchar(30),out lastnm varchar(20),IN deptnum INTEGER)
 BEGIN
 DECLARE condition1 CONDITION;
 DECLARE CONTINUE HANDLER FOR condition1
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
  RESIGNAL condition1 SET MESSAGE_TEXT = 'Table does not exist';
 END;
 SELECT last_name INTO :lastnm FROM t_diagnostics_employee WHERE department_number = :deptnum;
 END;
 SELECT last_name INTO :lastnm FROM t_diagnostics_employee WHERE department_number = :deptnum;
 END L1;
 END;
/

CALL sp_diagnostics_Sample4( SO , RS ,ML , CN , co ,CI  ,Omsg , lastnm ,501);

call SO;

call RS;

call ML;

call CN;

call co;

call CI;

call Omsg;

call lastnm;


--10.3.8. 存储过程的异常情况处理
DROP PROCEDURE p_sqlstate_wy3 IF EXISTS CASCADE;
drop table t_sqlstate_emp_wy1 if exists CASCADE;
drop table t_sqlstate_errorlog_wy2 if exists CASCADE;

CREATE TABLE t_sqlstate_emp_wy1
(
employee_number INTEGER,
manager_employee_number INTEGER,
department_number INTEGER,
job_code INTEGER,
last_name CHAR(20) NOT NULL,
first_name VARCHAR(30) NOT NULL,
hire_date DATE NOT NULL,
birthdate DATE NOT NULL,
salary_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO t_sqlstate_emp_wy1 VALUES(1022,1003,401,412102,'Machado','Albert',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),32300);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1023,1017,501,512101,'Rabbit','Peter',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),26500);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1024,1005,403,432101,'Brown','Allen',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),43700);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1024,1005,1025,432101,'Brown','Allen',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),43700);

CREATE TABLE t_sqlstate_errorlog_wy2(
  Sql_code INT,
  Sql_State CHAR(5),
  message VARCHAR(50)
);

CREATE PROCEDURE p_sqlstate_wy3 (IN empnum_wy3 INTEGER, OUT lastnm_wy3
VARCHAR(20))
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
  IF SQLSTATE = '42000' THEN
  INSERT INTO t_sqlstate_errorlog_wy2 VALUES (:SQLCODE, :SQLSTATE
,'Warning - Object Not Found');
  ELSE
  INSERT INTO t_sqlstate_errorlog_wy2 VALUES (:SQLCODE, :SQLSTATE
,'Unplanned Exception');
  END IF;
  INSERT INTO t_sqlstate_errorlog_wy2 VALUES (:SQLCODE, :SQLSTATE,'1');
END;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
  BEGIN
  INSERT INTO t_sqlstate_errorlog_wy2 VALUES (:SQLCODE, :SQLSTATE
,'Warning - No Rows Found');
END;
  SELECT last_name INTO :lastnm_wy3 FROM t_sqlstate_emp_wy1 WHERE
employee_number = :empnum_wy3;
  INSERT INTO t_sqlstate_errorlog_wy2 VALUES (:SQLCODE, :SQLSTATE
,'Successful');
END;
/

call p_sqlstate_wy3(1022,lastnm_wy3);

call lastnm_wy3;

select * from t_sqlstate_errorlog_wy2;



DROP PROCEDURE p_sqlstate_wy2 IF EXISTS CASCADE;
DROP table t_sqlstate_errorlog_wy1 IF EXISTS CASCADE;
drop table t_sqlstate_emp_wy1 if exists cascade;

CREATE TABLE t_sqlstate_emp_wy1
(
employee_number INTEGER,
manager_employee_number INTEGER,
department_number INTEGER,
job_code INTEGER,
last_name CHAR(20) NOT NULL,
first_name VARCHAR(30) NOT NULL,
hire_date DATE NOT NULL,
birthdate DATE NOT NULL,
salary_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO t_sqlstate_emp_wy1 VALUES(1022,1003,401,412102,'Machado','Albert',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),32300);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1023,1017,501,512101,'Rabbit','Peter',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),26500);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1024,1005,403,432101,'Brown','Allen',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),43700);
INSERT INTO t_sqlstate_emp_wy1 VALUES(1024,1005,1025,432101,'Brown','Allen',TO_DATE('2018-11-15','yyyy-mm-dd'),TO_DATE('2018-11-15','yyyy-mm-dd'),43700);

CREATE TABLE t_sqlstate_errorlog_wy1(
  Sql_code INT,
  Sql_State CHAR(5)
);

CREATE PROCEDURE p_sqlstate_wy2 (IN deptnum_wy2 INTEGER, OUT lastnm_wy2
CHAR(20))
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
  INSERT INTO t_sqlstate_errorlog_wy1 VALUES (:SQLCODE, :SQLSTATE);
  END;
  SELECT last_name INTO :lastnm_wy2 FROM t_sqlstate_emp_wy1 WHERE
department_number = :deptnum_wy2;
  INSERT INTO t_sqlstate_errorlog_wy1 VALUES (:SQLCODE, :SQLSTATE);
END;
/

call p_sqlstate_wy2(1025,lastnm_wy2);

call lastnm_wy2;


DROP PROCEDURE new_customer IF EXISTS CASCADE;
drop table CUSTOMERS if exists;
drop table ADDRESSES if exists;

CREATE TABLE CUSTOMERS(
  id                  INT DEFAULT 0,
  first_name VARCHAR (50),
  last_name  VARCHAR (50),
  times         TIMESTAMP
);

CREATE TABLE ADDRESSES(
  id                 INT DEFAULT 0,
  temp_id            INT,
  address   VARCHAR (50)
);


CREATE PROCEDURE new_customer(IN firstname VARCHAR(50), IN lastname
VARCHAR(50), IN address VARCHAR(100))
MODIFIES SQL DATA
label_one: BEGIN ATOMIC
DECLARE temp_id INTEGER;
DECLARE UNDO HANDLER FOR SQLEXCEPTION;
INSERT INTO CUSTOMERS VALUES (DEFAULT, firstname, lastname,
CURRENT_TIMESTAMP);
SET temp_id = IDENTITY();
INSERT INTO ADDRESSES VALUES (DEFAULT, temp_id, address);
END
/

call new_customer('zhang','san','bj');

select * from CUSTOMERS;

select * from ADDRESSES;


DROP TABLE t_proc_wy_tab1 IF EXISTS CASCADE;
DROP TABLE t_proc_wy_notable IF EXISTS CASCADE;
CREATE TABLE t_proc_wy_tab1(id int);
CREATE TABLE t_proc_wy_notable(id int,name varchar(50));
DROP PROCEDURE sp_label_han1 IF EXISTS CASCADE;
CREATE PROCEDURE sp_label_han1(INOUT IOParam1 INTEGER,INOUT IOParam2
CHARACTER(100))
Loutermost: BEGIN
DECLARE Var1 INTEGER DEFAULT 10;
L1: BEGIN
DECLARE EXIT HANDLER FOR SQLSTATE '42000'
SET IOParam2 = 'Table does not exist in the outer block';
DECLARE EXIT HANDLER FOR SQLSTATE '23505'
L2: BEGIN
DECLARE EXIT HANDLER FOR SQLSTATE '23505'
SET IOParam2 = ' Duplicate row error ';
DECLARE EXIT HANDLER
FOR SQLSTATE '42000'
BEGIN
SET IOParam2 = 'Nonexistent table in inner block ';
INSERT INTO t_proc_wy_tab1 VALUES (IOParam1);
END;
INSERT INTO t_proc_wy_notable VALUES (IOParam1, IOParam2);
END L2;
SET IOParam1 = Var1;
INSERT INTO t_proc_wy_tab1 VALUES (IOParam1);
INSERT INTO t_proc_wy_tab1 VALUES (IOParam1);
END L1;
END Loutermost;
/
CALL sp_label_han1(IOParam1,IOParam2);

call IOParam1;

call IOParam2;
