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
    [Tags]     SQL-Test       external type test
    Logon And Execute SQL Script     admin/123456                            bigint/external_table_basic_type-bigint.sql
				   Compare Files     external_table_basic_type-bigint.log    bigint/external_table_basic_type-bigint.ref
	LOgon And Execute SQL Script     admin/123456                            int/external_table_basic_type-int.sql
				   Compare Files     external_table_basic_type-int.log       int/external_table_basic_type-int.ref
	LOgon And Execute SQL Script     admin/123456                            char/external_table_basic_type-char.sql
				   Compare Files     external_table_basic_type-char.log      char/external_table_basic_type-char.ref
	LOgon And Execute SQL Script     admin/123456                            varchar/external_table_basic_type-varchar.sql
	               Compare Files     external_table_basic_type-varchar.log   varchar/external_table_basic_type-varchar.ref
	LOgon And Execute SQL Script     admin/123456                            smallint/external_table_basic_type-smallint.sql
	               Compare Files     external_table_basic_type-smallint.log  smallint/external_table_basic_type-smallint.ref
	LOgon And Execute SQL Script     admin/123456                            float/external_table_basic_type-float.sql
	               Compare Files     external_table_basic_type-float.log     float/external_table_basic_type-float.ref
	LOgon And Execute SQL Script     admin/123456                            double/external_table_basic_type-double.sql
	               Compare Files     external_table_basic_type-double.log    double/external_table_basic_type-double.ref
	LOgon And Execute SQL Script     admin/123456                            real/external_table_basic_type-real.sql
	               Compare Files     external_table_basic_type-real.log      real/external_table_basic_type-real.ref
	LOgon And Execute SQL Script     admin/123456                            decimal/external_table_basic_type-decimal.sql
	               Compare Files     external_table_basic_type-decimal.log   decimal/external_table_basic_type-decimal.ref
	LOgon And Execute SQL Script     admin/123456                            numeric/external_table_basic_type-numeric.sql
	               Compare Files     external_table_basic_type-numeric.log   numeric/external_table_basic_type-numeric.ref
	LOgon And Execute SQL Script     admin/123456                            date/external_table_basic_type-date.sql
	               Compare Files     external_table_basic_type-date.log      date/external_table_basic_type-date.ref
	LOgon And Execute SQL Script     admin/123456                            timestamp/external_table_basic_type-timestamp.sql
	               Compare Files     external_table_basic_type-timestamp.log timestamp/external_table_basic_type-timestamp.ref
	LOgon And Execute SQL Script     admin/123456                            boolean/external_table_basic_type-boolean.sql
	               Compare Files     external_table_basic_type-boolean.log   boolean/external_table_basic_type-boolean.ref
				   
*** Test Cases ***
EXTERNALFORMATTEST   
	[Documentation]    测试外部表格式
    [Tags]     SQL-Test       external format test
    Logon And Execute SQL Script     admin/123456                            exception/external_hdfs_csv_format.sql
				   Compare Files     external_table_basic_type-bigint.log    exception/external_hdfs_csv_format.ref
	LOgon And Execute SQL Script     admin/123456                            exception/external_hdfs_parquet_format.sql
				   Compare Files     external_table_basic_type-int.log       exception/external_hdfs_parquet_format.ref
	LOgon And Execute SQL Script     admin/123456                            exception/external_ldbdist_csv_format.sql
				   Compare Files     external_table_basic_type-char.log      exception/external_ldbdist_csv_format.ref
	

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True

