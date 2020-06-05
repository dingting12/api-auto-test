*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          SetupRobot.res

*** Test Cases ***
SyntaxCoveragePallasTest
    [Tags]   SQL-Test       Smoke

    # 配置环境信息
    Setup Linkoop SQL Test

    # 运行测试
    SQLCli Enable ConsoleOutput      False
    Compare Enable ConsoleOutput     False
    SQLCli Break When Error          True

    Logon And Execute SQL Script     admin/123456  GroupBy-P1000.sql    GroupBy-P1000_pallas.log
    Logon And Execute SQL Script     admin/123456  Having-P1000.sql     Having-P1000_pallas.log
    Logon And Execute SQL Script     admin/123456  DataTypeConversion-P1000.sql     DataTypeConversion-P1000_pallas.log

    # Compare Files             GroupBy-P1000.sql    GroupBy-P1000_pallas.ref
    # Compare Files             Having-P1000.sql     Having-P1000_pallas.ref
    # Compare Files             DataTypeConversion-P1000.sql     DataTypeConversion-P1000_pallas.ref
