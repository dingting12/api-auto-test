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
JOINNUMBERTest
    [Documentation]    测试支持join表的个数
    [Tags]     JOIN
    Logon And Execute SQL Script        admin/123456  join_number.sql   join_number.log
    Compare Files                       join_number.log  join_number.ref


