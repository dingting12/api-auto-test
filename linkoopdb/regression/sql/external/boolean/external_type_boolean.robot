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
    [Tags]     SQL-Test       external type boolean test
    Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_csv_boolean.sql
				   Compare Files     external_table_basic_type_hdfs_csv_boolean.log        external_table_basic_type_hdfs_csv_boolean.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_orc_boolean.sql
				   Compare Files     external_table_basic_type_hdfs_orc_boolean.log        external_table_basic_type_hdfs_orc_boolean.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_parquet_boolean.sql
				   Compare Files     external_table_basic_type_hdfs_parquet_boolean.log    external_table_basic_type_hdfs_parquet_boolean.ref	
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_ldbdist_csv_boolean.sql
				   Compare Files     external_table_basic_type_ldbdist_csv_boolean.log     external_table_basic_type_ldbdist_csv_boolean.ref				   

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               ../external_sql.map

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/boolean_csv/*.csv  boolean_csv/
    HDFS Upload                ../data/boolean_orc/*   boolean_orc/
    HDFS Upload                ../data/boolean_parquet/*  boolean_parquet/
    HDFS Upload                ../data/common_orc/*   common_boolean_orc/
    HDFS Upload                ../data/common_parquet/*  common_boolean_parquet/


Upload ldbdist files
    SSH Connect                      %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                       ../data/boolean_csv/*.csv   csv/