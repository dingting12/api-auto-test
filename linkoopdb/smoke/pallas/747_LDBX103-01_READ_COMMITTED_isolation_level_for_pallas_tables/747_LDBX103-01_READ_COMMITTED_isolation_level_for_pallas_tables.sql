--Description: 测试READ COMMITTED isolation
--Date:         2020-07-06
--Author:       丁婷

drop user test_user1 if exists;
drop user test_user2 if exists;

create user test_user1 password '123456';
create user test_user2 password '123456';
grant DBA to test_user1;
grant DBA to test_user2;

connect test_user1/123456@jdbc:linkoopdb:tcp://192.168.1.74:9105/ldb

session save pallas1node74;

connect test_user2/123456@jdbc:linkoopdb:tcp://192.168.1.74:9105/ldb

session save pallas2node74;

session restore pallas1node74;

set autocommit TRUE;

DROP TABLE T_PALLAS_READ_COMMIT_001 IF EXISTS CASCADE;

create table T_PALLAS_READ_COMMIT_001(
a int, 
b varchar(100), 
c double
) engine pallas;

insert into T_PALLAS_READ_COMMIT_001 values
(1, 'table1_1', 1.1), 
(2, 'table1_2', 1.2), 
(3, 'table1_3', 1.3),
(11, 'table1_11', 1.4), 
(12, 'table1_12', 1.5), 
(13, 'table1_13', 1.6),
(21, 'table1_21', 1.7), 
(22, 'table1_22', 1.8), 
(23, 'table1_23', 1.9),
(31, 'table1_31', 2.0), 
(32, 'table1_32', 2.1),
(33, 'table1_33', 2.2),
(41, 'table1_41', 2.3),
(42, 'table1_42', 2.4), 
(43, 'table1_43', 2.5),
(51, 'table1_51', 2.6), 
(52, 'table1_52', 2.7), 
(53, 'table1_53', 2.8),
(61, 'table1_61', 2.9), 
(62, 'table1_62', 3.0), 
(63, 'table1_63', 3.1);

select * from T_PALLAS_READ_COMMIT_001 order by a ASC;

select count(*) from T_PALLAS_READ_COMMIT_001 ;

set autocommit FALSE;

--测试insert
insert into T_PALLAS_READ_COMMIT_001 values
(81, 'table1_81', 4.2), 
(82, 'table1_82', 4.3), 
(83, 'table1_83', 4.4);

SELECT COUNT(*) FROM T_PALLAS_READ_COMMIT_001;

session restore pallas2node74;

SELECT COUNT(*) FROM TEST_USER1.T_PALLAS_READ_COMMIT_001;

session restore pallas1node74;

COMMIT;

SELECT COUNT(*) FROM T_PALLAS_READ_COMMIT_001;

session restore pallas2node74;

SELECT COUNT(*) FROM TEST_USER1.T_PALLAS_READ_COMMIT_001;

session restore pallas1node74;

--测试delete
DELETE FROM T_PALLAS_READ_COMMIT_001 
WHERE a=2;

SELECT COUNT(*) FROM T_PALLAS_READ_COMMIT_001;

session restore pallas2node74;

SELECT COUNT(*) FROM TEST_USER1.T_PALLAS_READ_COMMIT_001;

session restore pallas1node74;

COMMIT;

SELECT COUNT(*) FROM T_PALLAS_READ_COMMIT_001;

session restore pallas2node74;

SELECT COUNT(*) FROM TEST_USER1.T_PALLAS_READ_COMMIT_001;

session restore pallas1node74;

--测试update
UPDATE T_PALLAS_READ_COMMIT_001 
SET b='wwww' WHERE a=1;

SELECT COUNT(*) FROM T_PALLAS_READ_COMMIT_001;

session restore pallas2node74;

SELECT COUNT(*) FROM TEST_USER1.T_PALLAS_READ_COMMIT_001;

session restore pallas1node74;

COMMIT;

SELECT COUNT(*) FROM T_PALLAS_READ_COMMIT_001;

session restore pallas2node74;

SELECT COUNT(*) FROM TEST_USER1.T_PALLAS_READ_COMMIT_001;

session restore pallas1node74;

