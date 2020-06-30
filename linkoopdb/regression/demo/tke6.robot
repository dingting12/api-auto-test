*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup
...              AND   Custom Prepare
Test Teardown    SQL Test Clnup

*** Settings ***
Documentation    测试套件说明
...              演示程序
...              Regress_Friendly    NO   # 表示这个程序不参与整体回归测试，正常Case请删除此行

*** Test Cases ***
Demo5
    [Tags]             feature:E402
    [Documentation]    演示程序6, 使用Robot函数来实现HDFS数据操作
    Log To Console     "Hello"

*** Keywords ***
Custom Prepare
    HDFS Connnect              %{HDFSWEB_ROOTURL}
    HDFS Upload                data/test.dat
