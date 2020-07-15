*** Settings ***
Documentation    函数测试
...              测试LDB函数的使用
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Force Tags       FUNCTION  owner:贾路遥

*** Test Cases ***
FunctionTestHdfsTest-String
    [Documentation]    字符串函数测试
    Logon And Execute SQL Script    admin/123456              string_function/string_function.sql           string_function.log
    Compare Files                   string_function.log       string_function/string_function.ref
	
FunctionTestHdfsTest-Time
    [Documentation]    时间函数测试
    Logon And Execute SQL Script    admin/123456              time_function/date_time_function.sql           date_time_function.log
    Compare Files                   date_time_function.log       time_function/date_time_function.ref
	
FunctionTestHdfsTest-Time
    [Documentation]    OLAP函数测试
    Logon And Execute SQL Script    admin/123456              OLAP_function/OLAP_function.sql           OLAP_function.log
    Compare Files                   OLAP_function.log       OLAP_function/OLAP_function.ref

FunctionTestHdfsTest-Builtin
    [Documentation]    内置函数测试
    Logon And Execute SQL Script    admin/123456              built-in_function/built-in_function.sql           built-in_function.log
    Compare Files                   built-in_function.log       built-in_function/built-in_function.ref

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True
	Compare Skip                       ^[| 当前时间].*
    Compare Skip                       ^[| 当前日期].*


