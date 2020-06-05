*** Settings ***
Library           SQLCliLibrary
Library           CompareLibrary
Library           SetupRobot.py
Library           OperatingSystem

*** Keywords ***
Setup Linkoop SQL Test
    # SQLCli遇到SQL错误会终止继续执行
    SQLCli Break When Error            False
    # 一旦遇到错误，就终止继续测试
    Compare Break When Difference      False

    # SQLCli会显示所有SQL执行过程到控制台上
    SQLCli Enable ConsoleOutput        False
    # 文件比对的时候是否将差异信息显示到控制台上
    Compare Enable ConsoleOutput       False

    # 比对参考文件的时候忽略空白行
    Compare Ignore EmptyLine           True
    # 比对参考文件的时候使用正则表达式
    Compare Mask                       True
    # 比对参考文件的时候跳过所有符合以下条件的行
    Compare Skip                       Running time elapsed.*
    Compare Skip                       Current clock time.*
    Compare Skip                       REWROTED.*
    Compare Skip                       SQLCli Release .*
    Compare Skip                       start .*
