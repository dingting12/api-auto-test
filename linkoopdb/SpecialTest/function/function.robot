*** Settings ***
Documentation    函数测试
...              测试LDB函数的使用
Metadata         Version    0.1
# 引用公共函数
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot

*** Test Cases ***
FunctionTestHdfsTest-String
    [Tags]     FUNCTION
    
    # 运行测试
    Logon And Execute SQL Script    admin/123456              string_function.sql           string_function.log
    Compare Files                   string_function.log       string_function.ref
	
FunctionTestHdfsTest-Time
    [Tags]     FUNCTION
    
    # 运行测试
    Logon And Execute SQL Script    admin/123456              date_time_function.sql           date_time_function.log
    Compare Files                   date_time_function.log       date_time_function.ref

*** Keywords ***
Setup Compare Settings
    # 比对参考文件的时候忽略空白行
    Compare Ignore EmptyLine           True
    # 比对参考文件的时候使用正则表达式
    Compare Mask                       True
    # 比对参考文件的时候跳过所有符合Running.*匹配的行
    Compare Skip                       Running.*
    Compare Skip                       REWROTED.*
    Compare Skip                       SQLCli.*
    Compare Skip                       REWROTED.*
    Compare Skip                       start.*


	Compare Enable ConsoleOutput       True
