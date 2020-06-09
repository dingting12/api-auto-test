*** Settings ***
Documentation    表数据操作
...              包含更新数据、删除数据、删除表、添加索引和计数操作
Metadata         Version    0.1
# 引用公共函数
Resource          ../../regression/common/SetupRobot.robot

*** Test Cases ***
LoadTest
    [Tags]     SQL-Test       Smoke
    Setup Compare Settings
    Execute SQL Script        count_case.sql
    Execute SQL Script        delete_case.sql
    Execute SQL Script        index_case.sql
    Execute SQL Script        update_case.sql
    Compare Files             count_case.log  count_case.ref
    Compare Files             delete_case.log  delete_case.ref
    Compare Files             index_case.log  index_case.ref
    Compare Files             update_case.log  update_case.ref

    Execute SQL Script        drop_case.sql
    Compare Files             drop_case.log  drop_case.ref

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
    Compare Skip                       start.*

    # 一旦遇到错误，就终止继续测试
    Compare Break When Difference      False