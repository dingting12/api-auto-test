*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup

*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Force Tags       Demo

*** Test Cases ***
Demo1
    [Documentation]    演示程序1， 最简单基础的一个SQL测试
    Execute SQL Script             tke2.sql          tke2_hdfs.log
    Compare Files                  tke2_hdfs.log     tke2.ref

Demo2
    [Documentation]    演示程序2， SQL测试，输出信息将显示在控制台上
    SQLCli Enable ConsoleOutput    True
    Compare Enable ConsoleOutput   True

    Execute SQL Script             tke2.sql            tke2_hdfs_2.log
    Compare Files                  tke2_hdfs_2.log     tke2.ref

Demo3
    [Documentation]    演示程序3， 使用SQLMAPPING来实现Pallas引擎的测试
    SQLCli Set SQLMAPPING          tke2_pallas.map
    Execute SQL Script             tke2.sql          tke2_pallas.log
    Compare Files                  tke2_pallas.log   tke2.ref

Demo4
    [Documentation]    演示程序4， 使用SQLMAPPING来实现一些表名的替换
    [Tags]     Smoke    Pallas
    SQLCli Set SQLMAPPING            tke2_tabname.map

    Set Environment Variable         TAB_NAME           TKE3
    Execute SQL Script               tke2.sql           tke2_tke3.log
    Compare Files                    tke2_tke3.log      tke3.ref

    SQLCli Enable ConsoleOutput      True
    Compare Enable ConsoleOutput     True
    Set Environment Variable         TAB_NAME           TKE4
    Execute SQL Script               tke2.sql           tke2_tke4.log
    Compare Files                    tke2_tke4.log      tke4.ref

*** Keywords ***
