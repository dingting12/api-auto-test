*** Settings ***
Documentation     SetupRobot.py
...               Regress_Friendly      No
Library           SQLCliLibrary
Library           CompareLibrary
Library           SetupRobot.py
Library           OperatingSystem


*** Keywords ***
SQL Test Setup
    # 控制SQLCli在执行SQL语句中是否遇到错误，就立即终止后续的SQL执行
    # 默认是不终止，即使SQL有错误，整个SQL也会被执行完毕
    SQLCli Break When Error            False

    # 控制日志比对是否在遇到不一致现象的时候，就立即终止本Case的后续测试工作
    # 默认是不终止，即使比对发生错误，测试也会继续运行下去
    Compare Break When Difference      False

    # 控制SQLCli控制台是否显示输出，如果在Jenkins中运行，则打开后同样会在Jenkins的控制台上显示出来
    # 小心： 如果SQL中包含返回内容较多的查询，这样打开将导致测试报告文件很大，可能会变得无法阅读
    # 默认是关闭状态，即不显示SQLCli的输出
    SQLCli Enable ConsoleOutput        False

    # 控制Compare过程中如果发生比对不一致现象，是否将不一致的结果输出在控制台上。
    # 如果在Jenkins中运行，则打开后同样会在Jenkins的控制台上显示出来
    # 小心： 如果比对文件很大，这样打开将导致测试报告文件很大，可能会变得无法阅读
    # 默认是关闭状态，即不显示Compare的结果
    Compare Enable ConsoleOutput       False

    # 比对参考文件的时候忽略空白行
    Compare Ignore EmptyLine           True
    # 比对参考文件的时候使用正则表达式
    Compare Mask                       True
    # 比对参考文件的时候跳过所有符合以下标记的行
    #     Running time elapsed 是程序的运行时长，由于每次运行都可能不一致，所以比对没有意义
    Compare Skip                       Running time elapsed.*
    #     Current clock time   是脚本的当前结束时间，由于每次运行都可能不一致，所以比对没有意义
    Compare Skip                       Current clock time.*
    #     REWROTED             被SQLMAPPING文件改写了的SQL信息，在不同的SQLMAP下，可能会不一样，所以比对没有意义
    Compare Skip                       REWROTED.*
    #     SQLCli版本号，        由于版本的更新，版本号比对没有意义
    Compare Skip                       SQLCli Release .*
    #     start                start开始的是在具体执行某一个脚本，在执行中由于路径名不同，具体start后面的信息也会不同，所以不再比对
    Compare Skip                       SQL\> start .*

    # 每次Case运行前重置日志比对不一致的次数
    Compare Reset FailedCount

    # Case运行在脚本所在的目录下，切换当前工作目录
    SetupRoot CD CurrentDirectory      ${SUITE SOURCE}

SQL Test Clnup
    # 检查SQL运行是否有错误
    Compare Check Result