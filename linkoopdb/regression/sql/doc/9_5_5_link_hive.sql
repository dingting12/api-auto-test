--Description: doc 9.5.5 link hive
--Date：2020-07-14
--Author：丁婷

drop user user_hive_001 if exists cascade; 

CREATE USER user_hive_001 PASSWORD '123456';

GRANT CREATE_SCHEMA TO user_hive_001;

grant change_authorization to user_hive_001; 

connect user user_hive_001 password '123456';


CREATE DATABASE LINK HIVE_LINK_DOC_001 CONNECT TO 'hive' IDENTIFIED BY 'hive'
USING 'hive' PROPERTIES ('maxActive':'5','database':'default');

RELOAD DATABASE LINK HIVE_LINK_DOC_001;

DROP DATABASE LINK HIVE_LINK_DOC_001 CASCADE;

CREATE DATABASE LINK HIVE_LINK_DOC_001 CONNECT TO 'hive' IDENTIFIED BY 'hive'
USING 'hive' PROPERTIES ('maxActive':'5','database':'default');

ALTER DATABASE LINK HIVE_LINK_DOC_001 CONNECT TO 'hive' IDENTIFIED BY 'hive' USING
'hive' PROPERTIES ('maxActive':'5','database':'default');


drop table HIVE_LINK_DOC_001.T_TEST_HIVE_001 if exists cascade;

CREATE TABLE HIVE_LINK_DOC_001.T_TEST_HIVE_001 (
ID INT,
NAME VARCHAR(20)
);

INSERT INTO HIVE_LINK_DOC_001.T_TEST_HIVE_001 VALUES (1,'zs');

SELECT * FROM HIVE_LINK_DOC_001.T_TEST_HIVE_001; 

drop VIEW HIVE_LINK_DOC_001.T_VIEW_HIVE_001 if exists;

CREATE VIEW HIVE_LINK_DOC_001.T_VIEW_HIVE_001 AS SELECT * from HIVE_LINK_DOC_001.T_TEST_HIVE_001; 

SELECT * FROM HIVE_LINK_DOC_001.T_VIEW_HIVE_001;






connect user admin password '123456';

drop user user_hive_002 if exists cascade;

drop DATABASE LINK HIVE_LINK_DOC_002 if exists cascade;

CREATE USER user_hive_002 PASSWORD '123456';

CREATE DATABASE LINK HIVE_LINK_DOC_002 CONNECT TO 'test' IDENTIFIED BY
'123456' USING 'jdbc:mysql://192.168.1.72:3306/test' PROPERTIES
('caseSensitive':'true');

DROP table HIVE_LINK_DOC_002.T_TEST_HIVE_002 if exists;

CREATE TABLE HIVE_LINK_DOC_002.T_TEST_HIVE_002 (
ID INT,
NAME VARCHAR(20)
);


GRANT INSERT,SELECT,UPDATE,DELETE ON HIVE_LINK_DOC_002.T_TEST_HIVE_002 TO user_hive_002;

grant change_authorization to user_hive_002; 

connect user user_hive_002 password '123456';

insert into HIVE_LINK_DOC_002.T_TEST_HIVE_002 values(1,'zhangsan');

UPDATE HIVE_LINK_DOC_002.T_TEST_HIVE_002 SET ID = 2;

select * from HIVE_LINK_DOC_002.T_TEST_HIVE_002;

delete from HIVE_LINK_DOC_002.T_TEST_HIVE_002;

select * from HIVE_LINK_DOC_002.T_TEST_HIVE_002;

