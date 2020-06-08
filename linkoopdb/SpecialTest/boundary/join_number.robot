*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Metadata         Version    0.1
# 引用公共函数
Resource          ../../common/SetupRobot.robot

*** Test Cases ***
JOINNUMBERTest
    [Tags]     SQL-Test       join number test
    Setup Compare Settings
    Logon And Execute SQL Script    admin/123456  join_number.sql   join_number.log
    Compare Files             join_number.log  join_number.ref


