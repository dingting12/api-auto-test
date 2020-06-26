*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot


Suite Setup       SQL Test Setup
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    TPCH
Force Tags       TPCH


*** Test Cases ***
DROP TPCH TABLE
    [Documentation]    DROP TPCH TABLE
    Logon And Execute SQL Script       admin/123456  tpch/prepare/drop.sql  drop.log
    Compare Files                      drop.log                           tpch/prepare/drop.ref

CREATE TPCH EXTERNAL TABLE
    [Documentation]    CREATE TPCH EXTERNAL TABLE
    Logon And Execute SQL Script       admin/123456  tpch/prepare/external.sql  external.log
    Compare Files                      external.log                           tpch/prepare/external.ref


















