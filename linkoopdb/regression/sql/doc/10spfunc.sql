--Description: doc 10 stored procedure and function
--Date：2020-07-13
--Author：满意

CREATE PROCEDURE test_value
(IN p1 INTEGER, OUT pmsg CHAR(30))
BEGIN
IF p1 > 0 THEN
SET pmsg = 'Positive value';
ELSEIF p1 = 0 THEN
SET pmsg = 'Zero Value';
ELSE
SET pmsg = 'Negative Value';
END IF;
END;

CALL test_value(3, pmsg);

CALL pmsg;

CREATE PROCEDURE call_test1 (IN V1 INTEGER, INOUT V2 INTEGER,
OUT V3 INTEGER)
BEGIN
SET V3 = V1 + 2;
SET V2 = V2 * V2;
END;

CALL call_test1 (3,4,V3);

CALL V3;

CALL call_test1 (3+2, 5*3, V3);

CALL V3;


DROP PROCEDURE test_call1 IF EXISTS CASCADE;

CREATE PROCEDURE test_call1(IN w1 INTEGER, OUT w2 INTEGER)
BEGIN
SET w2 = 100/w1 + 100;
END;

CALL test_call1(4,w2);

CALL w2;

DROP PROCEDURE test_call2 IF EXISTS CASCADE;

CREATE PROCEDURE test_call2(IN v1 INTEGER, OUT v2 INTEGER)
BEGIN
DECLARE a INTEGER;
SET a = v1 + 2;
CALL test_call1(:a,:v2);
END;

CALL test_call2(2,v2);

CALL v2;


DROP TYPE udt_wy_1 IF EXISTS CASCADE;

CREATE TYPE udt_wy_1 AS SMALLINT;

CREATE TYPE IF NOT EXISTS
tdv_type(col1 INT, col2 INT, col3 VARCHAR(200));

DROP TABLE tdv_table IF EXISTS CASCADE;

CREATE TABLE TDV_TABLE(col1 udt_wy_1, col2 tdv_type);

INSERT INTO TDV_TABLE VALUES(2,NEW tdv_type(9527, 9528, 'Teradata-syntax-test'));

DROP PROCEDURE test_declare_variable IF EXISTS CASCADE;

create procedure test_declare_variable(var1 udt_wy_1)
modifies sql data
block_1: begin atomic
declare var2 tdv_type default new tdv_type(9527, 9528, 'Teradata-syntax-test');
insert into tdv_table values(var1, var2);
end block_1;

call test_declare_variable(1);

call test_declare_variable(2);

call test_declare_variable(3);

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

call test_value(-1)
call test_value(1)
call test_value(0)

CREATE PROCEDURE sp_log ( INOUT p1 INTEGER)
BEGIN
WHILE p1 > 0 DO
SET p1 = p1 - 1;
END WHILE
END;

call sp_log(5)
call p1

--todo
CASE p1
WHEN 1 THEN SET pmsg = 'Positive value';
WHEN 2 THEN SET pmsg = 'Zero Value';
WHEN 3 THEN SET pmsg = 'Negative Value';
ELSE 0 END;