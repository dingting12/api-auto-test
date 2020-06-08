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
    SQLCli Enable ConsoleOutput      False
    Compare Enable ConsoleOutput     False
    SQLCli Break When Error          True

    SQLCli Set SQLMAPPING          tke2_pallas.map
    # Logon And Execute SQL Script     admin/123456  GroupBy-P1000.sql    GroupBy-P1000_pallas.log
    Logon And Execute SQL Script     admin/123456  Having-P1000.sql     Having-P1000_pallas.log
    Logon And Execute SQL Script     admin/123456  DataTypeConversion-P1000.sql     DataTypeConversion-P1000_pallas.log

    # Compare Files             GroupBy-P1000.sql    GroupBy-P1000_pallas.ref
    # Compare Files             Having-P1000.sql     Having-P1000_pallas.ref
    # Compare Files             DataTypeConversion-P1000.sql     DataTypeConversion-P1000_pallas.ref




