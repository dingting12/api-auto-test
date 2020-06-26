*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot


Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    TPCH
Force Tags       TPCH


*** Test Cases ***
DROP TPCH TABLE
    [Documentation]    DROP TPCH TABLE
    Logon And Execute SQL Script       admin/123456  prepare/drop.sql  drop.log
#    Compare Files                      drop.log      prepare/drop.ref

CREATE TPCH EXTERNAL TABLE
    [Documentation]    CREATE TPCH EXTERNAL TABLE
    Logon And Execute SQL Script       admin/123456  prepare/external.sql  external.log
#    Compare Files                      external.log  prepare/external.ref

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True
















