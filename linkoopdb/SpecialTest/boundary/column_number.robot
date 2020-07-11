*** Settings ***
Documentation    测试pallas和hdfs表支持的最大列数

# 引用公共函数
Resource         %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:阮娜

*** Test Cases ***
ColumnNumberTest
    [Tags]     SQL-Test       column number test
    Logon And Execute SQL Script    admin/123456  column_number.sql   column_number.log
    Compare Files             column_number.log  column_number.ref


