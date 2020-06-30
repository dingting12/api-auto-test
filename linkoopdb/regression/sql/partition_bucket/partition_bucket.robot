*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords
...              SQL Test Setup   AND
...              Setup Custom Settings   AND
...              Upload csv files
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    HDFS分区分桶回归测试
Force Tags       SQL-Test


*** Test Cases ***
Partition-HDFS
    [Documentation]    HDFS分区进行回归测试
    [Tags]     SQL-Test   HDFS
    Logon And Execute SQL Script       admin/123456  partition/partition.sql          partition.log
    Compare Files             partition.log       partition/partition.ref

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ./data/partition_bucket.csv     partition_bucket/