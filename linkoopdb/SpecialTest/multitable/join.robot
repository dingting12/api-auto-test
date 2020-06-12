*** Settings ***
Documentation    两表联结
...              数据量为1000万和5000万，同时存储引擎为pallas
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup

*** Test Cases ***
JoinTest
    [Tags]     SQL-Test       Smoke
    Compare Break When Difference      True
    Execute SQL Script        pallas_join.sql
    Compare Files             pallas_join.log  pallas_join.ref

*** Keywords ***
