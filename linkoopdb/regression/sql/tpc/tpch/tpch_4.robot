*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot


Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    TPCH
Force Tags       TPCH  owner:满意


*** Test Cases ***
#DROP TPCH TABLE
#    [Documentation]    DROP TPCH TABLE
#    Logon And Execute SQL Script       admin/123456  prepare/drop.sql  drop.log
##    Compare Files                      drop.log      prepare/drop.ref
#
#CREATE TPCH EXTERNAL TABLE
#    [Documentation]    CREATE TPCH EXTERNAL TABLE
#    SQLCli Set SQLMAPPING               prepare/tpch_hdfs_path.map
#    Logon And Execute SQL Script        admin/123456  prepare/external.sql  external.log
##    Compare Files                      external.log  prepare/external.ref
#
#CREATE TPCH TABLE
#    [Documentation]    CREATE TPCH TABLE
#    Logon And Execute SQL Script       admin/123456  prepare/create.sql  create.log
#
#LOAD DATA
#    [Documentation]    LOAD DATA
#    Logon And Execute SQL Script       admin/123456  prepare/load.sql  load.log

TPCH QUERIES
    [Documentation]    TPCH QUERIES
    Logon And Execute SQL Script       admin/123456  queries/15.sql  15.log
    Logon And Execute SQL Script       admin/123456  queries/16.sql  16.log
    Logon And Execute SQL Script       admin/123456  queries/17.sql  17.log
    Logon And Execute SQL Script       admin/123456  queries/18.sql  18.log


*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True
    SQLCli Enable ConsoleOutput        True