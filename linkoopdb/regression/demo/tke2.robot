*** Settings ***
Resource         %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    Compare Check Result

*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

*** Test Cases ***
Demo1
    [Documentation]    演示程序1， 最简单基础的一个SQL测试
    [Tags]     SQL-Test       Smoke

    Execute SQL Script             tke2.sql          tke2_hdfs.log
    Compare Files                  tke2_hdfs.log     tke2.ref

Demo2
    [Documentation]    演示程序2， 最简单基础的一个SQL测试，输出信息将显示在控制台上
    [Tags]     SQL-Test       Smoke
    SQLCli Enable ConsoleOutput    True
    Compare Enable ConsoleOutput   True
    Execute SQL Script             tke2.sql          tke2_hdfs.log
    Compare Files                  tke2_hdfs.log     tke2.ref

Demo3
    [Documentation]    演示程序3， 这里会尝试使用SQLMAPPING，来实现Pallas引擎的测试
    [Tags]     SQL-Test       Smoke    Pallas

    SQLCli Set SQLMAPPING          tke2_pallas.map
    Execute SQL Script             tke2.sql          tke2_pallas.log
    Compare Files                  tke2_pallas.log   tke2.ref

    # 这里所有对选项的修改都会覆盖在Setup Linkoop SQL Test提供的默认值
    # 这里需要根据具体Case的情况来调整具体的设置
    SQLCli Enable ConsoleOutput    True
    Compare Enable ConsoleOutput   True
    SQLCli Break When Error        False
    Compare Break When Difference  True
