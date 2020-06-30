*** Settings ***
Documentation    测试套件说明
...              演示程序
...              Regress_Friendly    YES   # 表示这个程序不参与整体回归测试，正常Case请删除此行

*** Test Cases ***
Test title
    Log to Console  "aaaaaa"