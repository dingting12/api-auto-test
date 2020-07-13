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
	LOgon And Execute SQL Script     admin/123456  E101-01 INSERT statement.sql
    LOgon And Execute SQL Script     admin/123456  E101-03 Searched UPDATE statement.sql
    LOgon And Execute SQL Script     admin/123456  E101-04 Searched DELETE statement.sql
    LOgon And Execute SQL Script     admin/123456  F200 TRUNCATE TABLE statement.sql
    LOgon And Execute SQL Script     admin/123456  LDBX201-02 insert from subquery on dfs engine.sql
    LOgon And Execute SQL Script     admin/123456  LDBX201-06 insert by subquery对default值，not nullable约束的处理.sql

	Compare Files        E101-01 INSERT statement.log    E101-01 INSERT statement.ref
	Compare Files        E101-03 Searched UPDATE statement.log    			  E101-03 Searched UPDATE statement.ref
	Compare Files        E101-04 Searched DELETE statement.log                  E101-04 Searched DELETE statement.ref
	Compare Files        F200 TRUNCATE TABLE statement.log                   F200 TRUNCATE TABLE statement.ref
	Compare Files        LDBX201-02 insert from subquery on dfs engine.log            LDBX201-02 insert from subquery on dfs engine.ref
	Compare Files        LDBX201-06 insert by subquery对default值，not nullable约束的处理.log              LDBX201-06 insert by subquery对default值，not nullable约束的处理.ref

		


