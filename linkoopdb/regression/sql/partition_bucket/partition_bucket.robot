*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords
...              SQL Test Setup   AND
...              Setup Custom Settings   AND
...              Upload csv files
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    HDFS分区分桶回归测试
Force Tags       HDFS   owner:阮娜

*** Test Cases ***
Partition-HDFS
    [Documentation]    HDFS分区进行回归测试
    [Tags]     PARTITION    HDFS
    Logon And Execute SQL Script       admin/123456  partition/partition.sql          partition.log
    Compare Files             partition.log       partition/partition.ref

Partition-aggregate
    [Documentation]    HDFS分区聚合测试
    [Tags]     PARTITION    HDFS
    Logon And Execute SQL Script       admin/123456  partition/partition_aggregate.sql          partition_aggregate.log
    Compare Files             partition_aggregate.log       partition/partition_aggregate.ref

Bucket-HDFS
    [Documentation]    HDFS分桶进行回归测试
    [Tags]     BUCKET    HDFS
    Logon And Execute SQL Script       admin/123456  bucket/bucket.sql          bucket.log
    Compare Files             bucket.log       bucket/bucket.ref

Bucket-sort
    [Documentation]    HDFS分桶排序进行回归测试
    [Tags]     BUCKET    HDFS
    Logon And Execute SQL Script       admin/123456  bucket/bucket_sort.sql          bucket_sort.log
    Compare Files             bucket_sort.log       bucket/bucket_sort.ref

Bucket-Partition
    [Documentation]    HDFS分区分桶进行回归测试
    [Tags]     BUCKET    HDFS
    Logon And Execute SQL Script       admin/123456  partition_bucket.sql          partition_bucket.log
    Compare Files             partition_bucket.log       partition_bucket.ref

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
	SQLCli Set SQLMAPPING               ../partition_bucket_sql.map

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ./data/partition_bucket.csv     partition_bucket/