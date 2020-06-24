*** Test Cases ***
Demo5
    [Documentation]    演示程序6, 使用Robot函数来实现HDFS数据操作
    Using variables

*** Keywords ***
With Teardown
    Do Something
    [Teardown]    Log    keyword teardown

Using variables
    [Documentation]    Teardown given as variable
    Do Something
    [Teardown]    ${TEARDOWN}