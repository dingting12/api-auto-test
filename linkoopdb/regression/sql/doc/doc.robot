*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   
...              Setup Custom Settings   AND
...              Upload csv files   AND
...              Upload ldbdist files 
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:丁婷

*** Test Cases ***
doc test chapter 9.1 and 9.2
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test 9.1 and 9.2
	Logon And Execute SQL Script     admin/123456                  9maintenance.sql
				   Compare Files     9maintenance.log              9maintenance.ref

*** Test Cases ***
doc test chapter 11 view
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 11 view
    Logon And Execute SQL Script     admin/123456                  11view.sql
				   Compare Files     11view.log                    11view.ref

*** Test Cases ***
doc test chapter 9.3 data load
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.3 data load
	Logon And Execute SQL Script     admin/123456                  9_3_data_load.sql
				   Compare Files     9_3_data_load.log             9_3_data_load.ref

*** Test Cases ***
doc test chapter 9.4 data export
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.4 data export
    Logon And Execute SQL Script     admin/123456                  9_4_data_export.sql
				   Compare Files     9_4_data_export.log           9_4_data_export.ref

*** Test Cases ***
doc test chapter 9.5.1 link oracle
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.5.1 link oracle
	Logon And Execute SQL Script     admin/123456                  9_5_1_link_oracle.sql
				   Compare Files     9_5_1_link_oracle.log         9_5_1_link_oracle.ref

*** Test Cases ***
doc test chapter 9.5.2 link postgres
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.5.2 link postgres
	Logon And Execute SQL Script     admin/123456                  9_5_2_link_postgres.sql
				   Compare Files     9_5_2_link_postgres.log       9_5_2_link_postgres.ref

*** Test Cases ***
doc test chapter 9.5.3 link sqlserver
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.5.3 link sqlserver
	Logon And Execute SQL Script     admin/123456                  9_5_3_link_sqlserver.sql
				   Compare Files     9_5_3_link_sqlserver.log      9_5_3_link_sqlserver.ref

*** Test Cases ***
doc test chapter 9.5.4 link mysql
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.5.4 link mysql
	Logon And Execute SQL Script     admin/123456                  9_5_4_link_mysql.sql
				   Compare Files     9_5_4_link_mysql.log          9_5_4_link_mysql.ref

*** Test Cases ***
doc test chapter 9.5.5 link hive
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.5.5 link hive
	Logon And Execute SQL Script     admin/123456                  9_5_5_link_hive.sql
				   Compare Files     9_5_5_link_hive.log           9_5_5_link_hive.ref

*** Test Cases ***
doc test chapter 9.5.6 link teradata
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.5.6 link teradata
    Logon And Execute SQL Script     admin/123456                  9_5_6_link_teradata.sql
				   Compare Files     9_5_6_link_teradata.log       9_5_6_link_teradata.ref


*** Test Cases ***
doc test chapter 9.6.1 external hdfs
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.6.1 external hdfs
	Logon And Execute SQL Script     admin/123456                  9_6_1_external_hdfs.sql
				   Compare Files     9_6_1_external_hdfs.log       9_6_1_external_hdfs.ref

*** Test Cases ***
doc test chapter 9.6.2 external oracle
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.6.2 external oracle
    Logon And Execute SQL Script     admin/123456                  9_6_2_external_oracle.sql
				   Compare Files     9_6_2_external_oracle.log     9_6_2_external_oracle.ref

*** Test Cases ***
doc test chapter 9.6.3 external postgres
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.6.3 external postgres
	Logon And Execute SQL Script     admin/123456                  9_6_3_external_postgres.sql
				   Compare Files     9_6_3_external_postgres.log   9_6_3_external_postgres.ref

*** Test Cases ***
doc test chapter 9.6.4 external sqlserver
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.6.4 external sqlserver
    Logon And Execute SQL Script     admin/123456                  9_6_4_external_sqlserver.sql
				   Compare Files     9_6_4_external_sqlserver.log  9_6_4_external_sqlserver.ref

*** Test Cases ***
doc test chapter 9.6.5 external mysql
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.6.5 external mysql
    Logon And Execute SQL Script     admin/123456                  9_6_5_external_mysql.sql
				   Compare Files     9_6_5_external_mysql.log      9_6_5_external_mysql.ref

*** Test Cases ***
doc test chapter 9.6.6 external teradata
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.6.6 external teradata
    Logon And Execute SQL Script     admin/123456                  9_6_6_external_teradata.sql
				   Compare Files     9_6_6_external_teradata.log   9_6_6_external_teradata.ref

*** Test Cases ***
doc test chapter 9.6.7 external hive
	[Documentation]    测试用户手册例子
    [Tags]     SQL-Test       doc test chapter 9.6.7 external hive
	Logon And Execute SQL Script     admin/123456                  9_6_7_external_hive.sql
				   Compare Files     9_6_7_external_hive.log       9_6_7_external_hive.ref

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True
    SQLCli Set SQLMAPPING              doc.map


Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
    HDFS Upload                data/*.csv             doc/
    HDFS Upload                data/*.orc             doc/
    HDFS Upload                data/*.parquet         doc/
	HDFS Upload                data/csv_doc           doc/
	HDFS Upload                data/parquet_test      doc/
	
Upload ldbdist files
    SSH Connect                %{LDBSSH_ROOTURL}/%{JOB_BASE_NAME}/
    SSH Upload                  ldbdist/*.csv   doc/
	SSH Upload                  ldbdist/TEST    doc/