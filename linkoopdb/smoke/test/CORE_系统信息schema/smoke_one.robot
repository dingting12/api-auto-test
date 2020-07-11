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
	LOgon And Execute SQL Script     admin/123456  F021 在系统表中标注schema是否大小写敏感.sql
    LOgon And Execute SQL Script     admin/123456  F021-01 COLUMNS view.sql
    LOgon And Execute SQL Script     admin/123456  F021-02 TABLES view.sql
    LOgon And Execute SQL Script     admin/123456  F021-03 VIEWS view.sql
    LOgon And Execute SQL Script     admin/123456  F501-01 SQL_FEATURES view.sql
    LOgon And Execute SQL Script     admin/123456  F501-02 SQL_SIZING view.sql
    LOgon And Execute SQL Script     admin/123456  F501-03 SQL_LANGUAGES view.sql
    LOgon And Execute SQL Script     admin/123456  S011-01 USER_DEFINED_TYPES view.sql
	Compare Files        F021 在系统表中标注schema是否大小写敏感.log    F021 在系统表中标注schema是否大小写敏感.ref
	Compare Files        F021-01 COLUMNS view.log    			  F021-01 COLUMNS view.ref
	Compare Files        F021-02 TABLES view.log                  F021-02 TABLES view.ref
	Compare Files        F021-03 VIEWS view.log                   F021-03 VIEWS view.ref
	Compare Files        F501-01 SQL_FEATURES view.log            F501-01 SQL_FEATURES view.ref
	Compare Files        F501-02 SQL_SIZING view.log              F501-02 SQL_SIZING view.ref
	Compare Files        F501-03 SQL_LANGUAGES view.log           F501-03 SQL_LANGUAGES view.ref
	Compare Files        S011-01 USER_DEFINED_TYPES view.log      S011-01 USER_DEFINED_TYPES view.ref
		


