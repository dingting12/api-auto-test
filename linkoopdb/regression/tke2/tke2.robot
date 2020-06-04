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

    Execute SQL Script        tke2.sql
    Compare Files             tke2.log  tke2.ref

*** Keywords ***
Setup Compare Settings
    # SQLCli遇到SQL错误会终止继续执行
    SQLCli Break When Error            True
    # 比对参考文件的时候忽略空白行
    Compare Ignore EmptyLine           True
    # 比对参考文件的时候使用正则表达式
    Compare Mask                       True
    # 比对参考文件的时候跳过所有符合以下条件的行
    Compare Skip                       Running time elapsed.*
    Compare Skip                       Current clock time.*
    Compare Skip                       REWROTED.*
    Compare Skip                       SQLCli Release .*
    Compare Skip                       start .*

    # 一旦遇到错误，就终止继续测试
    Compare Break When Difference      True
