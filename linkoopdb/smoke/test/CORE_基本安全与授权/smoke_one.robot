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
	LOgon And Execute SQL Script     admin/123456  E081-01 SELECT privilege at the table level.sql
#    LOgon And Execute SQL Script     admin/123456  E081-02 DELETE privilege.sql
#    LOgon And Execute SQL Script     admin/123456  E081-03 INSERT privilege at the table level.sql
#    LOgon And Execute SQL Script     admin/123456  E081-04 UPDATE privilege at the table level.sql
#    LOgon And Execute SQL Script     admin/123456  E081-05 UPDATE privilege at the column level.sql
#    LOgon And Execute SQL Script     admin/123456  E081-08 WITH GRANT OPTION.sql

	Compare Files        E081-01 SELECT privilege at the table level.log    E081-01 SELECT privilege at the table level.ref
	Compare Files        E081-02 DELETE privilege.log    			  E081-02 DELETE privilege.ref
	Compare Files        E081-03 INSERT privilege at the table level.log                  E081-03 INSERT privilege at the table level.ref
	Compare Files        E081-04 UPDATE privilege at the table level.log                   E081-04 UPDATE privilege at the table level.ref
	Compare Files        E081-05 UPDATE privilege at the column level.log            E081-05 UPDATE privilege at the column level.ref
	Compare Files        E081-08 WITH GRANT OPTION.log              E081-08 WITH GRANT OPTION.ref

		


