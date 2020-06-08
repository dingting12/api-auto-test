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
    [Documentation]    演示程序2， SQL测试，输出信息将显示在控制台上
    [Tags]     SQL-Test       Smoke
    SQLCli Enable ConsoleOutput    True
    Compare Enable ConsoleOutput   True
    Execute SQL Script             tke2.sql            tke2_hdfs_2.log
    Compare Files                  tke2_hdfs_2.log     tke2.ref

Demo3
    [Documentation]    演示程序3， 使用SQLMAPPING来实现Pallas引擎的测试
    [Tags]     SQL-Test       Smoke    Pallas

    SQLCli Set SQLMAPPING          tke2_pallas.map
    Execute SQL Script             tke2.sql          tke2_pallas.log
    Compare Files                  tke2_pallas.log   tke2.ref

