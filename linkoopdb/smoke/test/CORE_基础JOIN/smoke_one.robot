*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:耿晨雨

*** Test Cases ***
SCHEMATEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test   
	LOgon And Execute SQL Script     admin/123456  F041-01 Inner join (but not necessarily the INNER keyword).sql
    LOgon And Execute SQL Script     admin/123456  F041-02 INNER keyword.sql
    LOgon And Execute SQL Script     admin/123456  F041-03 LEFT OUTER JOIN.sql
    LOgon And Execute SQL Script     admin/123456  F041-04 RIGHT OUTER JOIN.sql
    LOgon And Execute SQL Script     admin/123456  F041-05 Outer joins can be nested.sql
    LOgon And Execute SQL Script     admin/123456  F041-07 The inner table in a left or right outer join can also be used in an inner join.sql
    LOgon And Execute SQL Script     admin/123456  F401-04 CROSS JOIN.sql
    LOgon And Execute SQL Script     admin/123456  F041-08 All comparison operators are supported.sql

	Compare Files        F041-01 Inner join (but not necessarily the INNER keyword).log                  F041-01 Inner join (but not necessarily the INNER keyword).ref
	Compare Files        F041-02 INNER keyword.log    			                                         F041-02 INNER keyword.ref
	Compare Files        F041-03 LEFT OUTER JOIN.log                                                     F041-03 LEFT OUTER JOIN.ref
	Compare Files        F041-04 RIGHT OUTER JOIN.log                                                    F041-04 RIGHT OUTER JOIN.ref
	Compare Files        F041-05 Outer joins can be nested.log                                           F041-05 Outer joins can be nested.ref
	Compare Files        F041-07 The inner table in a left or right outer join can also be used in an inner join.log                  F041-07 The inner table in a left or right outer join can also be used in an inner join.ref
	Compare Files        F401-04 CROSS JOIN.log                                                          F401-04 CROSS JOIN.ref
	Compare Files        F041-08 All comparison operators are supported.log                              F041-08 All comparison operators are supported.ref



