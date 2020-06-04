*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Metadata         Version    0.1
# 引用公共函数
Resource          ../common/SetupRobot.robot

*** Test Cases ***
E101Test
    [Tags]     SQL-Test       Smoke
    Setup Compare Settings
    Logon And Execute SQL Script       admin/123456  SyntaxCoverage-P1000.sql


    # Compare Files             SyntaxCoverage-P1000.log  SyntaxCoverage-P1000.ref


*** Keywords ***
Setup Compare Settings
    # 比对参考文件的时候忽略空白行
    Compare Ignore EmptyLine           True
    # 比对参考文件的时候使用正则表达式
    Compare Mask                       True
    # 比对参考文件的时候跳过所有符合Running.*匹配的行
    Compare Skip                       Running.*
    Compare Skip                       REWROTED.*
    Compare Skip                       SQLCli.*
    Compare Skip                       REWROTED.*

    # 一旦遇到错误，就终止继续测试
    Compare Break When Difference      False
