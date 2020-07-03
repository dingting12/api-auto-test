--Description: 测试alter pallas table
--Date:         2020-07-03
--Author:       丁婷

set echo on

drop table T_PALLAS_ALTER_INT_002 if exists cascade;

CREATE TABLE T_PALLAS_ALTER_INT_002(
    EMPNO INT ,
    ENAME VARCHAR(20),
    JOB VARCHAR(20),
    MGR INT,
    HIREDATE DATE,
    SAL INT,
    COMM INT,
    DEPTNO INT
) engine pallas;

--测试int类型
alter table T_PALLAS_ALTER_INT_002 add column t1 int;

SELECT data_type from INFORMATION_SCHEMA.columns 
where table_name = 'TEST_ALTERPALLASTABLE_T1' and column_name = 'T1';

INSERT INTO T_PALLAS_ALTER_INT_002 VALUES 
(7521,'WARD','SALESMAN',7698,TO_DATE('1981-2-2','yyyy-mm-dd'),1250,500,30,1);

select count(*) from T_PALLAS_ALTER_INT_002;

alter table T_PALLAS_ALTER_INT_002 drop column t1;

SELECT data_type from INFORMATION_SCHEMA.columns 
where table_name = 'TEST_ALTERPALLASTABLE_T1' and column_name = 'T1';

ALTER TABLE T_PALLAS_ALTER_INT_002
ALTER COLUMN ENAME RENAME TO MNAME;

select count(*) from T_PALLAS_ALTER_INT_002;

ALTER TABLE T_PALLAS_ALTER_INT_002
ALTER COLUMN EMPNO SET DATA TYPE BIGINT;

SELECT data_type FROM information_schema.columns 
WHERE table_name = 'T_PALLAS_ALTER_INT_002' AND column_name = 'EMPNO';