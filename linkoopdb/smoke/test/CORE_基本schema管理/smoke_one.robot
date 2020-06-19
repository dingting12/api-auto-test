*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
SCHEMATEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test   
	LOgon And Execute SQL Script     admin/123456  F031 Configurable compact output parallel.sql
    LOgon And Execute SQL Script     admin/123456  F031-01 CREATE TABLE statement to create persistent base tables.sql
    LOgon And Execute SQL Script     admin/123456  F031-02 CREATE VIEW statement.sql
    LOgon And Execute SQL Script     admin/123456  F031-03 GRANT statement.sql
    LOgon And Execute SQL Script     admin/123456  F031-04 ALTER TABLE statement.sql
    LOgon And Execute SQL Script     admin/123456  F031-13 DROP TABLE statement.sql
    LOgon And Execute SQL Script     admin/123456  F031-16 DROP VIEW statement.sql
    LOgon And Execute SQL Script     admin/123456  F031-19 REVOKE statement.sql
    LOgon And Execute SQL Script     admin/123456  F382 Alter column data type.sql
    LOgon And Execute SQL Script     admin/123456  LDBX031-07 中文表名，列名的支持.sql
    LOgon And Execute SQL Script     admin/123456  LDBX141-02 Copy model by copying files.sql
    LOgon And Execute SQL Script     admin/123456  T171 LIKE clause in table definition.sql

	Compare Files        F031 Configurable compact output parallel.log                             F031 Configurable compact output parallel.ref
	Compare Files        F031-01 CREATE TABLE statement to create persistent base tables.log       F031-01 CREATE TABLE statement to create persistent base tables.ref
	Compare Files        F031-02 CREATE VIEW statement.log                                         F031-02 CREATE VIEW statement.ref
	Compare Files        F031-03 GRANT statement.log                                               F031-03 GRANT statement.ref
	Compare Files        F031-04 ALTER TABLE statement.log                                         F031-04 ALTER TABLE statement.ref
	Compare Files        F031-13 DROP TABLE statement.log                                          F031-13 DROP TABLE statement.ref
	Compare Files        F031-16 DROP VIEW statement.log                                           F031-16 DROP VIEW statement.ref
	Compare Files        F031-19 REVOKE statement.log                                              F031-19 REVOKE statement.ref
    Compare Files        F382 Alter column data type.log                                           F382 Alter column data type.ref
    Compare Files        LDBX031-07 中文表名，列名的支持.log                                           LDBX031-07 中文表名，列名的支持.ref
    Compare Files        LDBX141-02 Copy model by copying files.log                                LDBX141-02 Copy model by copying files.ref
    Compare Files        T171 LIKE clause in table definition.log                                  T171 LIKE clause in table definition.ref


