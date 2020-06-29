*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords
...              SQL Test Setup   AND
...              Setup Custom Settings   AND
...              Upload csv files
Test Teardown    SQL Test Clnup


*** Test Cases ***
EXTERNALTYPETEST   
	[Documentation]    测试外部表类型
    [Tags]     SQL-Test       external type bigint test
    Logon And Execute SQL Script     admin/123456                                         external_table_basic_type_hdfs_csv_bigint.sql
				   Compare Files     external_table_basic_type_hdfs_csv_bigint.log        external_table_basic_type_hdfs_csv_bigint.ref
	Logon And Execute SQL Script     admin/123456                                         external_table_basic_type_hdfs_orc_bigint.sql
				   Compare Files     external_table_basic_type_hdfs_orc_bigint.log        external_table_basic_type_hdfs_orc_bigint.ref
	Logon And Execute SQL Script     admin/123456                                         external_table_basic_type_hdfs_parquet_bigint.sql
				   Compare Files     external_table_basic_type_hdfs_parquet_bigint.log    external_table_basic_type_hdfs_parquet_bigint.ref
	Logon And Execute SQL Script     admin/123456                                         external_table_basic_type_ldbdist_csv_bigint.sql
				   Compare Files     external_table_basic_type_ldbdist_csv_bigint.log     external_table_basic_type_ldbdist_csv_bigint.ref

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               ../external_sql.map

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/bigint_csv/*.csv
	
Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/bigint_orc

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/bigint_parquet

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/common_orc

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/common_parquet
	
