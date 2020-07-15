*** Settings ***
Documentation    发送数据到kafka topic
...              发送数据
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Force Tags       FUNCTION  owner:贾路遥

*** Test Cases ***
FunctionTestHdfsTest-String
    [Documentation]    发送数据到kafka topic
    Logon And Execute SQL Script    admin/123456              datasend.sql           datasend.log
    Compare Files                   datasend.log       datasend.ref


*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True
