*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
SMOKETEST   
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test   
	LOgon And Execute SQL Script     admin/123456  CORE_cast_case.sql        
	Compare Files        CORE_cast_case.log    			  CORE_cast_case.ref 
	
		


