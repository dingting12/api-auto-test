*** Settings ***
Documentation    两表联结
...              数据量为1000万和5000万，同时存储引擎为pallas
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Force Tags       owner:耿晨宇

*** Test Cases ***
JoinTest
    [Tags]     SQL-Test       SpecialTest
    Compare Break When Difference      True
    Execute SQL Script        pallas_join.sql
    Compare Files             pallas_join.log  pallas_join.ref

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True
