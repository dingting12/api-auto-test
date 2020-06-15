--    Description: 基本PSM
--    Date:         2020-06-10
--    Author:       丁婷

--259 T321-01 User-defined functions with no overloading
DROP FUNCTION if exists function_test_001;

CREATE FUNCTION function_test_001() RETURNS INTEGER
  RETURN 10;
/
  
call function_test_001();
  
DROP FUNCTION function_test_001;

--261 T321-03 Function invocation
DROP FUNCTION function_test_002;
drop table if exists T_invocation_test_001;

CREATE TABLE T_invocation_test_001 (
ID INTEGER NOT NULL PRIMARY KEY,
FIRSTNAME VARCHAR(255),
LASTNAME VARCHAR(255),
STREET VARCHAR(255),
CITY VARCHAR(255));

INSERT INTO T_invocation_test_001 VALUES
(1,'Susanne','King','366 - 20th Ave.','Olten'),
(2,'Anne','Miller','20 Upland Pl.','Lyon'),
(3,'Michael','Clancy','542 Upland Pl.','San Francisco'),
(40,'Susanne','Miller','440 - 20th Ave.','Dallas'),
(41,'Bill','King','546 College Av.','New York'),
(42,'Robert','Ott','503 Seventh Av.','Oslo'),
(43,'Susanne','Smith','2 Upland Pl.','Dallas'),
(44,'Sylvia','Ott','361 College Av.','New York'),
(45,'Janet','May','396 Seventh Av.','Oslo'),
(46,'Andrew','May','172 Seventh Av.','New York'),
(47,'Janet','Fuller','445 Upland Pl.','Dallas'),
(48,'Robert','White','549 Seventh Av.','San Francisco'),
(49,'George','Fuller','534 - 20th Ave.','Olten');

CREATE Function function_test_002( in x INT)
  returns table(i INT, v VARCHAR(100))
  READS SQL DATA
  begin atomic
    declare y int;
    set y= x;
    return TABLE(select id, firstname from T_invocation_test_001 where id > y);
  end;
/

call function_test_002(10);


--262 T321-04 CALL statement
call trim('   XXX   ');

--2558 Refactor UDF handling
drop jar 'testUdf-0.0.1-SNAPSHOT.jar';

add jar 'linkoopdb/smoke/sql/testUdf-0.0.1-SNAPSHOT.jar' not check exists;

drop function if exists function_test_bigint;
drop table if exists db_udf_bigint;

CREATE FUNCTION function_test_bigint(price bigint) RETURNS bigint
 LANGUAGE JAVA DETERMINISTIC NO SQL
 EXTERNAL NAME 'CLASSPATH:com.datapps.dbudf.testdbudf.UDFbigint';
/
 
CREATE TABLE db_udf_bigint(price bigint);
 
 INSERT INTO db_udf_bigint VALUES
(18902),
(1032);

select function_test_bigint(price) from  db_udf_bigint ;
