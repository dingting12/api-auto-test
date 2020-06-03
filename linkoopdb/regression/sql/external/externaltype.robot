*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Metadata         Version    0.1
# 引用公共函数
Resource          ../../common/SetupRobot.robot

*** Test Cases ***
E101Test
    [Tags]     SQL-Test       external type test
    Setup Compare Settings
    Execute SQL Script        bigint/external_table_basic_type-bigint.sql
	Execute SQL Script        bigint/external_table_basic_type-int.sql
	Execute SQL Script        bigint/external_table_basic_type-char.sql
	Execute SQL Script        bigint/external_table_basic_type-varchar.sql
	Execute SQL Script        bigint/external_table_basic_type-smallint.sql
	Execute SQL Script        bigint/external_table_basic_type-float.sql
	Execute SQL Script        bigint/external_table_basic_type-double.sql
	Execute SQL Script        bigint/external_table_basic_type-real.sql
	Execute SQL Script        bigint/external_table_basic_type-decimal.sql
	Execute SQL Script        bigint/external_table_basic_type-numeric.sql
	Execute SQL Script        bigint/external_table_basic_type-date.sql
	Execute SQL Script        bigint/external_table_basic_type-timestamp.sql
	Execute SQL Script        bigint/external_table_basic_type-boolean.sql
    Compare Files             external_table_basic_type-bigint.log  bigint/external_table_basic_type-bigint.ref
	Compare Files             external_table_basic_type-int.log  bigint/external_table_basic_type-int.ref
	Compare Files             external_table_basic_type-char.log  bigint/external_table_basic_type-char.ref
	Compare Files             external_table_basic_type-varchar.log  bigint/external_table_basic_type-varchar.ref
	Compare Files             external_table_basic_type-smallint.log  bigint/external_table_basic_type-smallint.ref
	Compare Files             external_table_basic_type-float.log  bigint/external_table_basic_type-float.ref
	Compare Files             external_table_basic_type-double.log  bigint/external_table_basic_type-double.ref
	Compare Files             external_table_basic_type-real.log  bigint/external_table_basic_type-real.ref
	Compare Files             external_table_basic_type-decimal.log  bigint/external_table_basic_type-decimal.ref
	Compare Files             external_table_basic_type-numeric.log  bigint/external_table_basic_type-numeric.ref
	Compare Files             external_table_basic_type-date.log  bigint/external_table_basic_type-date.ref
	Compare Files             external_table_basic_type-timestamp.log  bigint/external_table_basic_type-timestamp.ref
	Compare Files             external_table_basic_type-boolean.log  bigint/external_table_basic_type-boolean.ref

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
