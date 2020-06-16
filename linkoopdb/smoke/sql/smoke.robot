*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
SMOKETEST   
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test
    Logon And Execute SQL Script     admin/123456  CORE_基本PSM.sql
	LOgon And Execute SQL Script     admin/123456  CORE_cast_case.sql
	LOgon And Execute SQL Script     admin/123456  CORE_null与基本完整性约束.sql
	LOgon And Execute SQL Script     admin/123456  CORE_Schema_DDL.sql
	LOgon And Execute SQL Script     admin/123456  CORE_Subquery.sql
	LOgon And Execute SQL Script     admin/123456  CORE_view.sql
	LOgon And Execute SQL Script     admin/123456  CORE_单行语句与基本游标支持.sql
	LOgon And Execute SQL Script     admin/123456  DBLink-hive.sql
	LOgon And Execute SQL Script     admin/123456  DBLink-mysql.sql
	LOgon And Execute SQL Script     admin/123456  DBLink-oracle.sql
	LOgon And Execute SQL Script     admin/123456  DBLink-Postgres.sql
	LOgon And Execute SQL Script     admin/123456  DBLink-SqlServer.sql
	LOgon And Execute SQL Script     admin/123456  DBLink-TeraData.sql
	LOgon And Execute SQL Script     admin/123456  LDB_EXT_External_Table-HDFS.sql
	LOgon And Execute SQL Script     admin/123456  LDB_EXT_机器学习基本算子.sql
	LOgon And Execute SQL Script     admin/123456  LDB_EXT_内置函数.sql
	LOgon And Execute SQL Script     admin/123456  LDB_EXT_特征工程.sql
	LOgon And Execute SQL Script     admin/123456  LDB_EXT_资源管控.sql
	LOgon And Execute SQL Script     admin/123456  OLAP_CUBE.sql
	LOgon And Execute SQL Script     admin/123456  ldbdist.sql
	LOgon And Execute SQL Script     admin/123456  Stored_procedure.sql
	LOgon And Execute SQL Script     admin/123456  LDB_EXT_Partition-Bucket-index.sql
    Compare Files        CORE_基本PSM.log                 CORE_基本PSM.ref              
	Compare Files        CORE_cast_case.log    			  CORE_cast_case.ref 
	Compare Files        CORE_null与基本完整性约束.log    CORE_null与基本完整性约束.ref 
	Compare Files        CORE_Schema_DDL.log              CORE_Schema_DDL.ref 
	Compare Files        CORE_Subquery.log   			  CORE_Subquery.ref 
	Compare Files        CORE_view.log  				  CORE_view.ref 
	Compare Files        CORE_单行语句与基本游标支持.log  CORE_单行语句与基本游标支持.ref 
	Compare Files        DBLink-hive.log      			  DBLink-hive.ref 
    Compare Files        DBLink-mysql.log 				  DBLink-mysql.ref 
	Compare Files	     DBLink-oracle.log                DBLink-oracle.ref 
	Compare Files		 DBLink-Postgres.log              DBLink-Postgres.ref 
	Compare Files		 DBLink-SqlServer.log             DBLink-SqlServer.ref 
	Compare Files		 DBLink-TeraData.log              DBLink-TeraData.ref 
	Compare Files        LDB_EXT_External_Table-HDFS.log  LDB_EXT_External_Table-HDFS.ref 
	Compare Files		 LDB_EXT_机器学习基本算子.log 	  LDB_EXT_机器学习基本算子.ref 
	Compare Files		 LDB_EXT_内置函数.log        	  LDB_EXT_内置函数.ref 
	Compare Files		 LDB_EXT_特征工程.log			  LDB_EXT_特征工程.ref 
	Compare Files		 LDB_EXT_资源管控.log             LDB_EXT_资源管控.ref 
	Compare Files		 OLAP_CUBE.log                    OLAP_CUBE.ref 
	Compare Files		 ldbdist.log                      ldbdist.ref 
	Compare Files		 Stored_procedure.log             Stored_procedure.ref 
	Compare Files		 LDB_EXT_Partition-Bucket-index.log  LDB_EXT_Partition-Bucket-index.ref 
		


