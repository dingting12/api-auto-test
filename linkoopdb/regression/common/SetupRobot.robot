*** Settings ***
Documentation     SetupRobot.py
...               Regress_Friendly    NO   # 表示这个程序不参与整体回归测试，正常Case请删除此行
Library           RunSQLCli.py
Library           RunCompare.py
Library           SetupRobot.py
Library           RunHDFSCommand.py
Library           RunSSHCommand.py
Library           OperatingSystem


*** Keywords ***
SQL Test Setup
    # 控制SQLCli在执行SQL语句中是否遇到错误，就立即终止后续的SQL执行
    # 默认是不终止，即使SQL有错误，整个SQL也会被执行完毕
    SQLCli Break When Error            False

    # 控制日志比对是否在遇到不一致现象的时候，是否在Jeenkins中直接抛出比对错误
    # 默认是抛出
    Compare Break When Difference      True

    # 控制SQLCli控制台是否显示输出，如果在Jenkins中运行，则打开后同样会在Jenkins的控制台上显示出来
    # 小心： 如果SQL中包含返回内容较多的查询，这样打开将导致测试报告文件很大，可能会变得无法阅读
    # 默认是关闭状态，即不显示SQLCli的输出
    SQLCli Enable ConsoleOutput        False

    # 控制SQLCli是否记录perf日志，打开后，会在LOG目录下生成一个perf文件
    # 默认是打开状态，即记录perf信息
    SQLCli Enable PerfLog              True

    # 控制Compare过程中如果发生比对不一致现象，是否将不一致的结果输出在控制台上。
    # 如果在Jenkins中运行，则打开后同样会在Jenkins的控制台上显示出来
    # 小心： 如果比对文件很大，这样打开将导致测试报告文件很大，可能会变得无法阅读
    # 默认是关闭状态，即不显示Compare的结果
    Compare Enable ConsoleOutput       True

    # 比对参考文件的时候忽略空白行
    Compare Ignore EmptyLine           True

    # 比对参考文件的时候使用正则表达式
    Compare Mask                       True

    # 比对文件的时候忽略大小写差异
    Compare IgnoreCase                 False

    # 比对文件的时候忽略内容的首末空格
    Compare IgnoreTailOrHeadBlank      False

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
    #     在HDFS和LDB运行中，可能会由于运行JOB的不同，WORKSPACE的不同，导致动态的location不同
    Compare Skip                       .*location.*

    # Case运行在脚本所在的目录下，切换当前工作目录
    SetupRoot CD CurrentDirectory      ${SUITE SOURCE}

    # 设置HDFS上传文件时候使用的用户名
    HDFS SetConnectedUser              ldbtest

SQL Test Clnup
    # 暂时空置
    Log to Console      "Test Completed."