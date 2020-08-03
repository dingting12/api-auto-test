*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:丁婷

*** Test Cases ***
SMOKETEST   
	[Documentation]    stream datatype
    [Tags]     DATATYPE
    Logon And Execute SQL Script     admin/123456                    smallint.sql
	               Compare Files     smallint.log                    smallint.ref


