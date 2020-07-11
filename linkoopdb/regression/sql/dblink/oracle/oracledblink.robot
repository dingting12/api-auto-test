*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Force Tags       DBLINK,owner:王煜

*** Test Cases ***
OracleSetUp
    Execute SQL Script        oracle_database_sql/oracle_setup.sql
    Compare Files             oracle_setup.log  oracle_setup.ref

*** Test Cases ***
CreateDBlinkTest
    Execute SQL Script        the_DDL_of_oracle_dblink/create_oracle_dblink1.sql
    Compare Files             create_oracle_dblink1.log  create_oracle_dblink1.ref
