*** Settings ***
Documentation    函数测试
...              测试LDB函数的使用
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Force Tags       FUNCTION

*** Test Cases ***
FunctionTestHdfsTest-String
    [Documentation]    字符串函数测试
    Logon And Execute SQL Script    admin/123456              string_function.sql           string_function.log
    Compare Files                   string_function.log       string_function.ref
	
FunctionTestHdfsTest-Time
    [Documentation]    时间函数测试
    Logon And Execute SQL Script    admin/123456              date_time_function.sql           date_time_function.log
    Compare Files                   date_time_function.log       date_time_function.ref

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True
