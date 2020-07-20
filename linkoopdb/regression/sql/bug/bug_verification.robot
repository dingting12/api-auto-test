*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Suite Setup       Create HDFS PATH
Suite Teardown    Tear Down

*** Settings ***
Documentation    针对具体BUG的回归测试用例
Force Tags       BUG   owner:翟坤

*** Test Cases ***
LDB-3367
    [Documentation]    针对具体BUG的回归测试用例
    [Tags]     PALLAS

    Logon And Execute SQL Script       admin/123456   LDB-3367/LDB-3367.sql   LDB-3367/LDB-3367.log
    Compare Files                      LDB-3367/LDB-3367.log   LDB-3367/LDB-3367.ref
    Logon And Execute SQL Script       admin/123456   LDB-3367/tear_down.sql

*** Keywords ***
Create HDFS PATH
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Delete                %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/666
Tear Down
    HDFS Delete                %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/666