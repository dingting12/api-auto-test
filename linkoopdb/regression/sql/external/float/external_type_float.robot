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
 external type float test   
	[Documentation]    测试外部表类型
    [Tags]     EXTERNAL
    Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_csv_float.sql
				   Compare Files     external_table_basic_type_hdfs_csv_float.log        external_table_basic_type_hdfs_csv_float.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_orc_float.sql
				   Compare Files     external_table_basic_type_hdfs_orc_float.log        external_table_basic_type_hdfs_orc_float.ref
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_hdfs_parquet_float.sql
				   Compare Files     external_table_basic_type_hdfs_parquet_float.log    external_table_basic_type_hdfs_parquet_float.ref	
	Logon And Execute SQL Script     admin/123456                                          external_table_basic_type_ldbdist_csv_float.sql
				   Compare Files     external_table_basic_type_ldbdist_csv_float.log     external_table_basic_type_ldbdist_csv_float.ref				   

*** Keywords ***
Setup Custom Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               ../external_sql.map

Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                ../data/float_csv/*.csv  float_csv/
    HDFS Upload                ../data/float1_orc/*  float1_orc/
    HDFS Upload                ../data/float1_parquet/*  float1_parquet/
    HDFS Upload                ../data/common_orc/*  common_float_orc/
    HDFS Upload                ../data/common_parquet/*  common_float_parquet/


Upload ldbdist files
    SSH Connect                      %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                       ../data/float_csv/*.csv   csv/