*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Suite Setup       SQL Test Setup
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Force Tags       SQL-Test


*** Test Cases ***
DataTypeSTest-HDFS
    [Documentation]    数据类型在HDFS上进行回归测试
    [Tags]     Smoke   HDFS

    Logon And Execute SQL Script       admin/123456  bigint/bigint.sql          bigint_hdfs.log
    Logon And Execute SQL Script       admin/123456  boolean/boolean.sql        boolean_hdfs.log
    Logon And Execute SQL Script       admin/123456  char/char.sql              char_hdfs.log
    Logon And Execute SQL Script       admin/123456  date/date.sql              date_hdfs.log
    Logon And Execute SQL Script       admin/123456  decimal/decimal.sql        decimal_hdfs.log
    Logon And Execute SQL Script       admin/123456  double/double.sql          double_hdfs.log
    Logon And Execute SQL Script       admin/123456  float/float.sql            float_hdfs.log
    Logon And Execute SQL Script       admin/123456  int/int.sql                int_hdfs.log
    Logon And Execute SQL Script       admin/123456  numeric/numeric.sql        numeric_hdfs.log
    Logon And Execute SQL Script       admin/123456  real/real.sql              real_hdfs.log
    Logon And Execute SQL Script       admin/123456  smallint/smallint.sql      smallint_hdfs.log
    Logon And Execute SQL Script       admin/123456  timestamp/timestamp.sql    timestamp_hdfs.log
    Logon And Execute SQL Script       admin/123456  varchar/varchar.sql        varchar_hdfs.log
    Logon And Execute SQL Script       admin/123456  binary/binary.sql          binary_hdfs.log
    Logon And Execute SQL Script       admin/123456  array/array.sql            array_hdfs.log


    #Compare Files             bigint_hdfs.log       bigint/bigint_hdfs.ref
    #Compare Files             boolean_hdfs.log      boolean/boolean_hdfs.ref
    #Compare Files             char_hdfs.log         char/char_hdfs.ref
    #Compare Files             date_hdfs.log         date/date_hdfs.ref
    #Compare Files             decimal_hdfs.log      decimal/decimal_hdfs.ref
    #Compare Files             double_hdfs.log       double/double_hdfs.ref
    #Compare Files             float_hdfs.log        float/float_hdfs.ref
    #Compare Files             int_hdfs.log          int/int_hdfs.ref
    #Compare Files             numeric_hdfs.log      numeric/numeric_hdfs.ref
    #Compare Files             real_hdfs.log         real/real_hdfs.ref
    #Compare Files             smallint_hdfs.log     smallint/smallint_hdfs.ref
    #Compare Files             timestamp_hdfs.log    timestamp/timestamp_hdfs.ref
    #Compare Files             varchar_hdfs.log      varchar/varchar_hdfs.ref
    #Compare Files             binary_hdfs.log       binary/binary_hdfs.ref
    #Compare Files             array_hdfs.log        array/array_hdfs.ref
