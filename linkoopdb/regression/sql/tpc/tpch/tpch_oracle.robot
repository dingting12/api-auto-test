*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot


Test Setup       run keywords
...              SQL Test Setup   AND
...              Setup Custom Settings
Suite Teardown   SQL Test Clnup

*** Settings ***
Documentation    TPCH
Force Tags       TPCH


*** Test Cases ***
TPCH QUERIES
    [Documentation]    TPCH QUERIES
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/1.sql  1.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/2.sql  2.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/3.sql  3.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/4.sql  4.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/5.sql  5.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/6.sql  6.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/7.sql  7.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/8.sql  8.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/9.sql  9.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/10.sql  10.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/11.sql  11.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/12.sql  12.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/13.sql  13.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/14.sql  14.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/15.sql  15.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/16.sql  16.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/17.sql  17.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/18.sql  18.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/19.sql  19.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/20.sql  20.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/21.sql  21.log
    Logon And Execute SQL Script       testuser/testuser  queries_oracle/22.sql  22.log

*** Keywords ***
Setup Custom Settings
    Set Environment Variable           SQLCLI_CONNECTION_URL      jdbc:oracle:thin://192.168.1.80:1521/ldb
    SQLCli Enable ConsoleOutput        True
