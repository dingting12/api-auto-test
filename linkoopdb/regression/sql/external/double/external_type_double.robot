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
external type double test   
	[Documentation]    测试外部表类型
    [Tags]     EXTERNAL
    Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_csv_double.sql
				   Compare Files     external_table_basic_type_hdfs_csv_double.log        external_table_basic_type_hdfs_csv_double.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_orc_double.sql
				   Compare Files     external_table_basic_type_hdfs_orc_double.log        external_table_basic_type_hdfs_orc_double.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_parquet_double.sql
				   Compare Files     external_table_basic_type_hdfs_parquet_double.log    external_table_basic_type_hdfs_parquet_double.ref	
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_ldbdist_csv_double.sql
				   Compare Files     external_table_basic_type_ldbdist_csv_double.log     external_table_basic_type_ldbdist_csv_double.ref				   

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               ../external_sql.map

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/real_csv/*.csv  double_csv/
    HDFS Upload                ../data/real1_orc/*  double1_orc/
    HDFS Upload                ../data/real1_parquet/*  double1_parquet/
    HDFS Upload                ../data/common_orc/*  common_double_orc/
    HDFS Upload                ../data/common_parquet/*  common_double_parquet/

Upload ldbdist files
    SSH Connect                      %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                       ../data/real_csv/*.csv   csv/