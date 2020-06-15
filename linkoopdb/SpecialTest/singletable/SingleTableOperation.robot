*** Settings ***
Documentation    单表查询
...              数据量为1000万，存储引擎为pallas
Metadata         Version    0.1
# 引用公共函数
Resource          ../../regression/common/SetupRobot.robot

*** Test Cases ***
SingleTableOperationTest
    [Tags]     SQL-Test       SingleTable
    Setup Compare Settings
    Execute SQL Script        SingleTableOperation1000.sql
    Compare Files             SingleTableOperation1000.log  SingleTableOperation1000.ref

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
    Compare Break When Difference      True
	Compare Enable ConsoleOutput       True
