*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Metadata         Version    0.1
# 引用公共函数
Resource          ../../common/SetupRobot.robot

*** Test Cases ***
E101Test
    [Tags]     SQL-Test       Smoke
    Setup Compare Settings
    Logon And Execute SQL Script       admin/123456  bigint/bigint.sql
    Logon And Execute SQL Script       admin/123456  boolean/boolean.sql
    Logon And Execute SQL Script       admin/123456  char/char.sql
    Logon And Execute SQL Script       admin/123456  date/date.sql
    Logon And Execute SQL Script       admin/123456  decimal/decimal.sql
    Logon And Execute SQL Script       admin/123456  double/double.sql
    Logon And Execute SQL Script       admin/123456  float/float.sql
    Logon And Execute SQL Script       admin/123456  int/int.sql
    Logon And Execute SQL Script       admin/123456  numeric/numeric.sql
    Logon And Execute SQL Script       admin/123456  real/real.sql
    Logon And Execute SQL Script       admin/123456  smallint/smallint.sql
    Logon And Execute SQL Script       admin/123456  timestamp/timestamp.sql
    Logon And Execute SQL Script       admin/123456  varchar/varchar.sql

    Compare Files             bigint.log  bigint/bigint.ref
    Compare Files             boolean.log  boolean/boolean.ref
    Compare Files             char.log  char/char.ref
    Compare Files             date.log  date/date.ref
    Compare Files             decimal.log  decimal/decimal.ref
    Compare Files             double.log  double/double.ref
    Compare Files             float.log  float/float.ref
    Compare Files             int.log  int/int.ref
    Compare Files             numeric.log  numeric/numeric.ref
    Compare Files             real.log  real/real.ref
    Compare Files             smallint.log  smallint/smallint.ref
    Compare Files             timestamp.log  timestamp/timestamp.ref
    Compare Files             varchar.log  varchar/varchar.ref

*** Keywords ***
Setup Compare Settings
    # 比对参考文件的时候忽略空白行
    Compare Ignore EmptyLine           True
    # 比对参考文件的时候使用正则表达式
    Compare Mask                       True
    # 比对参考文件的时候跳过所有符合Running.*匹配的行
    Compare Skip                       Running.*
    Compare Skip                       REWROTED.*
    Compare Skip                       SQLCli.*
    Compare Skip                       REWROTED.*

    # 一旦遇到错误，就终止继续测试
    Compare Break When Difference      False
