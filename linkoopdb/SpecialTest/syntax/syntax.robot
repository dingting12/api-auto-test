*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Suite Setup       SQL Test Setup
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    SQL语法基本测试
Force Tags       SQL-Test

*** Test Cases ***
SyntaxCoverageHDFSTest-GroupBy
    [Documentation]    语法覆盖-HDFS-GroupBy
    [Tags]   Smoke   HDFS

    # 运行测试
    Logon And Execute SQL Script    admin/123456              GroupBy.sql             GroupBy_hdfs.log
    Compare Files                   GroupBy_hdfs.log          GroupBy_pallas.ref

SyntaxCoverageHDFSTest-Having
    [Documentation]    语法覆盖-HDFS-Having
    [Tags]   Smoke   HDFS

    # 运行测试
    Logon And Execute SQL Script    admin/123456                Having.sql              Having_hdfs.log
    Compare Files                   Having_hdfs.log             Having_pallas.ref

SyntaxCoverageHDFSTest-DataTypeConversion
    [Documentation]    语法覆盖-HDFS-DataTypeConversion
    [Tags]   Smoke   HDFS

    # 运行测试
    Logon And Execute SQL Script    admin/123456                  DataTypeConversion.sql    DataTypeConversion_hdfs.log
    Compare Files                   DataTypeConversion_hdfs.log   DataTypeConversion_pallas.ref

SyntaxCoveragePallasTest-GroupBy
    [Documentation]    语法覆盖-Pallas-GroupBy
    [Tags]   Smoke   Pallas

    # 运行测试
    SQLCli Set SQLMAPPING           pallas256.map,synatx_tabname.map
    Logon And Execute SQL Script    admin/123456              GroupBy.sql             GroupBy_Pallas.log
    Compare Files                   GroupBy_Pallas.log        GroupBy_pallas.ref

SyntaxCoveragePallasTest-Having
    [Documentation]    语法覆盖-Pallas-Having
    [Tags]   Smoke   Pallas

    # 运行测试
    SQLCli Set SQLMAPPING           pallas256.map,synatx_tabname.map
    Logon And Execute SQL Script    admin/123456                Having.sql              Having_pallas.log
    Compare Files                   Having_pallas.log             Having_pallas.ref

SyntaxCoveragePallasTest-DataTypeConversion
    [Documentation]    语法覆盖-HDFS-DataTypeConversion
    [Tags]   Smoke   Pallas

    # 运行测试
    SQLCli Set SQLMAPPING           pallas256.map,synatx_tabname.map
    Logon And Execute SQL Script    admin/123456                  DataTypeConversion.sql   DataTypeConversion_pallas.log
    Compare Files                   DataTypeConversion_pallas.log   DataTypeConversion_pallas.ref

SyntaxCoverageHDFSTest-BasicSynatx-H1000
    [Documentation]    语法覆盖-HDFS-BasicSynatx-H1000
    [Tags]   Smoke   HDFS

    Logon And Execute SQL Script    admin/123456     basic_SQLSynatx.sql        basic_synatx_H1000.log
    Compare Files                   basic_synatx_H1000.log            basic_synatx.log

SyntaxCoveragePallasTest-BasicSynatx-P1000
    [Documentation]    语法覆盖-HDFS-BasicSynatx-P1000-Pallas
    [Tags]   Smoke   HDFS

    SQLCli Set SQLMAPPING           pallas256.map,synatx_tabname.map
    Set Environment Variable        TAB_NAME                P1000
    Logon And Execute SQL Script    admin/123456            basic_SQLSynatx.sql        basic_synatx_P1000.log
    Compare Files                   basic_synatx_P1000.log  basic_synatx.log
