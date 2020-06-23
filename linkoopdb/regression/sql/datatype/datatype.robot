*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Suite Setup       SQL Test Setup
Suite Teardown    SQL Test Clnup

*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Force Tags       DATATYPE


*** Test Cases ***
ArrayTest-HDFS
    [Documentation]    数据类型-ARRAY-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  array/array.sql            array_hdfs.log
    Compare Files                      array_hdfs.log                           array/array_hdfs.ref

BigintTest-HDFS
    [Documentation]    数据类型-BIGINT-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  bigint/bigint.sql          bigint_hdfs.log
    Compare Files                      bigint_hdfs.log                          bigint/bigint_hdfs.ref
BinaryTest-HDFS
    [Documentation]    数据类型-BINARY-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  binary/binary.sql          binary_hdfs.log
    Compare Files                      binary_hdfs.log                          binary/binary_hdfs.ref

BitTest-HDFS
    [Documentation]    数据类型-BIT-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  bit/bit.sql                bit_hdfs.log
    Compare Files                      bit_hdfs.log                             bit/bit_hdfs.ref

BlobTest-HDFS
    [Documentation]    数据类型-BLOB-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  blob/blob.sql              blob_hdfs.log
    Compare Files                      blob_hdfs.log                            blob/blob_hdfs.ref

BooleanTest-HDFS
    [Documentation]    数据类型-BOOLEAN-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  boolean/boolean.sql        boolean_hdfs.log
    Compare Files                      boolean_hdfs.log                         boolean/boolean_hdfs.ref

CharTest-HDFS
    [Documentation]    数据类型-CHAR-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  char/char.sql              char_hdfs.log
    Compare Files                      char_hdfs.log                            char/char_hdfs.ref

DateTest-HDFS
    [Documentation]    数据类型-DATE-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  date/date.sql              date_hdfs.log
    Compare Files                      date_hdfs.log                            date/date_hdfs.ref

DecimalTest-HDFS
    [Documentation]    数据类型-DECIMAL-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  decimal/decimal.sql        decimal_hdfs.log
    Compare Files                      decimal_hdfs.log                         decimal/decimal_hdfs.ref

DoubleTest-HDFS
    [Documentation]    数据类型-DOUBLE-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  double/double.sql          double_hdfs.log
    Compare Files                      double_hdfs.log                          double/double_hdfs.ref

FloatTest-HDFS
    [Documentation]    数据类型-FLOAT-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  float/float.sql            float_hdfs.log
    Compare Files                      float_hdfs.log                           float/float_hdfs.ref

IntTest-HDFS
    [Documentation]    数据类型-INT-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  int/int.sql                int_hdfs.log
    Compare Files                      int_hdfs.log                             int/int_hdfs.ref

NumericTest-HDFS
    [Documentation]    数据类型-NUMERIC-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  numeric/numeric.sql        numeric_hdfs.log
    Compare Files                      numeric_hdfs.log                         numeric/numeric_hdfs.ref

RealTest-HDFS
    [Documentation]    数据类型-REAL-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  real/real.sql              real_hdfs.log
    Compare Files                      real_hdfs.log                            real/real_hdfs.ref

SmallintTest-HDFS
    [Documentation]    数据类型-SMALLINT-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  smallint/smallint.sql      smallint_hdfs.log
    Compare Files                      smallint_hdfs.log                        smallint/smallint_hdfs.ref

TimestampTest-HDFS
    [Documentation]    数据类型-TIMESTAMP-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  timestamp/timestamp.sql    timestamp_hdfs.log
    Compare Files                      timestamp_hdfs.log                       timestamp/timestamp_hdfs.ref

VarcharTest-HDFS
    [Documentation]    数据类型-VARCHAR-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  varchar/varchar.sql        varchar_hdfs.log
    Compare Files                      varchar_hdfs.log                         varchar/varchar_hdfs.ref

VarbinaryTest-HDFS
    [Documentation]    数据类型-VARBINARY-HDFS
    [Tags]     DATATYPE   HDFS
    Logon And Execute SQL Script       admin/123456  varbinary/varbinary.sql        varbinary_hdfs.log
    Compare Files                      varbinary_hdfs.log                           varbinary/varbinary_hdfs.ref


















