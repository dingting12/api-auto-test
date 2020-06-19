*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Suite Setup       SQL Test Setup
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    PALLAS建表语法回归测试
Force Tags       SQL-Test


*** Test Cases ***
Pallas-Syntax
    [Documentation]    PALLAS建表语法回归测试
    [Tags]     Smoke   PALLAS

    Logon And Execute SQL Script       admin/123456   pallas_syntax.sql          pallas_syntax.log
    Compare Files             pallas_syntax.log       pallas_syntax.ref

