*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Suite Setup       SQL Test Setup
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    SQL语法基本测试
Force Tags       SQL-Test

*** Test Cases ***
SyntaxCoverageHDFSTest-GroupBy
    [Documentation]    语法覆盖在HDFS上进行回归测试-GroupBy
    [Tags]   Smoke   HDFS

    # 运行测试
    Logon And Execute SQL Script    admin/123456              GroupBy.sql             GroupBy_hdfs.log
    Compare Files                   GroupBy_hdfs.log          GroupBy_pallas.ref

SyntaxCoverageHDFSTest-Having
    [Documentation]    语法覆盖在HDFS上进行回归测试-Having
    [Tags]   Smoke   HDFS

    # 运行测试
    Logon And Execute SQL Script    admin/123456                Having.sql              Having_hdfs.log
    Compare Files                   Having_hdfs.log             Having_pallas.ref

SyntaxCoverageHDFSTest-DataTypeConversion
    [Documentation]    语法覆盖在HDFS上进行回归测试-DataTypeConversion
    [Tags]   Smoke   HDFS

    # 运行测试
    Logon And Execute SQL Script    admin/123456                  DataTypeConversion.sql              DataTypeConversion_hdfs.log
    Compare Files                   DataTypeConversion_hdfs.log   DataTypeConversion_pallas.ref


SyntaxCoverageHDFSTest-BasicSynatx-P1000
    [Documentation]    语法覆盖在HDFS上进行回归测试-BasicSynatx-P1000
    [Tags]   Smoke   HDFS

    Logon And Execute SQL Script    admin/123456     basic_synatx.sql        basic_synatx_P1000.log
    Compare Files                   basic_synatx_P1000.log            basic_synatx.log

SyntaxCoverageHDFSTest-BasicSynatx-P5000
    [Documentation]    语法覆盖在HDFS上进行回归测试-BasicSynatx-P5000
    [Tags]   Smoke   HDFS

    SQLCli Set SQLMAPPING           basic_synatx.map
    Set Environment Variable        TAB_NAME                P5000
    Logon And Execute SQL Script    admin/123456            basic_synatx.sql        basic_synatx_P5000.log
    Compare Files                   basic_synatx_P5000.log  basic_synatx.log

SyntaxCoverageHDFSTest-BasicSynatx-P1Y
    [Documentation]    语法覆盖在HDFS上进行回归测试-BasicSynatx-P1Y
    [Tags]   Smoke   HDFS

    SQLCli Set SQLMAPPING           basic_synatx.map
    Set Environment Variable        TAB_NAME                P1Y
    Logon And Execute SQL Script    admin/123456            basic_synatx.sql        basic_synatx_P1Y.log
    Compare Files                   basic_synatx_P1Y.log    basic_synatx.log

SyntaxCoverageHDFSTest-BasicSynatx-P1000-Pallas
    [Documentation]    语法覆盖在HDFS上进行回归测试-BasicSynatx-P1000-Pallas
    [Tags]   Smoke   HDFS

<<<<<<< HEAD
    Compare Files             GroupBy_pallas.log    GroupBy_pallas.ref
    Compare Files             Having_pallas.log     Having_pallas.ref
    Compare Files             DataTypeConversion_pallas.log     DataTypeConversion_pallas.ref
=======
    SQLCli Set SQLMAPPING           pallas256.map
    Logon And Execute SQL Script    admin/123456     basic_synatx.sql        basic_synatx_P1000.log
    Compare Files                   basic_synatx_P1000.log            basic_synatx.log

SyntaxCoverageHDFSTest-BasicSynatx-P5000-Pallas
    [Documentation]    语法覆盖在HDFS上进行回归测试-BasicSynatx-P5000
    [Tags]   Smoke   HDFS

    SQLCli Set SQLMAPPING           basic_synatx.map,pallas256.map
    Set Environment Variable        TAB_NAME                        P5000
    Logon And Execute SQL Script    admin/123456                    basic_synatx.sql        basic_synatx_P5000_pallas.log
    Compare Files                   basic_synatx_P5000_pallas.log   basic_synatx.log

SyntaxCoverageHDFSTest-BasicSynatx-P1Y-Pallas
    [Documentation]    语法覆盖在HDFS上进行回归测试-BasicSynatx-P1Y-Pallas
    [Tags]   Smoke   HDFS

    SQLCli Set SQLMAPPING           basic_synatx.map,pallas256.map
    Set Environment Variable        TAB_NAME                        P1Y
    Logon And Execute SQL Script    admin/123456                    basic_synatx.sql        basic_synatx_P1Y_pallas.log
    Compare Files                   basic_synatx_P1Y_pallas.log     basic_synatx.log
>>>>>>> d0827f3fe2b7ec41fd4c33ec8d0aef3c17e1f204
