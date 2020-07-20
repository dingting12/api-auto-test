*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords
...              SQL Test Setup  AND
...              Setup Custom Settings 
Test Teardown    SQL Test Clnup
Force Tags       owner:丁婷

*** Test Cases ***
STREAM PERFORMANCE  
	[Documentation]    测试kafka source到各类sink的性能
    [Tags]     STREAM    PERFORMANCE
    Logon And Execute SQL Script     admin/123456     kafka.sql
				   Compare Files     kafka.log           kafka.ref
	
*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               random.map

