--    Description: 测试视图
--    Date:         2020-06-10
--    Author:       丁婷

-- 测试257 F081 UNION and EXCEPT in views
drop view v_view_test_001 if exists cascade;
drop view v_view_test_002 if exists cascade;
drop TABLE T_View_table_001 if exists cascade;


CREATE TABLE T_View_table_001 (
EMPNO INT,
ENAME VARCHAR(20),
JOB VARCHAR(20),
MGR INT,
HIREDATE DATE,
SAL INT,
COMM INT,
DEPTNO INT
);

INSERT INTO T_View_table_001 VALUES
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


create view v_view_test_001 as select * from T_View_table_001 order by empno;

create view v_view_test_002 as select * from T_View_table_001 where sal > 1500 order by empno;

select count(*) from (
select * from v_view_test_001 union select * from v_view_test_002);

select count(*) from (
select * from v_view_test_001 except select * from v_view_test_002);


-- 测试251 F131-01 WHERE, GROUP BY, and HAVING clauses supported in queries with grouped views
drop view v_view_test_003 if exists cascade;
drop table T_View_table_003 if exists cascade;
drop table T_View_table_004 if exists cascade;
drop table T_View_table_005 if exists cascade;
drop table T_View_table_006 if exists cascade;
drop table T_View_table_007 if exists cascade;

create table T_View_table_003(
sno varchar(10),
sname varchar(20),
sage int,
ssex varchar(5)
);

insert into T_View_table_003 values 
('s001','张三',23,'男'),
('s002','李四',23,'男'),
('s003','吴鹏',25,'男'),
('s004','琴沁',20,'女'),
('s005','王丽',20,'女'),
('s006','李波',21,'男'),
('s007','刘玉',21,'男'),
('s008','萧蓉',21,'女'),
('s009','陈萧晓',23,'女'),
('s010','陈美',22,'女');

create table T_View_table_004(
tno varchar(10),
tname varchar(20)
);

insert into T_View_table_004 values ('t001', '刘阳'),
('t002', '谌燕'),
('t003', '胡明星');

create table T_View_table_005(
cno varchar(10),
cname varchar(20),
tno varchar(20)
);

insert into T_View_table_005 values ('c001','J2SE','t002'),
('c002','Java Web','t002'),
('c003','SSH','t001'),
('c004','Oracle','t001'),
('c005','SQL SERVER 2005','t003'),
('c006','C#','t003'),
('c007','JavaScript','t002'),
('c008','DIV+CSS','t001'),
('c009','PHP','t003'),
('c010','EJB3.0','t002');

create table T_View_table_006(
sno varchar(10),
cno varchar(10),
score int
);

insert into T_View_table_006 values ('s001','c001',78.9),
('s002','c001',80.9),
('s003','c001',81.9),
('s004','c001',60.9),
('s001','c002',82.9),
('s002','c002',72.9),
('s003','c002',81.9),
('s001','c003','59');

CREATE VIEW v_view_test_003
AS
SELECT MAX(t.tno) AS new_tno, MAX(t.tname) AS new_tname
	, MAX(c.cno) AS new_cno1, MAX(c.cname) AS new_cname
	, c.cno AS new_cno2, AVG(score) AS new_avg
FROM T_View_table_006 sc, T_View_table_005 c, T_View_table_004 t
WHERE sc.cno = c.cno
	AND c.tno = t.tno
GROUP BY c.cno
HAVING COUNT(*) >= 1;

-- F131-02 Multiple tables supported in queries with grouped views
drop view v_view_test_004 if exists cascade;

CREATE VIEW v_view_test_004
AS
SELECT sc.sno, st.sname, COUNT(sc.cno) AS new_count
FROM T_View_table_003 st, T_View_table_006 sc
WHERE sc.sno = st.sno
GROUP BY sc.sno, st.sname;

select OCTET_LENGTH(sname) from v_view_test_004;


-- F131-03 Set functions supported in queries with grouped views 
select count(distinct new_count) from v_view_test_004;

-- F131-04 Subqueries with GROUP BY and HAVING clauses and grouped views
drop view v_view_sel_001 if exists cascade;
drop TABLE T_sel_001 if exists cascade;
drop TABLE T_sel_003 if exists cascade;

create table T_sel_001(
sno varchar(10),
sname varchar(20),
sage int,
ssex varchar(5)
);

create table T_sel_003(
sno varchar(10),
sname varchar(20),
sage int,
sschool varchar(20)
);

insert into T_sel_001 values
('s002','李四',23,'男'),
('s003','吴鹏',25,'男'),
('s004','琴沁',20,'女'),
('s005','王丽',20,'女'),
('s006','李波',21,'男'),
('s007','刘玉',21,'男'),
('s008','萧蓉',21,'女'),
('s009','陈萧晓',23,'女'),
('s010','陈美',22,'女');

insert into T_sel_003 values
('s002','李四',23,'school1'),
('s003','吴鹏',22,'school3'),
('s004','琴沁',20,'school3'),
('s005','王丽',20,'school1'),
('s006','李波',21,'school2'),
('s007','刘玉',21,'school1'),
('s008','萧蓉',21,'school3'),
('s009','陈萧晓',23,'school1'),
('s010','陈美',22,'女school1');

create view v_view_sel_001 AS select sage,count(sname) as count1 from T_sel_001  group by sage;

SELECT *
FROM (
	SELECT *
	FROM v_view_sel_001
	WHERE (sage, count1) IN (
		SELECT sage, COUNT(sage)
		FROM T_sel_003
		GROUP BY sage
		HAVING COUNT(sage) > 1
	)
);

drop view v_view_sel_001 if exists cascade;
drop TABLE T_sel_001 if exists cascade;
drop TABLE T_sel_003 if exists cascade;

-- F131-05 Single row SELECT with GROUP BY and HAVING clauses and grouped views
CREATE VIEW v_view_test_005
AS
SELECT st.sno, st.sname, COUNT(sc.cno) AS new_count
FROM T_View_table_003 st
	LEFT JOIN T_View_table_006 sc ON st.sno = sc.sno
GROUP BY st.sno, st.sname
HAVING COUNT(sc.cno) < (
	SELECT COUNT(DISTINCT cno)
	FROM T_View_table_005
);

select count(*) from v_view_test_004 where (sno,new_count) in (select sno,max(new_count) from v_view_test_005 group by sno);