*** Settings ***
Documentation    日期时间函数测试
...              测试日期时间函数的使用
Metadata         Version    0.1
# 引用公共函数
Resource          ../../regression/common/SetupRobot.robot

*** Test Cases ***
JoinTest
    [Tags]     SQL-Test       Smoke
    Setup Compare Settings
    Execute SQL Script        date_time_function.sql
    Compare Files             date_time_function.sql  date_time_function.ref

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
    Compare Skip                       start.*

    # 一旦遇到错误，就终止继续测试
    Compare Break When Difference      False
