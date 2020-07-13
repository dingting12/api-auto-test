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
external type numeric test   
	[Documentation]    测试外部表类型
    [Tags]     SQL-Test       external type numeric test
    Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_csv_numeric.sql
				   Compare Files     external_table_basic_type_hdfs_csv_numeric.log        external_table_basic_type_hdfs_csv_numeric.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_orc_numeric.sql
				   Compare Files     external_table_basic_type_hdfs_orc_numeric.log        external_table_basic_type_hdfs_orc_numeric.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_parquet_numeric.sql
				   Compare Files     external_table_basic_type_hdfs_parquet_numeric.log    external_table_basic_type_hdfs_parquet_numeric.ref	
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_ldbdist_csv_numeric.sql
				   Compare Files     external_table_basic_type_ldbdist_csv_numeric.log     external_table_basic_type_ldbdist_csv_numeric.ref				   

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               ../external_sql.map

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/decimal_csv/*.csv  numeric_csv/
    HDFS Upload                ../data/numeric1_orc/*  numeric1_orc/
	HDFS Upload                ../data/numeric2_orc/*  numeric2_orc/
	HDFS Upload                ../data/numeric3_orc/*  numeric3_orc/
    HDFS Upload                ../data/numeric1_parquet/*  numeric1_parquet/
	HDFS Upload                ../data/numeric2_parquet/*  numeric2_parquet/
	HDFS Upload                ../data/numeric3_parquet/*  numeric3_parquet/
    HDFS Upload                ../data/common_orc/*  common_numeric_orc/
    HDFS Upload                ../data/common_parquet/*  common_numeric_parquet/


Upload ldbdist files
    SSH Connect                      %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                       ../data/decimal_csv/*.csv   csv/