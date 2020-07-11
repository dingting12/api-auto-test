*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords
...              SQL Test Setup   AND
...              Setup Custom Settings   AND
...              Upload csv files   AND
...              Upload ldbdist files  
Test Teardown    SQL Test Clnup
Force Tags       owner:丁婷

*** Test Cases ***
EXTERNALTYPETEST   
	[Documentation]    测试外部表类型
    [Tags]     SQL-Test       external type timestamp test
    Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_csv_timestamp.sql
				   Compare Files     external_table_basic_type_hdfs_csv_timestamp.log        external_table_basic_type_hdfs_csv_timestamp.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_orc_timestamp.sql
				   Compare Files     external_table_basic_type_hdfs_orc_timestamp.log        external_table_basic_type_hdfs_orc_timestamp.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_parquet_timestamp.sql
				   Compare Files     external_table_basic_type_hdfs_parquet_timestamp.log    external_table_basic_type_hdfs_parquet_timestamp.ref	
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_ldbdist_csv_timestamp.sql
				   Compare Files     external_table_basic_type_ldbdist_csv_timestamp.log     external_table_basic_type_ldbdist_csv_timestamp.ref				   

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               ../external_sql.map

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/timestamp_csv/*.csv  timestamp_csv/
    HDFS Upload                ../data/timestamp1_orc/*  timestamp1_orc/
    HDFS Upload                ../data/timestamp1_parquet/*  timestamp1_parquet/
    HDFS Upload                ../data/common_orc/*  common_timestamp_orc/
    HDFS Upload                ../data/common_parquet/*  common_timestamp_parquet/


Upload ldbdist files
    SSH Connect                      %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                       ../data/timestamp_csv/*.csv   csv/