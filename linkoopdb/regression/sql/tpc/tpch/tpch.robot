*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot


Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    TPCH
Force Tags       TPCH


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
    Logon And Execute SQL Script       admin/123456  queries/1.sql  1.log
    Logon And Execute SQL Script       admin/123456  queries/2.sql  2.log
    Logon And Execute SQL Script       admin/123456  queries/3.sql  3.log
    Logon And Execute SQL Script       admin/123456  queries/4.sql  4.log
    Logon And Execute SQL Script       admin/123456  queries/5.sql  5.log
    Logon And Execute SQL Script       admin/123456  queries/6.sql  6.log
    Logon And Execute SQL Script       admin/123456  queries/7.sql  7.log
    Logon And Execute SQL Script       admin/123456  queries/8.sql  8.log
    Logon And Execute SQL Script       admin/123456  queries/9.sql  9.log
    Logon And Execute SQL Script       admin/123456  queries/10.sql  10.log
    Logon And Execute SQL Script       admin/123456  queries/11.sql  11.log
    Logon And Execute SQL Script       admin/123456  queries/12.sql  12.log
    Logon And Execute SQL Script       admin/123456  queries/13.sql  13.log
    Logon And Execute SQL Script       admin/123456  queries/14.sql  14.log
    Logon And Execute SQL Script       admin/123456  queries/15.sql  15.log
    Logon And Execute SQL Script       admin/123456  queries/16.sql  16.log
    Logon And Execute SQL Script       admin/123456  queries/17.sql  17.log
    Logon And Execute SQL Script       admin/123456  queries/18.sql  18.log
    Logon And Execute SQL Script       admin/123456  queries/19.sql  19.log
    Logon And Execute SQL Script       admin/123456  queries/20.sql  20.log
    Logon And Execute SQL Script       admin/123456  queries/21.sql  21.log
    Logon And Execute SQL Script       admin/123456  queries/22.sql  22.log

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True
    SQLCli Enable ConsoleOutput        True















