*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Suite Setup       SQL Test Setup
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    HDFS分区分桶回归测试
Force Tags       SQL-Test


*** Test Cases ***
Partition-HDFS
    [Documentation]    HDFS分区进行回归测试
    [Tags]     Smoke   HDFS

    Logon And Execute SQL Script       admin/123456  partition/partition.sql          partition.log
    Compare Files             partition.log       partition/partition.ref

