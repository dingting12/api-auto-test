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

*** Test Cases ***
EXTERNALTYPETEST   
	[Documentation]    测试外部表类型
    [Tags]     SQL-Test       external type real test
    Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_csv_real.sql
				   Compare Files     external_table_basic_type_hdfs_csv_real.log        external_table_basic_type_hdfs_csv_real.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_orc_real.sql
				   Compare Files     external_table_basic_type_hdfs_orc_real.log        external_table_basic_type_hdfs_orc_real.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_parquet_real.sql
				   Compare Files     external_table_basic_type_hdfs_parquet_real.log    external_table_basic_type_hdfs_parquet_real.ref	
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_ldbdist_csv_real.sql
				   Compare Files     external_table_basic_type_ldbdist_csv_real.log     external_table_basic_type_ldbdist_csv_real.ref				   

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               ../external_sql.map

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/real_csv/*.csv  real_csv/
    HDFS Upload                ../data/real1_orc/*  real1_orc/
    HDFS Upload                ../data/real1_parquet/*  real1_parquet/
    HDFS Upload                ../data/common_orc/*  common_real_orc/
    HDFS Upload                ../data/common_parquet/*  common_real_parquet/


Upload ldbdist files
    SSH Connect                      %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                       ../data/real_csv/*.csv   csv/