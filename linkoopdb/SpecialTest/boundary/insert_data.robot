*** Settings ***
Documentation    测试pallas和hdfs表插入数据行数

# 引用公共函数
Resource         %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:阮娜

*** Test Cases ***
InsertDataTest
    [Tags]     SQL-Test       insert data test
    Logon And Execute SQL Script    admin/123456  insert_data.sql   insert_data.log
    Compare Files             insert_data.log  insert_data.ref


