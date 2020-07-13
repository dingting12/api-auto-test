*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:丁婷

*** Test Cases ***
SMOKETEST   
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test   
	LOgon And Execute SQL Script     admin/123456  CORE_null与基本完整性约束.sql 
    LOgon And Execute SQL Script     admin/123456  CORE_Schema_DDL.sql  	
	Compare Files        CORE_null与基本完整性约束.log    		 CORE_null与基本完整性约束.ref 
	Compare Files        CORE_Schema_DDL.sql.log    			  CORE_Schema_DDL.sql.ref 
		


