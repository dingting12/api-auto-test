--oracle dblink sql

connect linkoopdb/123456@jdbc:oracle:thin:@192.168.1.72:1521:xe

--��¼ִ��ʱ��
set timing on
--���ؽ��
set termout on
--�Ƿ��ӡִ�е�SQL���
set ECHO ON


--------------------------------------------------------
--user_name

---����

----Ӣ����������Сд
DROP USER u_Test_DBlink1;

CREATE USER u_Test_DBlink1 IDENTIFIED BY 123456;

GRANT dba TO u_Test_DBlink1;

DROP TABLE u_Test_DBlink1.t_dblink_wy1;

CREATE TABLE u_Test_DBlink1.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_Test_DBlink1.t_dblink_wy1 VALUES(1,'��������һ��');

SELECT * FROM u_Test_DBlink1.t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='U_TEST_DBLINK1';

DROP USER "u_Test_DBlink1";

CREATE USER "u_Test_DBlink1" IDENTIFIED BY 123456;

GRANT dba TO "u_Test_DBlink1";

DROP TABLE "u_Test_DBlink1".t_dblink_wy1;

CREATE TABLE "u_Test_DBlink1".t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO "u_Test_DBlink1".t_dblink_wy1 VALUES(1,'��������һ��');

SELECT * FROM "u_Test_DBlink1".t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='u_Test_DBlink1';

----��������
DROP USER ������1��;

CREATE USER ������1�� IDENTIFIED BY 123456;

GRANT dba TO ������1��;

DROP TABLE ������1��.t_dblink_wy1;

CREATE TABLE ������1��.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO ������1��.t_dblink_wy1 VALUES(1,'��������һ��');

SELECT * FROM ������1��.t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='������1��';

DROP USER "�������������";

CREATE USER "�������������" IDENTIFIED BY 123456;

GRANT dba TO "�������������";

DROP TABLE "�������������".t_dblink_wy1;

CREATE TABLE "�������������".t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO "�������������".t_dblink_wy1 VALUES(1,'��������һ��');

SELECT * FROM "�������������".t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='�������������';

----��Ӣ�Ļ�ϼ������ַ��Ӵ�Сд
DROP USER "U_DBlink@!@$%#(*������";

CREATE USER "U_DBlink@!@$%#(*������" IDENTIFIED BY 123456;

GRANT dba TO "U_DBlink@!@$%#(*������";

DROP TABLE "U_DBlink@!@$%#(*������".t_dblink_wy1;

CREATE TABLE "U_DBlink@!@$%#(*������".t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO "U_DBlink@!@$%#(*������".t_dblink_wy1 VALUES(1,'��������һ��');

SELECT * FROM "U_DBlink@!@$%#(*������".t_dblink_wy1 ORDER BY id;

SELECT username from dba_users WHERE username='U_DBlink@!@$%#(*������';

---Ȩ��

----�û���Զ�̷���Ȩ��
DROP USER u_dblink_permission1;

CREATE USER u_dblink_permission1 IDENTIFIED BY 123456;

GRANT CREATE SESSION TO u_dblink_permission1;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION1'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION1'); 

----�û��д�����ɾ�����޸� table��Ȩ��
DROP USER u_dblink_permission2;

CREATE USER u_dblink_permission2 IDENTIFIED BY 123456;

GRANT CREATE TABLE TO u_dblink_permission2;

GRANT DROP ANY TABLE TO u_dblink_permission2;

GRANT ALTER ANY TABLE TO u_dblink_permission2;

DROP TABLE u_dblink_permission2.t_dblink_wy1;

CREATE TABLE u_dblink_permission2.t_dblink_wy1(id INT,name VARCHAR(200));

INSERT INTO u_dblink_permission2.t_dblink_wy1 VALUES(1,'��������һ��');

SELECT * FROM u_dblink_permission2.t_dblink_wy1 ORDER BY id;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION2'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION2'); 

DROP USER u_dblink_permission3;

CREATE USER u_dblink_permission3 IDENTIFIED BY 123456;

GRANT CREATE ANY TABLE TO u_dblink_permission3;

GRANT DROP ANY TABLE TO u_dblink_permission3;

GRANT ALTER ANY TABLE TO u_dblink_permission3;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION3'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION3'); 

----�û��д�����ɾ��view��Ȩ��
DROP USER u_dblink_permission4;

CREATE USER u_dblink_permission4 IDENTIFIED BY 123456;

GRANT CREATE VIEW TO u_dblink_permission4;

GRANT DROP ANY VIEW TO u_dblink_permission4;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION4'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION4'); 

DROP USER u_dblink_permission5;

CREATE USER u_dblink_permission5 IDENTIFIED BY 123456;

GRANT CREATE ANY VIEW TO u_dblink_permission5;

GRANT DROP ANY VIEW TO u_dblink_permission5;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION5'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION5'); 

----�û��д���proc��Ȩ��
DROP USER u_dblink_permission6;

CREATE USER u_dblink_permission6 IDENTIFIED BY 123456;

GRANT CREATE PROCEDURE TO u_dblink_permission6;

GRANT DROP ANY PROCEDURE TO u_dblink_permission6;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION6'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION6'); 

DROP USER u_dblink_permission7;

CREATE USER u_dblink_permission7 IDENTIFIED BY 123456;

GRANT CREATE ANY PROCEDURE TO u_dblink_permission7;

GRANT DROP ANY PROCEDURE TO u_dblink_permission7;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION7'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION7'); 

----�û��в�ѯ��Ȩ��
DROP USER u_dblink_permission8;

CREATE USER u_dblink_permission8 IDENTIFIED BY 123456;

GRANT SELECT ANY TABLE TO u_dblink_permission8;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION8'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION8'); 

----�û��в����Ȩ��
DROP USER u_dblink_permission9;

CREATE USER u_dblink_permission9 IDENTIFIED BY 123456;

GRANT INSERT ANY TABLE TO u_dblink_permission9;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION9'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION9'); 

----�û��и��µ�Ȩ��
DROP USER u_dblink_permission10;

CREATE USER u_dblink_permission10 IDENTIFIED BY 123456;

GRANT UPDATE ANY TABLE TO u_dblink_permission10;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION10'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION10'); 

----�û���ɾ����Ȩ��
DROP USER u_dblink_permission11;

CREATE USER u_dblink_permission11 IDENTIFIED BY 123456;

GRANT DELETE ANY TABLE TO u_dblink_permission11;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION11'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION11'); 

----�û����κ�Ȩ��
DROP USER u_dblink_permission;

CREATE USER u_dblink_permission IDENTIFIED BY 123456;

select privilege from dba_sys_privs where grantee='U_DBLINK_PERMISSION'  
union  
select privilege from dba_sys_privs where grantee in (select granted_role from dba_role_privs where grantee='U_DBLINK_PERMISSION'); 


--password

---Ӣ�ļ���Сд
DROP USER u_dblink_password1;

CREATE USER u_dblink_password1 IDENTIFIED BY csHIKHBNUgdjK;

GRANT dba TO u_dblink_password1;

---����
DROP USER u_dblink_password2;

CREATE USER u_dblink_password2 IDENTIFIED BY ����һ������;

GRANT dba TO u_dblink_password2;

---��Ӣ�Ļ�ϼ������ַ��Ӵ�Сд
DROP USER u_dblink_password3;

CREATE USER u_dblink_password3 IDENTIFIED BY "^&*SDfbj%^$&^���ն�1278_84";

GRANT dba TO u_dblink_password3;



--����
CREATE USER u_dblink_grammar_cover identified BY 123456;

GRANT dba TO u_dblink_grammar_cover;

DROP TABLE u_dblink_grammar_cover.t_dblink_datatype1;

CREATE TABLE u_dblink_grammar_cover.t_dblink_datatype1(id INT,tchar CHAR(200),tvarchar2 VARCHAR2(200),ttimestamp1 TIMESTAMP,
                                tnumber NUMBER(10,2),tdate DATE,tlong LONG,tfloat FLOAT,
                                traw RAW(100),tblob BLOB,ttimestamp2 TIMESTAMP(6),
                                tclob CLOB,tnclob NCLOB,tbinary_float BINARY_FLOAT,tbinary_double BINARY_DOUBLE,
                                ttimestamp3 TIMESTAMP WITH TIME ZONE,ttimestamp4 TIMESTAMP WITH LOCAL TIME ZONE,
                                trowid ROWID,turowid UROWID);

INSERT INTO u_dblink_grammar_cover.t_dblink_datatype1 VALUES(1,'cdsfdfd','����������bdjs',TIMESTAMP '2015-03-04 01:30:59',
                                                             23143.54,DATE '2015-07-02',234243434,23245.6565,
                                                             utl_raw.cast_to_raw('This is a rawtype test!'),utl_raw.cast_to_raw('This is a rawtype test!'),TIMESTAMP '2020-01-01 12:12:12',
                                                             'cdcdds','vfgfgfg',1212.232,4343.454,
                                                             TO_TIMESTAMP_TZ('2020-01-01 11:00:00 -05:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),TO_TIMESTAMP_TZ('1999-12-12 12:12:12 +08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);           
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype1 VALUES(2,'xcdbfhjdm','�ϳ�������xjkl',TIMESTAMP '2020-12-23 21:04:01',
                                                             5465.23,DATE '2020-12-02',4565565,56.7676,
                                                             utl_raw.cast_to_raw('hello world'),utl_raw.cast_to_raw('����һ�仰'),TIMESTAMP '2020-05-29 21:21:21',
                                                             '��˵ʲô','��������',454.656,8965.65,
                                                             TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),TO_TIMESTAMP_TZ('2020-01-01 11:00:00 -08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);                                                                   
                                
SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype1 ORDER BY id;

DROP TABLE u_dblink_grammar_cover.t_dblink_datatype2;

CREATE TABLE u_dblink_grammar_cover.t_dblink_datatype2(id INT,tchar CHAR(200),tvarchar2 VARCHAR2(200),ttimestamp1 TIMESTAMP,
                                tnumber NUMBER(10,2),tdate DATE,tfloat FLOAT,
                                traw RAW(100),tlongraw LONG RAW,tblob BLOB,ttimestamp2 TIMESTAMP(6),
                                tclob CLOB,tnclob NCLOB,tbinary_float BINARY_FLOAT,tbinary_double BINARY_DOUBLE,
                                ttimestamp3 TIMESTAMP WITH TIME ZONE,ttimestamp4 TIMESTAMP WITH LOCAL TIME ZONE,
                                trowid ROWID,turowid UROWID);
                                
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype2 VALUES(1,'cdsfdfd','����������bdjs',TIMESTAMP '2015-03-04 01:30:59',
                                                             23143.54,DATE '2015-07-02',23245.6565,
                                                             utl_raw.cast_to_raw('This is a rawtype test!'),utl_raw.cast_to_raw('121212'),utl_raw.cast_to_raw('This is a rawtype test!'),TIMESTAMP '2020-01-01 12:12:12',
                                                             'cdcdds','vfcvfgfgd',1212.232,4343.454,
                                                             TO_TIMESTAMP_TZ('1998-02-26 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);    
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype2 VALUES(2,'xcdbfhjdm','�ϳ�������xjkl',TIMESTAMP '2020-12-23 21:04:01',
                                                             5465.23,DATE '2020-12-02',56.7676,
                                                             utl_raw.cast_to_raw('hello world'),utl_raw.cast_to_raw('124545'),utl_raw.cast_to_raw('����һ�仰'),TIMESTAMP '2020-05-29 21:21:21',
                                                             '��˵ʲô','��������',454.656,8965.65,
                                                             TO_TIMESTAMP_TZ('2030-09-01 01:00:59 +09:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),TO_TIMESTAMP_TZ('2010-05-30 08:45:31 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);                            

SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype2 ORDER BY id;               

---ldb֧�ֵ��ֶ�                                
DROP TABLE u_dblink_grammar_cover.t_dblink_datatype3;

CREATE TABLE u_dblink_grammar_cover.t_dblink_datatype3(id INT,tchar CHAR(200),tvarchar2 VARCHAR2(200),ttimestamp1 TIMESTAMP,
                                tnumber NUMBER(10,2),tdate DATE,tlong LONG,tfloat FLOAT,tblob BLOB,
                                ttimestamp2 TIMESTAMP(6),tclob CLOB);
                                
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype3 VALUES(1,'����','��һ������',TIMESTAMP '1990-01-01 23:59:59',
                                                             11232.43,DATE '1987-12-01',1232334,243.454,UTL_RAW.CAST_TO_RAW('������'),
                                                             TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'��һ����'); 
                                                             
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype3 VALUES(2,'����','��һ���������',TIMESTAMP '2000-01-01 23:59:59',
                                                             1354232.21,DATE '2005-07-01',120554,623.225,UTL_RAW.CAST_TO_RAW('������'),
                                                             TO_TIMESTAMP_TZ('1994-04-23 06:01:00 +08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'������֮�Ƕ���');                                                              
                                
SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype3 ORDER BY id;            

---ldb��֧�ֵ��ֶ�                                
DROP TABLE u_dblink_grammar_cover.t_dblink_datatype4;

CREATE TABLE u_dblink_grammar_cover.t_dblink_datatype4(id INT,traw RAW(100),tlongraw LONG RAW,tnclob NCLOB,
                                tbinary_float BINARY_FLOAT,tbinary_double BINARY_DOUBLE,
                                ttimestamp3 TIMESTAMP WITH TIME ZONE,ttimestamp4 TIMESTAMP WITH LOCAL TIME ZONE,
                                trowid ROWID,turowid UROWID);
                                
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype4 VALUES(1,UTL_RAW.CAST_TO_RAW('ʮ��������ãã����˼����������'),UTL_RAW.CAST_TO_RAW('�����֣����پƣ����Ǵ�ɫ��ǽ��'),'�ֶ�����',
                                                             232.343,4565.767,TO_TIMESTAMP_TZ('2039-01-31 12:59:59 +12:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),
                                                             TO_TIMESTAMP_TZ('2039-01-31 12:59:59 -08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);
                                                             
INSERT INTO u_dblink_grammar_cover.t_dblink_datatype4 VALUES(2,UTL_RAW.CAST_TO_RAW('ϲ�������Ц��'),UTL_RAW.CAST_TO_RAW('����������ҹ��'),'��Ȫ',
                                                             232.343,4565.767,TO_TIMESTAMP_TZ('2039-01-31 12:59:59 +12:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),
                                                             TO_TIMESTAMP_TZ('2039-01-31 12:59:59 -08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),NULL,NULL);                                                             
                                
SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype4 ORDER BY id;

---�����ĵı�
DROP TABLE u_dblink_grammar_cover.t_dblink_��������5;

CREATE TABLE u_dblink_grammar_cover.t_dblink_��������5(��� INT,����1 CHAR(200),����2 VARCHAR2(200),ʱ���1 TIMESTAMP,
                                ����1 NUMBER(10,2),����1 DATE,����2 LONG,����3 FLOAT,blob����1 BLOB,
                                ʱ���2 TIMESTAMP(6),clob����1 CLOB);
                                
INSERT INTO u_dblink_grammar_cover.t_dblink_��������5 VALUES(1,'����','��һ������',TIMESTAMP '1990-01-01 23:59:59',
                                                             11232.43,DATE '1987-12-01',1232334,243.454,UTL_RAW.CAST_TO_RAW('������'),
                                                             TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'��һ����'); 
                                                             
INSERT INTO u_dblink_grammar_cover.t_dblink_��������5 VALUES(2,'����','��һ���������',TIMESTAMP '2000-01-01 23:59:59',
                                                             1354232.21,DATE '2005-07-01',120554,623.225,UTL_RAW.CAST_TO_RAW('������'),
                                                             TO_TIMESTAMP_TZ('1994-04-23 06:01:00 +08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'������֮�Ƕ���');                                 

SELECT * FROM u_dblink_grammar_cover.t_dblink_��������5 ORDER BY ���;     

---��Ӣ�ļӴ�Сд�ı�
DROP TABLE u_dblink_grammar_cover."t_DBlink_��������6";

CREATE TABLE u_dblink_grammar_cover."t_DBlink_��������6"("���HJK_ds" INT,"��dshjkHJBSD��1" CHAR(200),"��VBNBfdnk��1" VARCHAR2(200),"ʱ���1cdmGHF" TIMESTAMP,
                                "��bvn_BJH��1" NUMBER(10,2),"��vcnnm_BH��1" DATE,"��QZC_BVB��2" LONG,"��cnmv_HJ��3" FLOAT,"blobVYTsdv����1" BLOB,
                                "ʱ��pmc_BH��2" TIMESTAMP(6),"clVGHR_gvhob����1" CLOB);   
                                
INSERT INTO u_dblink_grammar_cover."t_DBlink_��������6" VALUES(1,'����','��һ������',TIMESTAMP '1990-01-01 23:59:59',
                                                             11232.43,DATE '1987-12-01',1232334,243.454,UTL_RAW.CAST_TO_RAW('������'),
                                                             TO_TIMESTAMP_TZ('2006-06-01 06:01:00 +06:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'��һ����'); 
                                                             
INSERT INTO u_dblink_grammar_cover."t_DBlink_��������6" VALUES(2,'����','��һ���������',TIMESTAMP '2000-01-01 23:59:59',
                                                             1354232.21,DATE '2005-07-01',120554,623.225,UTL_RAW.CAST_TO_RAW('������'),
                                                             TO_TIMESTAMP_TZ('1994-04-23 06:01:00 +08:00','YYYY-MM-DD HH:MI:SS TZH:TZM'),'������֮�Ƕ���');                                 
                                
SELECT * FROM u_dblink_grammar_cover."t_DBlink_��������6" ORDER BY "���HJK_ds";


--������ͼ

---�����������͵���ͼ
DROP VIEW u_dblink_grammar_cover.v_dblink_datatype1;

CREATE VIEW u_dblink_grammar_cover.v_dblink_datatype1
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype1 ORDER BY id;

SELECT * FROM u_dblink_grammar_cover.v_dblink_datatype1 ORDER BY id;

DROP VIEW u_dblink_grammar_cover.v_dblink_datatype2;

CREATE VIEW u_dblink_grammar_cover.v_dblink_datatype2
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype2 ORDER BY id;

SELECT * FROM u_dblink_grammar_cover.v_dblink_datatype2 ORDER BY id;

---ldb֧�ֵ��������͵���ͼ
DROP VIEW u_dblink_grammar_cover.v_dblink_datatype3;

CREATE VIEW u_dblink_grammar_cover.v_dblink_datatype3
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype3 ORDER BY id;

SELECT * FROM u_dblink_grammar_cover.v_dblink_datatype3 ORDER BY id;

---ldb��֧�ֵ��������͵���ͼ
DROP VIEW u_dblink_grammar_cover.v_dblink_datatype4;

CREATE VIEW u_dblink_grammar_cover.v_dblink_datatype4
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_datatype4 ORDER BY id;

SELECT * FROM u_dblink_grammar_cover.v_dblink_datatype4 ORDER BY id;

---�����ĵ���ͼ
DROP VIEW u_dblink_grammar_cover.v_dblink_��������5;

CREATE VIEW u_dblink_grammar_cover.v_dblink_��������5
AS SELECT * FROM u_dblink_grammar_cover.t_dblink_��������5 ORDER BY ���;

SELECT * FROM u_dblink_grammar_cover.v_dblink_��������5 ORDER BY ���;

---��Ӣ�ļӴ�Сд����ͼ
DROP VIEW u_dblink_grammar_cover."v_DBlink_��������6";

CREATE VIEW u_dblink_grammar_cover."v_DBlink_��������6"
AS SELECT * FROM u_dblink_grammar_cover."t_DBlink_��������6" ORDER BY "���HJK_ds";

SELECT * FROM u_dblink_grammar_cover."v_DBlink_��������6" ORDER BY "���HJK_ds";

--���join����ͼ
DROP VIEW "V_������_7";

CREATE VIEW "V_������_7" AS 
SELECT a.���,b."���HJK_ds",a.����1,b."��QZC_BVB��2",b."��VBNBfdnk��1",a.ʱ���1 FROM u_dblink_grammar_cover.t_dblink_��������5 a
LEFT JOIN u_dblink_grammar_cover."t_DBlink_��������6" b
ON a.���=b."���HJK_ds" OR a.����2=b."��VBNBfdnk��1"
WHERE a.����3>0 OR b."��bvn_BJH��1" BETWEEN 0 AND 100;

SELECT * FROM "V_������_7" ORDER BY "���HJK_ds";

--�Ӳ�ѯ����ͼ
DROP VIEW v_�Ӳ�ѯ_8;

CREATE VIEW v_�Ӳ�ѯ_8 AS 
SELECT "���HJK_ds","ʱ���1cdmGHF" FROM u_dblink_grammar_cover."t_DBlink_��������6"
WHERE "��bvn_BJH��1">=(SELECT ����1 FROM u_dblink_grammar_cover.t_dblink_��������5 WHERE ����1 LIKE '%��%');

SELECT * FROM v_�Ӳ�ѯ_8 ORDER BY "ʱ���1cdmGHF";


--����proc
DROP PROCEDURE u_dblink_grammar_cover.p_dblink_1;

CREATE OR REPLACE PROCEDURE u_dblink_grammar_cover.p_dblink_1
(
--�������롢�������--
num_A IN INTEGER,
num_B IN INTEGER,
numType IN INTEGER,
num_C OUT INTEGER
)
AS
--�������--
 -- numCount integer;
 -- numStr varchar(20);  
BEGIN   
     --�жϼ�������--
     IF numType=1 THEN
        num_C := num_A + num_B;
     ELSIF numType=2 THEN
        num_C := num_A - num_B;
     ELSIF numType=3 THEN
        num_C := num_A * num_B; 
     ELSIF numType=4 THEN
        num_C := num_A / num_B; 
     ELSE
     --��������
       dbms_output.put_line('��������');
     END IF;
END;

DECLARE num_C INTEGER;
BEGIN
   --���ô洢����---
   u_dblink_grammar_cover.p_dblink_1(3,4,3,num_C);
   dbms_output.put_line('��������'|| num_C );
END;


DROP FUNCTION u_dblink_grammar_cover.f_dblink_1;

CREATE OR REPLACE FUNCTION u_dblink_grammar_cover.f_dblink_1
RETURN VARCHAR2
IS
BEGIN
  RETURN TO_CHAR(sysdate,
    'YYYY"��"MM"��"DD"��"HH24"ʱ"MI"��"SS"��"');
END;



--Լ��

---����Լ��
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_1;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_1(id NUMBER(6),name VARCHAR2(200),sal NUMERIC(10,2),birthday DATE,
                                                          CONSTRAINT t1_id_name_pk PRIMARY KEY(id,name));
                                                          
INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_1 VALUES(1,'����̩',213.43,DATE '1990-01-01');

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_1 VALUES(2,'С��',4545.54,DATE '1991-12-23');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_1 ORDER BY id;

---�ǿ�Լ��
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_2;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_2(id NUMBER(6),name VARCHAR2(200),sal NUMERIC(10,2),birthday DATE CONSTRAINT t2_birthday_notnull NOT NULL);

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_2 VALUES(1,'����˹̹',354222.45,DATE '2020-01-03');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_2 ORDER BY id;

---uniqueԼ��
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_3;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_3(id NUMBER(6),name VARCHAR2(200),sal NUMERIC(10,2),birthday DATE,CONSTRAINT t3_id_unique UNIQUE(id));

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_3 VALUES(1,'���ʿ�',565.67,DATE '1994-11-12');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_3 ORDER BY id;

---foreign keyԼ��
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_4;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_4(eid NUMBER(6),ename VARCHAR2(200),sal NUMERIC(6,2),
                                                          CONSTRAINT t4_eid_pk PRIMARY KEY(eid));

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_4 VALUES(1,'������ѧ',2434.65);

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_4 ORDER BY eid;

DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_5;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_5(did NUMBER(6),eid NUMBER(6),dname VARCHAR2(200),
                                                          CONSTRAINT t5_fk FOREIGN KEY(eid) REFERENCES u_dblink_grammar_cover.t_dblink_constraint_4(eid)
                                                          ON DELETE CASCADE);
                                                          
INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_5 VALUES(1,1,'����');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_5 ORDER BY did;

---checkԼ��
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_6;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_6(id INT,name VARCHAR2(200),sex VARCHAR2(5));

ALTER TABLE u_dblink_grammar_cover.t_dblink_constraint_6
ADD CONSTRAINT t6_check CHECK(sex IN ('��','Ů'));

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_6 VALUES(1,'����','��');

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_6 VALUES(2,'ս����','Ů');

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_6 VALUES(3,'������','δ֪');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_6 ORDER BY id;

---����
DROP TABLE u_dblink_grammar_cover.t_dblink_constraint_7;

CREATE TABLE u_dblink_grammar_cover.t_dblink_constraint_7(id INT,name VARCHAR2(100),sal FLOAT,birthday DATE);

CREATE INDEX index_t7_id ON u_dblink_grammar_cover.t_dblink_constraint_7(id,name);

INSERT INTO u_dblink_grammar_cover.t_dblink_constraint_7 VALUES(1,'ʱ��Ĺ�����',674554.45443,DATE '1980-12-11');

SELECT * FROM u_dblink_grammar_cover.t_dblink_constraint_7 ORDER BY id;

select i.index_name,
       i.index_type,
       i.table_owner,
       i.table_name,
       i.uniqueness,
       i.tablespace_name,
       c.column_name,
       c.column_position,
       c.column_length
from user_indexes i, user_ind_columns c
where i.index_name = c.index_name AND i.table_name='T_DBLINK_CONSTRAINT_7' AND i.table_owner='U_DBLINK_GRAMMAR_COVER';


--��Сд����
DROP USER u_case_sensitivity;

CREATE USER u_case_sensitivity IDENTIFIED BY 123456;

GRANT dba TO u_case_sensitivity;

DROP TABLE u_case_sensitivity."T_DBLINK_SENSITIVITY1";

CREATE TABLE u_case_sensitivity."T_DBLINK_SENSITIVITY1"(id INT,name VARCHAR2(200));

INSERT INTO u_case_sensitivity."T_DBLINK_SENSITIVITY1" VALUES(1,'vcvcv');

SELECT * FROM u_case_sensitivity."T_DBLINK_SENSITIVITY1" ORDER BY id;

DROP TABLE u_case_sensitivity."t_dblink_sensitivity1";

CREATE TABLE u_case_sensitivity."t_dblink_sensitivity1"("id" INT,"name" VARCHAR2(200));

INSERT INTO u_case_sensitivity."t_dblink_sensitivity1" VALUES(1,'vcvcv');

SELECT * FROM u_case_sensitivity."t_dblink_sensitivity1" ORDER BY "id";