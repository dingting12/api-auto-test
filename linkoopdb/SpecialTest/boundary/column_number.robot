*** Settings ***
Documentation    测试pallas和hdfs表支持的最大列数
Metadata         Version    0.1
# 引用公共函数
Resource          ../../common/SetupRobot.robot

*** Test Cases ***
ColumnNumberTest
    [Tags]     SQL-Test       column number test
    Setup Compare Settings
    Logon And Execute SQL Script    admin/123456  column_number.sql   column_number.log
    Compare Files             column_number.log  column_number.ref


