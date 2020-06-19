*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
SCHEMATEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test   
	LOgon And Execute SQL Script     admin/123456  E011-04 Arithmetic operators.sql
    LOgon And Execute SQL Script     admin/123456  E011-05 Numeric comparison.sql
    LOgon And Execute SQL Script     admin/123456  E011-06 Implicit casting among the numeric data types.sql
    LOgon And Execute SQL Script     admin/123456  E011_E021_F051.sql
    LOgon And Execute SQL Script     admin/123456  E021-03 Character literals.sql
    LOgon And Execute SQL Script     admin/123456  E021-function.sql
    LOgon And Execute SQL Script     admin/123456  E031-01-02-03.sql
    LOgon And Execute SQL Script     admin/123456  F051-01 DATE data type (including support of DATE literal).sql
    LOgon And Execute SQL Script     admin/123456  F051-03 TIMESTAMP data type.sql
    LOgon And Execute SQL Script     admin/123456  F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.sql
    LOgon And Execute SQL Script     admin/123456  F051-05 Explicit CAST between datetime types and character string types.sql
    LOgon And Execute SQL Script     admin/123456  F051-06 CURRENT_DATE.sql
    LOgon And Execute SQL Script     admin/123456  F051-07-08 LOCALTIME_LOCALTIMESTAMP.sql

    Compare Files   E011-04 Arithmetic operators.sql                                              E011-04 Arithmetic operators.ref
    Compare Files   E011-05 Numeric comparison.sql                                                E011-05 Numeric comparison.ref
    Compare Files   E011-06 Implicit casting among the numeric data types.sql                     E011-06 Implicit casting among the numeric data types.ref
    Compare Files   E011_E021_F051.sql                                                            E011_E021_F051.ref
    Compare Files   E021-03 Character literals.sql                                                E021-03 Character literals.ref
    Compare Files   E021-function.sql                                                             E021-function.ref
    Compare Files   E031-01-02-03.sql                                                             E031-01-02-03.ref
    Compare Files   F051-01 DATE data type (including support of DATE literal).sql                F051-01 DATE data type (including support of DATE literal).ref
    Compare Files   F051-03 TIMESTAMP data type.sql                                               F051-03 TIMESTAMP data type.ref
    Compare Files   F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.sql      F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.ref
    Compare Files   F051-05 Explicit CAST between datetime types and character string types.sql   F051-05 Explicit CAST between datetime types and character string types.ref
    Compare Files   F051-06 CURRENT_DATE.sql                                                      F051-06 CURRENT_DATE.ref
    Compare Files   F051-07-08 LOCALTIME_LOCALTIMESTAMP.sql                                       F051-07-08 LOCALTIME_LOCALTIMESTAMP.ref
