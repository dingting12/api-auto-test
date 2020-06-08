*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
TYPETest
    [Documentation]    测试类型与值域
    [Tags]     SQL-Test      type test
    Logon And Execute SQL Script    admin/123456  type.sql   type.log
    Compare Files             type.log  type.ref


