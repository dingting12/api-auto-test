*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
SyntaxCoveragePallasTest
    [Documentation]    语法覆盖在pallas上进行回归测试
    [Tags]   SQL-Test       Smoke   Pallas

    # 运行测试
    SQLCli Set SQLMAPPING          tke2_pallas.map
    Logon And Execute SQL Script     admin/123456  GroupBy.sql    GroupBy_pallas.log
    Logon And Execute SQL Script     admin/123456  Having.sql     Having_pallas.log
    Logon And Execute SQL Script     admin/123456  DataTypeConversion.sql     DataTypeConversion_pallas.log

    Compare Files             GroupBy_pallas.log    GroupBy_pallas.ref
    Compare Files             Having_pallas.log     Having_pallas.ref
    Compare Files             DataTypeConversion_pallas.log     DataTypeConversion_pallas.ref