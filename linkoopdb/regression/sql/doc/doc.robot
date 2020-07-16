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
doc test   
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       external type test
	Logon And Execute SQL Script     admin/123456                  9maintenance.sql
				   Compare Files     9maintenance.log              9maintenance.ref
    Logon And Execute SQL Script     admin/123456                  11view.sql
				   Compare Files     11view.log                    11view.ref
	Logon And Execute SQL Script     admin/123456                  9_3_data_load.sql
				   Compare Files     9_3_data_load.log             9_3_data_load.ref			   
    Logon And Execute SQL Script     admin/123456                  9_4_data_export.sql
				   Compare Files     9_4_data_export.log           9_4_data_export.ref
	Logon And Execute SQL Script     admin/123456                  9_5_1_link_oracle.sql
				   Compare Files     9_5_1_link_oracle.log         9_5_1_link_oracle.ref
	Logon And Execute SQL Script     admin/123456                  9_5_2_link_postgres.sql
				   Compare Files     9_5_2_link_postgres.log       9_5_2_link_postgres.ref
	Logon And Execute SQL Script     admin/123456                  9_5_3_link_sqlserver.sql
				   Compare Files     9_5_3_link_sqlserver.log      9_5_3_link_sqlserver.ref			   
	Logon And Execute SQL Script     admin/123456                  9_5_4_link_mysql.sql
				   Compare Files     9_5_4_link_mysql.log          9_5_4_link_mysql.ref
	Logon And Execute SQL Script     admin/123456                  9_5_5_link_hive.sql
				   Compare Files     9_5_5_link_hive.log           9_5_5_link_hive.ref
    Logon And Execute SQL Script     admin/123456                  9_5_6_link_teradata.sql
				   Compare Files     9_5_6_link_teradata.log       9_5_6_link_teradata.ref
	Logon And Execute SQL Script     admin/123456                  9_6_1_external_hdfs.sql
				   Compare Files     9_6_1_external_hdfs.log       9_6_1_external_hdfs.ref
    Logon And Execute SQL Script     admin/123456                  9_6_2_external_oracle.sql
				   Compare Files     9_6_2_external_oracle.log     9_6_2_external_oracle.ref				   
	Logon And Execute SQL Script     admin/123456                  9_6_3_external_postgres.sql
				   Compare Files     9_6_3_external_postgres.log   9_6_3_external_postgres.ref
    Logon And Execute SQL Script     admin/123456                  9_6_4_external_sqlserver.sql
				   Compare Files     9_6_4_external_sqlserver.log  9_6_4_external_sqlserver.ref
    Logon And Execute SQL Script     admin/123456                  9_6_5_external_mysql.sql
				   Compare Files     9_6_5_external_mysql.log      9_6_5_external_mysql.ref
    Logon And Execute SQL Script     admin/123456                  9_6_6_external_teradata.sql
				   Compare Files     9_6_6_external_teradata.log   9_6_6_external_teradata.ref
	Logon And Execute SQL Script     admin/123456                  9_6_7_external_hive.sql
				   Compare Files     9_6_7_external_hive.log       9_6_7_external_hive.ref

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True

