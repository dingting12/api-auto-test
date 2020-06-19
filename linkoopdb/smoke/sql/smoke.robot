*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
SMOKETEST   
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test
    Logon And Execute SQL Script     admin/123456                     CORE_基本PSM.sql
	               Compare Files     CORE_基本PSM.log                 CORE_基本PSM.ref
	LOgon And Execute SQL Script     admin/123456                     CORE_cast_case.sql
	               Compare Files     CORE_cast_case.log               CORE_cast_case.ref 
	LOgon And Execute SQL Script     admin/123456                     CORE_null与基本完整性约束.sql
	               Compare Files     CORE_null与基本完整性约束.log    CORE_null与基本完整性约束.ref
	LOgon And Execute SQL Script     admin/123456                     CORE_Schema_DDL.sql
				   Compare Files     CORE_Schema_DDL.log              CORE_Schema_DDL.ref 
    LOgon And Execute SQL Script     admin/123456                     CORE_Subquery.sql
				   Compare Files     CORE_Subquery.log   			  CORE_Subquery.ref 
	LOgon And Execute SQL Script     admin/123456                     CORE_view.sql
	               Compare Files     CORE_view.log  				  CORE_view.ref 
	LOgon And Execute SQL Script     admin/123456  					  CORE_单行语句与基本游标支持.sql
				   Compare Files     CORE_单行语句与基本游标支持.log  CORE_单行语句与基本游标支持.ref 
	LOgon And Execute SQL Script     admin/123456                     DBLink-hive.sql
	               Compare Files     DBLink-hive.log      			  DBLink-hive.ref
	LOgon And Execute SQL Script     admin/123456                     DBLink-mysql.sql
	               Compare Files     DBLink-mysql.log 				  DBLink-mysql.ref 
	LOgon And Execute SQL Script     admin/123456                     DBLink-oracle.sql
	               Compare Files	 DBLink-oracle.log                DBLink-oracle.ref 
	LOgon And Execute SQL Script     admin/123456                     DBLink-Postgres.sql
	               Compare Files	 DBLink-Postgres.log              DBLink-Postgres.ref 
	LOgon And Execute SQL Script     admin/123456  					  DBLink-SqlServer.sql
	               Compare Files	 DBLink-SqlServer.log             DBLink-SqlServer.ref 
	LOgon And Execute SQL Script     admin/123456  					  DBLink-TeraData.sql
	               Compare Files	 DBLink-TeraData.log              DBLink-TeraData.ref 
	LOgon And Execute SQL Script     admin/123456  					  LDB_EXT_机器学习基本算子.sql
				   Compare Files	 LDB_EXT_机器学习基本算子.log 	  LDB_EXT_机器学习基本算子.ref
	LOgon And Execute SQL Script     admin/123456  					  LDB_EXT_内置函数.sql
				   Compare Files	 LDB_EXT_内置函数.log        	  LDB_EXT_内置函数.ref 
	LOgon And Execute SQL Script     admin/123456  					  LDB_EXT_特征工程.sql
				   Compare Files	 LDB_EXT_特征工程.log			  LDB_EXT_特征工程.ref 
	LOgon And Execute SQL Script     admin/123456  				      LDB_EXT_资源管控.sql
	               Compare Files	 LDB_EXT_资源管控.log             LDB_EXT_资源管控.ref 
	LOgon And Execute SQL Script     admin/123456  				      OLAP_CUBE.sql
	               Compare Files	 OLAP_CUBE.log                    OLAP_CUBE.ref
	LOgon And Execute SQL Script     admin/123456   			      ldbdist.sql
	               Compare Files	 ldbdist.log                      ldbdist.ref 
	LOgon And Execute SQL Script     admin/123456                     Stored_procedure.sql
	               Compare Files	 Stored_procedure.log             Stored_procedure.ref 
	LOgon And Execute SQL Script     admin/123456                     LDB_EXT_Partition-Bucket-index.sql
	               Compare Files	 LDB_EXT_Partition-Bucket-index.log  LDB_EXT_Partition-Bucket-index.ref 
	LOgon And Execute SQL Script     admin/123456                     OLAP_Window_Function.sql
	               Compare Files	 OLAP_Window_Function.log         OLAP_Window_Function.ref 
                  	
*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True

