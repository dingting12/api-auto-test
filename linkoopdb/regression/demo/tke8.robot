*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup

*** Settings ***
Documentation    测试套件说明
...              演示程序
...              Regress_Friendly    YES   # 表示这个程序不参与整体回归测试，正常Case请删除此行
Force Tags       owner:赵石

*** Test Cases ***
Test title
    Hello