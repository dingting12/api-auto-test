*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Suite Setup       SQL Test Setup
Suite Teardown    Tear Down

*** Settings ***
Documentation    针对具体BUG的回归测试用例
Force Tags       BUG   owner:翟坤

*** Test Cases ***
LDB-3367
    [Documentation]    针对具体BUG的回归测试用例
    [Tags]     PALLAS

    Logon And Execute SQL Script       admin/123456   LDB-367/LDB-367.sql   LDB-367/LDB-367.log
    Compare Files                      LDB-367/LDB-367.log   LDB-367/LDB-367.ref

Create HDFS PATH
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/

Tear Down
    Logon And Execute SQL Script       admin/123456   LDB-367/tear_down.sql