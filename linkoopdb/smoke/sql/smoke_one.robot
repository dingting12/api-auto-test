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
PrivilegeTest
	[Documentation]    基本安全与授权测试
    [Tags]     PRIVILEGE       smoke test
	LOgon And Execute SQL Script     admin/123456  ../test/CORE 基本安全与授权/E081-01 SELECT privilege at the table level.sql                                                            E081-01 SELECT privilege at the table level.log
	Compare Files        E081-01 SELECT privilege at the table level.log        										../test/CORE 基本安全与授权/E081-01 SELECT privilege at the table level.ref



