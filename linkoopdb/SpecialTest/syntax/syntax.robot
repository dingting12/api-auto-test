*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          SetupRobot.res

*** Test Cases ***
E101Test
    [Tags]   SQL-Test       Smoke

    # 配置环境信息
    Setup Linkoop SQL Test

    # 运行测试
    SQLCli Enable ConsoleOutput      False
    Compare Enable ConsoleOutput     False
    SQLCli Break When Error          True
    Logon And Execute SQL Script     admin/123456  SyntaxCoverage-P1000.sql
    # Compare Files             SyntaxCoverage-P1000.log  SyntaxCoverage-P1000.ref
