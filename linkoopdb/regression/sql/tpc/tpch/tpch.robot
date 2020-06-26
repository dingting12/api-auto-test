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
    Logon And Execute SQL Script       admin/123456  tpch/drop.sql            drop.log
    Compare Files                      drop.log                           tpch/drop.ref

CREATE TPCH EXTERNAL TABLE
    [Documentation]    CREATE TPCH EXTERNAL TABLE
    Logon And Execute SQL Script       admin/123456  tpch/external.sql            external.log
    Compare Files                      external.log                           tpch/external.ref


















