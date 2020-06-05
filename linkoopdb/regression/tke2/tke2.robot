*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面
Metadata         Version    0.1

# 引用公共函数
Resource          ../common/SetupRobot.robot

*** Test Cases ***
E101Test
    [Tags]     SQL-Test       Smoke
    Setup Linkoop SQL Test
    Setup Custom Compare Settings

    Execute SQL Script        tke2.sql
    Compare Files             tke2.log  tke2.ref

*** Keywords ***
Setup Custom Compare Settings
    # 这里设置一些用来覆盖默认Setup Linkoop SQL Test(定义在SetupRobot.robot中)中的配置信息
    Log to Console            ”....“
