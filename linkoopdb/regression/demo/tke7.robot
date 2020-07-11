*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup

*** Settings ***
Documentation    测试套件说明
...              演示程序
...              Regress_Friendly    YES   # 表示这个程序不参与整体回归测试，正常Case请删除此行
Force Tags       owner:赵石

*** Test Cases ***
Test title
    SQLCli Set SQLMAPPING            tke7_ldbdist.map
    SSH Connect                      %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                       tke2.sql   csv/varchar_001.csv
    SQLCli Enable ConsoleOutput      True
    Compare Enable ConsoleOutput     True
    Execute SQL Script               tke7.sql