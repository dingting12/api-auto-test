*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup

*** Settings ***
Documentation    SQL语法基本测试
Force Tags       SQL-Test

*** Test Cases ***
SyntaxCoverageHDFSTest-BasicSynatx-H1000
    [Documentation]    语法覆盖-HDFS-BasicSynatx-H1000
    [Tags]   Smoke   HDFS

    Logon And Execute SQL Script    admin/123456     basic_SQLSynatx.sql        basic_synatx_H1000.log
    Compare Files                   basic_synatx_H1000.log            basic_synatx.ref
