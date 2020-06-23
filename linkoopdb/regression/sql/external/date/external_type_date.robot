*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Library          OperatingSystem

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
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True
