*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:丁婷

*** Test Cases ***
EXTERNALFORMATTEST   
	[Documentation]    测试外部表格式
    [Tags]     SQL-Test       external format test
    Logon And Execute SQL Script     admin/123456                            external_hdfs_csv_format.sql
				   Compare Files     external_hdfs_csv_format.log            external_hdfs_csv_format.ref
	LOgon And Execute SQL Script     admin/123456                            external_hdfs_parquet_format.sql
				   Compare Files     external_hdfs_parquet_format.log        external_hdfs_parquet_format.ref
	LOgon And Execute SQL Script     admin/123456                            external_ldbdist_csv_format.sql
				   Compare Files     external_ldbdist_csv_format.log         external_ldbdist_csv_format.ref
	LOgon And Execute SQL Script     admin/123456                            external_hdfs_orc_format.sql
				   Compare Files     external_hdfs_orc_format.log            external_hdfs_orc_format.ref
	

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True

