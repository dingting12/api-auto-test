*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:丁婷

*** Test Cases ***
doc test   
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       external type test
	Logon And Execute SQL Script     admin/123456           9_4_data_export.sql
				   Compare Files     9_4_data_export.log    9_4_data_export.ref
	
	

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True

