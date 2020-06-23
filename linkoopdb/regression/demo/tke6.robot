*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library           OperatingSystem

*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Force Tags       Demo

*** Test Cases ***
Demo5
    [Documentation]    演示程序6, 使用Robot函数来实现HDFS数据操作

    HDFS Connnect              %{T_WORK_HDFS}
    HDFS Upload                data/test.dat

*** Keywords ***