*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
EXTERNALTYPETest   
	[Documentation]    测试外部表类型
    [Tags]     SQL-Test       external type test
    Logon And Execute SQL Script     admin/123456  bigint/external_table_basic_type-bigint.sql
	LOgon And Execute SQL Script     admin/123456  int/external_table_basic_type-int.sql
	LOgon And Execute SQL Script     admin/123456  char/external_table_basic_type-char.sql
	LOgon And Execute SQL Script     admin/123456  varchar/external_table_basic_type-varchar.sql
	LOgon And Execute SQL Script     admin/123456  smallint/external_table_basic_type-smallint.sql
	LOgon And Execute SQL Script     admin/123456  float/external_table_basic_type-float.sql
	LOgon And Execute SQL Script     admin/123456  double/external_table_basic_type-double.sql
	LOgon And Execute SQL Script     admin/123456  real/external_table_basic_type-real.sql
	LOgon And Execute SQL Script     admin/123456  decimal/external_table_basic_type-decimal.sql
	LOgon And Execute SQL Script     admin/123456  numeric/external_table_basic_type-numeric.sql
	LOgon And Execute SQL Script     admin/123456  date/external_table_basic_type-date.sql
	LOgon And Execute SQL Script     admin/123456  timestamp/external_table_basic_type-timestamp.sql
	LOgon And Execute SQL Script     admin/123456  boolean/external_table_basic_type-boolean.sql
    Compare Files             external_table_basic_type-bigint.log  bigint/external_table_basic_type-bigint.ref
	Compare Files             external_table_basic_type-int.log  int/external_table_basic_type-int.ref
	Compare Files             external_table_basic_type-char.log  char/external_table_basic_type-char.ref
	Compare Files             external_table_basic_type-varchar.log  varchar/external_table_basic_type-varchar.ref
	Compare Files             external_table_basic_type-smallint.log  smallint/external_table_basic_type-smallint.ref
	Compare Files             external_table_basic_type-float.log  float/external_table_basic_type-float.ref
	Compare Files             external_table_basic_type-double.log  double/external_table_basic_type-double.ref
	Compare Files             external_table_basic_type-real.log  real/external_table_basic_type-real.ref
	Compare Files             external_table_basic_type-decimal.log  decimal/external_table_basic_type-decimal.ref
	Compare Files             external_table_basic_type-numeric.log  numeric/external_table_basic_type-numeric.ref
	Compare Files             external_table_basic_type-date.log  date/external_table_basic_type-date.ref
	Compare Files             external_table_basic_type-timestamp.log  timestamp/external_table_basic_type-timestamp.ref
	Compare Files             external_table_basic_type-boolean.log  boolean/external_table_basic_type-boolean.ref


