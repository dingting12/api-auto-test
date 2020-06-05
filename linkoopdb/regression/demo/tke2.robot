*** Settings ***
Resource         ../common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    Compare Check Result

Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

*** Test Cases ***
E101Test
    # 给程序设置标记，开业设置多个Tag，用两个空格隔开， 方便在上层统一调用的时候，能够根据标记进行调用
    # 具体标记的规范，需要参考。。。。
    [Tags]     SQL-Test       Smoke

    # 这里所有对选项的修改都会覆盖在Setup Linkoop SQL Test提供的默认值
    # 这里需要根据具体Case的情况来调整具体的设置
    SQLCli Enable ConsoleOutput    True
    Compare Enable ConsoleOutput   True
    SQLCli Break When Error        False
    Compare Break When Difference  False

    Execute SQL Script             tke2.sql          tke2_hdfs.log
    Compare Files                  tke2_hdfs.log     tke2.ref

E102Test
    [Tags]     SQL-Test       Smoke

    SQLCli Set SQLMAPPING          tke2_pallas.map
    Execute SQL Script             tke2.sql          tke2_pallas.log
    Compare Files                  tke2_pallas.log   tke2.ref
