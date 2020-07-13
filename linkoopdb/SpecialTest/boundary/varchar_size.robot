*** Settings ***
Documentation    测试pallas和hdfs表varchar列支持的最大长度

# 引用公共函数
Resource         %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:阮娜


*** Test Cases ***
VarcharSizeTest
    [Tags]     SQL-Test       varchar size test
    Logon And Execute SQL Script    admin/123456  varchar_size.sql   varchar_size.log
    Compare Files             varchar_size.log  varchar_size.ref


