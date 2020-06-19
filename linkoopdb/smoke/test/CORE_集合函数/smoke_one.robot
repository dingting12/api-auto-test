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
	LOgon And Execute SQL Script     admin/123456  E091-01 AVG.sql
    LOgon And Execute SQL Script     admin/123456  E091-02 COUNT.sql
    LOgon And Execute SQL Script     admin/123456  E091-03 MAX.sql
    LOgon And Execute SQL Script     admin/123456  E091-04 MIN.sql
    LOgon And Execute SQL Script     admin/123456  E091-05 SUM.sql
    LOgon And Execute SQL Script     admin/123456  E091-07 DISTINCT quantifier.sql

	Compare Files        E091-01 AVG.log                  E091-01 AVG.ref
	Compare Files        E091-02 COUNT.log    			  E091-02 COUNT.ref
	Compare Files        E091-03 MAX.log                  E091-03 MAX.ref
	Compare Files        E091-04 MIN.log                  E091-04 MIN.ref
	Compare Files        E091-05 SUM.log                  E091-05 SUM.ref
	Compare Files        E091-07 DISTINCT quantifier.log  E091-07 DISTINCT quantifier.ref
		


