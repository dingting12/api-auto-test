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
    [Tags]     SQL-Test       external type date test
    Logon And Execute SQL Script     admin/123456                                       external_table_basic_type_hdfs_csv_date.sql
				   Compare Files     external_table_basic_type_hdfs_csv_date.log        external_table_basic_type_hdfs_csv_date.ref
	Logon And Execute SQL Script     admin/123456                                       external_table_basic_type_hdfs_orc_date.sql
				   Compare Files     external_table_basic_type_hdfs_orc_date.log        external_table_basic_type_hdfs_orc_date.ref
	Logon And Execute SQL Script     admin/123456                                       external_table_basic_type_hdfs_parquet_date.sql
				   Compare Files     external_table_basic_type_hdfs_parquet_date.log    external_table_basic_type_hdfs_parquet_date.ref	
	Logon And Execute SQL Script     admin/123456                                       external_table_basic_type_ldbdist_csv_date.sql
				   Compare Files     external_table_basic_type_ldbdist_csv_date.log     external_table_basic_type_ldbdist_csv_date.ref				   

*** Keywords ***

Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               ../external_sql.map
	Compare Skip                        ^['Project ].*
    Compare Skip						^[\+\-].*
	
Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/date_csv/*.csv  date_csv/
    HDFS Upload                ../data/date_orc/*  date_orc/
    HDFS Upload                ../data/date_parquet/*  date_parquet/
    HDFS Upload                ../data/common_orc/*  common_date_orc/
    HDFS Upload                ../data/common_parquet/*  common_date_parquet/


Upload ldbdist files
    SSH Connect                      %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                       ../data/date_csv/*.csv   csv/