*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:耿晨雨

*** Test Cases ***
SCHEMATEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test   
	LOgon And Execute SQL Script     admin/123456  LDBX001 ANALYZE statement to collect statistics.sql
    LOgon And Execute SQL Script     admin/123456  LDBX001-01 Basic ANALYZE.sql
    LOgon And Execute SQL Script     admin/123456  LDBX001-02 DELETE STATISTICS.sql
    LOgon And Execute SQL Script     admin/123456  LDBX001-08 linkoopdb 执行计划.sql

	Compare Files        LDBX001 ANALYZE statement to collect statistics.log    LDBX001 ANALYZE statement to collect statistics.ref
	Compare Files        LDBX001-01 Basic ANALYZE.log    			  LDBX001-01 Basic ANALYZELDBX001-01 Basic ANALYZE.ref
	Compare Files        LDBX001-02 DELETE STATISTICS.log                  LDBX001-02 DELETE STATISTICS.ref
	Compare Files        LDBX001-08 linkoopdb 执行计划.log                  LDBX001-08 linkoopdb 执行计划.ref
		


