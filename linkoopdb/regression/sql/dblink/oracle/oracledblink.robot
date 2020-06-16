*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Metadata         Version    0.1
# 引用公共函数
Resource          ../../../common/SetupRobot.robot

*** Test Cases ***
OracleSetUp
    [Tags]     SQL-Test       DBLINK
    Setup Compare Settings
    Execute SQL Script        oracle_database_sql/oracle_setup.sql
    Compare Files             oracle_setup.log  oracle_setup.ref

*** Test Cases ***
CreateDBlinkTest
    [Tags]     SQL-Test       DBLINK
    Setup Compare Settings
    Execute SQL Script        the_DDL_of_oracle_dblink/create_oracle_dblink.sql
    Compare Files             create_oracle_dblink.log  create_oracle_dblink.ref

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
