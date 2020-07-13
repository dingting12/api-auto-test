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
external type decimal test   
	[Documentation]    测试外部表类型
    [Tags]     SQL-Test       external type decimal test
    Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_csv_decimal.sql
				   Compare Files     external_table_basic_type_hdfs_csv_decimal.log        external_table_basic_type_hdfs_csv_decimal.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_orc_decimal.sql
				   Compare Files     external_table_basic_type_hdfs_orc_decimal.log        external_table_basic_type_hdfs_orc_decimal.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_parquet_decimal.sql
				   Compare Files     external_table_basic_type_hdfs_parquet_decimal.log    external_table_basic_type_hdfs_parquet_decimal.ref	
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_ldbdist_csv_decimal.sql
				   Compare Files     external_table_basic_type_ldbdist_csv_decimal.log     external_table_basic_type_ldbdist_csv_decimal.ref				   

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               ../external_sql.map

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/decimal_csv/*.csv  decimal_csv/
    HDFS Upload                ../data/numeric1_orc/*  decimal1_orc/
	HDFS Upload                ../data/numeric2_orc/*  decimal2_orc/
	HDFS Upload                ../data/numeric3_orc/*  decimal3_orc/
    HDFS Upload                ../data/numeric1_parquet/*  decimal1_parquet/
	HDFS Upload                ../data/numeric2_parquet/*  decimal2_parquet/
	HDFS Upload                ../data/numeric3_parquet/*  decimal3_parquet/
    HDFS Upload                ../data/common_orc/*  common_decimal_orc/
    HDFS Upload                ../data/common_parquet/*  common_decimal_parquet/

Upload ldbdist files
    SSH Connect                      %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                       ../data/decimal_csv/*.csv   csv/