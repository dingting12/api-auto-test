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
	LOgon And Execute SQL Script     admin/123456  LDBX022-07 alter external table statement.sql
    LOgon And Execute SQL Script     admin/123456  LDBX022-08 create external table by parquet_hive.sql
    LOgon And Execute SQL Script     admin/123456  LDBX022-12 ORC file as external table.sql


	Compare Files        LDBX022-07 alter external table statement.log    LDBX022-07 alter external table statement.ref
	Compare Files        LDBX022-08 create external table by parquet_hive.log    			  LDBX022-08 create external table by parquet_hive.ref
	Compare Files        LDBX022-12 ORC file as external table.log                  LDBX022-12 ORC file as external table.ref

		


