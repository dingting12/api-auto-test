*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       Setup Random Settings
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
ORACLETEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test   
	Execute SQL Script       oracle_setup.sql
    LOgon And Execute SQL Script     admin/123456  DBLink-oracle.sql

	Compare Files        oracle_setup.log                               oracle_setup.ref
	Compare Files        DBLink-oracle.log                              DBLink-oracle.ref

MYSQLTEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test
	Execute SQL Script       mysql_setup.sql
    LOgon And Execute SQL Script     admin/123456  DBLink-mysql.sql

	Compare Files        mysql_setup.log                               mysql_setup.ref
	Compare Files        DBLink-mysql.log                              DBLink-mysql.ref

HIVELTEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test
#	Execute SQL Script       hive_setup.sql
#    LOgon And Execute SQL Script     admin/123456  DBLink-hive.sql

#	Compare Files        hive_setup.log                               hive_setup.ref
#	Compare Files        DBLink-hive.log                              DBLink-hive.ref

SQLSERVERLTEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test
	Execute SQL Script       sqlserver_setup.sql
    LOgon And Execute SQL Script     admin/123456  DBLink-sqlserver.sql

	Compare Files        sqlserver_setup.log                               sqlserver_setup.ref
	Compare Files        DBLink-sqlserver.log                              DBLink-sqlserver.ref

POSTGRESLTEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test
	Execute SQL Script       postgres_setup.sql
    LOgon And Execute SQL Script     admin/123456  DBLink-postgres.sql

	Compare Files        postgres_setup.log                               postgres_setup.ref
	Compare Files        DBLink-postgres.log                              DBLink-postgres.ref

TERDATATEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test
	Execute SQL Script       teradata_setup.sql
    LOgon And Execute SQL Script     admin/123456  DBLink-teradata.sql

	Compare Files        teradata_setup.ref                               teradata_setup.ref
	Compare Files        DBLink-teradata.ref                              DBLink-teradata.ref

RANDOMTEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test
#	LOgon And Execute SQL Script    admin/123456    random_test.sql

*** Keywords ***
Setup Random Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               random.map