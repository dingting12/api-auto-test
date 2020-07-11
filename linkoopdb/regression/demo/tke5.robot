*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup

*** Settings ***
Documentation    测试套件说明
...              演示程序
Force Tags       owner:赵石

*** Test Cases ***
Demo5
    [Documentation]    演示程序5, HDFS数据操作，在SQLCli脚本中直接调用HDFS操作
    SQLCli Set SQLMAPPING          tke5_hdfs.map
    SQLCli Enable ConsoleOutput    True
    Execute SQL Script             tke5.sql     tke5.log
    Compare Files                  tke5.log     tke5.ref


*** Keywords ***
