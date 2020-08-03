*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Library          OperatingSystem
Force Tags       owner:丁婷

*** Test Cases ***
SMOKETEST   
	[Documentation]    冒烟测试
    [Tags]     SMOKE
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

PrivilegeTest
	[Documentation]    基本安全与授权测试
    [Tags]    SMOKE  PRIVILEGE
	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本安全与授权/E081-01 SELECT privilege at the table level.sql                                                            E081-01 SELECT privilege at the table level.log
	Compare Files        E081-01 SELECT privilege at the table level.log        										../test/CORE_基本安全与授权/E081-01 SELECT privilege at the table level.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本安全与授权/E081-02 DELETE privilege.sql                                                                               E081-02 DELETE privilege.log
    Compare Files        E081-02 DELETE privilege.log    			            										../test/CORE_基本安全与授权/E081-02 DELETE privilege.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本安全与授权/E081-03 INSERT privilege at the table level.sql                                                            E081-03 INSERT privilege at the table level.log
	Compare Files        E081-03 INSERT privilege at the table level.log        										../test/CORE_基本安全与授权/E081-03 INSERT privilege at the table level.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本安全与授权/E081-04 UPDATE privilege at the table level.sql                                                            E081-04 UPDATE privilege at the table level.log
	Compare Files        E081-04 UPDATE privilege at the table level.log        										../test/CORE_基本安全与授权/E081-04 UPDATE privilege at the table level.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本安全与授权/E081-05 UPDATE privilege at the column level.sql                                                           E081-05 UPDATE privilege at the column level.log
 	Compare Files        E081-05 UPDATE privilege at the column level.log       										../test/CORE_基本安全与授权/E081-05 UPDATE privilege at the column level.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本安全与授权/E081-08 WITH GRANT OPTION.sql                                                                              E081-08 WITH GRANT OPTION.log
	Compare Files        E081-08 WITH GRANT OPTION.log                          										../test/CORE_基本安全与授权/E081-08 WITH GRANT OPTION.ref

BaseDataTest
	[Documentation]    基本数据管理测试
    [Tags]     SMOKE
	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本数据管理/E101-01 INSERT statement.sql                                                                                 E101-01 INSERT statement.log
	Compare Files        E101-01 INSERT statement.log    																../test/CORE_基本数据管理/E101-01 INSERT statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本数据管理/E101-03 Searched UPDATE statement.sql                                                                        E101-03 Searched UPDATE statement.log
 	Compare Files        E101-03 Searched UPDATE statement.log    			  											../test/CORE_基本数据管理/E101-03 Searched UPDATE statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本数据管理/E101-04 Searched DELETE statement.sql                                                                        E101-04 Searched DELETE statement.log
	Compare Files        E101-04 Searched DELETE statement.log                  										../test/CORE_基本数据管理/E101-04 Searched DELETE statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本数据管理/F200 TRUNCATE TABLE statement.sql                                                                            F200 TRUNCATE TABLE statement.log
	Compare Files        F200 TRUNCATE TABLE statement.log                   											../test/CORE_基本数据管理/F200 TRUNCATE TABLE statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本数据管理/LDBX201-02 insert from subquery on dfs engine.sql                                                            LDBX201-02 insert from subquery on dfs engine.log
	Compare Files        LDBX201-02 insert from subquery on dfs engine.log            									../test/CORE_基本数据管理/LDBX201-02 insert from subquery on dfs engine.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本数据管理/LDBX201-06 insert by subquery对default值，not nullable约束的处理.sql                                         LDBX201-06 insert by subquery对default值，not nullable约束的处理.log
	Compare Files        LDBX201-06 insert by subquery对default值，not nullable约束的处理.log              				../test/CORE_基本数据管理/LDBX201-06 insert by subquery对default值，not nullable约束的处理.ref

SystemSchemaTest
	[Documentation]    系统信息schema测试
    [Tags]   SMOKE  SYSTABLE
	LOgon And Execute SQL Script     admin/123456  ../test/CORE_系统信息schema/F021 在系统表中标注schema是否大小写敏感.sql                                                                F021 在系统表中标注schema是否大小写敏感.log
	Compare Files        F021 在系统表中标注schema是否大小写敏感.log    												../test/CORE_系统信息schema/F021 在系统表中标注schema是否大小写敏感.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_系统信息schema/F021-01 COLUMNS view.sql                                                                                   F021-01 COLUMNS view.log
	Compare Files        F021-01 COLUMNS view.log    			  														../test/CORE_系统信息schema/F021-01 COLUMNS view.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_系统信息schema/F021-02 TABLES view.sql                                                                                    F021-02 TABLES view.log
	Compare Files        F021-02 TABLES view.log                  														../test/CORE_系统信息schema/F021-02 TABLES view.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_系统信息schema/F021-03 VIEWS view.sql                                                                                     F021-03 VIEWS view.log
	Compare Files        F021-03 VIEWS view.log                   														../test/CORE_系统信息schema/F021-03 VIEWS view.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_系统信息schema/F501-01 SQL_FEATURES view.sql                                                                              F501-01 SQL_FEATURES view.log
	Compare Files        F501-01 SQL_FEATURES view.log            														../test/CORE_系统信息schema/F501-01 SQL_FEATURES view.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_系统信息schema/F501-02 SQL_SIZING view.sql                                                                                F501-02 SQL_SIZING view.log
 	Compare Files        F501-02 SQL_SIZING view.log              														../test/CORE_系统信息schema/F501-02 SQL_SIZING view.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_系统信息schema/F501-03 SQL_LANGUAGES view.sql                                                                             F501-03 SQL_LANGUAGES view.log
	Compare Files        F501-03 SQL_LANGUAGES view.log           														../test/CORE_系统信息schema/F501-03 SQL_LANGUAGES view.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_系统信息schema/S011-01 USER_DEFINED_TYPES view.sql                                                                        S011-01 USER_DEFINED_TYPES view.log
	Compare Files        S011-01 USER_DEFINED_TYPES view.log      														../test/CORE_系统信息schema/S011-01 USER_DEFINED_TYPES view.ref

SchemaTest
	[Documentation]    基本schema管理测试
    [Tags]     SMOKE
	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/F031 Configurable compact output parallel.sql                                                              F031 Configurable compact output parallel.log
	Compare Files        F031 Configurable compact output parallel.log                             						../test/CORE_基本schema管理/F031 Configurable compact output parallel.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/F031-01 CREATE TABLE statement to create persistent base tables.sql                                        F031-01 CREATE TABLE statement to create persistent base tables.log
 	Compare Files        F031-01 CREATE TABLE statement to create persistent base tables.log       						../test/CORE_基本schema管理/F031-01 CREATE TABLE statement to create persistent base tables.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/F031-02 CREATE VIEW statement.sql                                                                          F031-02 CREATE VIEW statement.log
	Compare Files        F031-02 CREATE VIEW statement.log                                         						../test/CORE_基本schema管理/F031-02 CREATE VIEW statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/F031-03 GRANT statement.sql                                                                                F031-03 GRANT statement.log
	Compare Files        F031-03 GRANT statement.log                                               						../test/CORE_基本schema管理/F031-03 GRANT statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/F031-04 ALTER TABLE statement.sql                                                                          F031-04 ALTER TABLE statement.log
	Compare Files        F031-04 ALTER TABLE statement.log                                         						../test/CORE_基本schema管理/F031-04 ALTER TABLE statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/F031-13 DROP TABLE statement.sql                                                                           F031-13 DROP TABLE statement.log
 	Compare Files        F031-13 DROP TABLE statement.log                                          						../test/CORE_基本schema管理/F031-13 DROP TABLE statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/F031-16 DROP VIEW statement.sql                                                                            F031-16 DROP VIEW statement.log
	Compare Files        F031-16 DROP VIEW statement.log                                           						../test/CORE_基本schema管理/F031-16 DROP VIEW statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/F031-19 REVOKE statement.sql                                                                               F031-19 REVOKE statement.log
	Compare Files        F031-19 REVOKE statement.log                                              						../test/CORE_基本schema管理/F031-19 REVOKE statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/F382 Alter column data type.sql                                                                            F382 Alter column data type.log
    Compare Files        F382 Alter column data type.log                                           						../test/CORE_基本schema管理/F382 Alter column data type.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/LDBX031-07 中文表名，列名的支持.sql                                                                        LDBX031-07 中文表名，列名的支持.log
    Compare Files        LDBX031-07 中文表名，列名的支持.log                                       						../test/CORE_基本schema管理/LDBX031-07 中文表名，列名的支持.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/LDBX141-02 Copy model by copying files.sql                                                                 LDBX141-02 Copy model by copying files.log
    Compare Files        LDBX141-02 Copy model by copying files.log                                						../test/CORE_基本schema管理/LDBX141-02 Copy model by copying files.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本schema管理/T171 LIKE clause in table definition.sql                                                                   T171 LIKE clause in table definition.log
    Compare Files        T171 LIKE clause in table definition.log                                  						../test/CORE_基本schema管理/T171 LIKE clause in table definition.ref


QueryTest
	[Documentation]    基本查询schema测试
    [Tags]     SMOKE
	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E051-01 SELECT DISTINCT.sql                                                                                      E051-01 SELECT DISTINCT.log
    Compare Files        E051-01 SELECT DISTINCT.log                                                                	../test/CORE_基本查询/E051-01 SELECT DISTINCT.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E051-02 GROUP BY clause.sql                                                                                      E051-02 GROUP BY clause.log
    Compare Files        E051-02 GROUP BY clause.log                                                                	../test/CORE_基本查询/E051-02 GROUP BY clause.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E051-04 GROUP BY can contain columns not in list.sql                                                             E051-04 GROUP BY can contain columns not in list.log
    Compare Files        E051-04 GROUP BY can contain columns not in list.log                                       	../test/CORE_基本查询/E051-04 GROUP BY can contain columns not in list.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E051-05 Select list items can be renamed.sql                                                                     E051-05 Select list items can be renamed.log
    Compare Files        E051-05 Select list items can be renamed.log                                               	../test/CORE_基本查询/E051-05 Select list items can be renamed.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E051-06 HAVING clause.sql                                                                                        E051-06 HAVING clause.log
    Compare Files        E051-06 HAVING clause.log                                                                  	../test/CORE_基本查询/E051-06 HAVING clause.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E051-07 Qualified all in select list.sql                                                                         E051-07 Qualified all in select list.log
    Compare Files        E051-07 Qualified all in select list.log                                                   	../test/CORE_基本查询/E051-07 Qualified all in select list.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E051-08 Correlation names in the FROM clause.sql                                                                 E051-08 Correlation names in the FROM clause.log
    Compare Files        E051-08 Correlation names in the FROM clause.log                                           	../test/CORE_基本查询/E051-08 Correlation names in the FROM clause.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E051-09 Rename columns in the FROM clause.sql                                                                    E051-09 Rename columns in the FROM clause.log
    Compare Files        E051-09 Rename columns in the FROM clause.log                                              	../test/CORE_基本查询/E051-09 Rename columns in the FROM clause.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-01 Comparison predicate.sql                                                                                 E061-01 Comparison predicate.log
    Compare Files        E061-01 Comparison predicate.log                                                           	../test/CORE_基本查询/E061-01 Comparison predicate.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-02 BETWEEN predicate.sql                                                                                    E061-02 BETWEEN predicate.log
    Compare Files        E061-02 BETWEEN predicate.log                                                              	../test/CORE_基本查询/E061-02 BETWEEN predicate.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-03 IN predicate with list of values.sql                                                                     E061-03 IN predicate with list of values.log
    Compare Files        E061-03 IN predicate with list of values.log                                               	../test/CORE_基本查询/E061-03 IN predicate with list of values.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-04 LIKE predicate.sql                                                                                       E061-04 LIKE predicate.log
    Compare Files        E061-04 LIKE predicate.log                                                                 	../test/CORE_基本查询/E061-04 LIKE predicate.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-05 LIKE predicate ESCAPE clause.sql                                                                         E061-05 LIKE predicate ESCAPE clause.log
    Compare Files        E061-05 LIKE predicate ESCAPE clause.log                                                   	../test/CORE_基本查询/E061-05 LIKE predicate ESCAPE clause.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-06 NULL predicate.sql                                                                                       E061-06 NULL predicate.log
    Compare Files        E061-06 NULL predicate.log                                                                 	../test/CORE_基本查询/E061-06 NULL predicate.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-07 Quantified comparison predicate.sql                                                                      E061-07 Quantified comparison predicate.log
    Compare Files        E061-07 Quantified comparison predicate.log                                                	../test/CORE_基本查询/E061-07 Quantified comparison predicate.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-08 EXISTS predicate.sql                                                                                     E061-08 EXISTS predicate.log
    Compare Files        E061-08 EXISTS predicate.log                                                               	../test/CORE_基本查询/E061-08 EXISTS predicate.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-13 Correlated subqueries.sql                                                                                E061-13 Correlated subqueries.log
    Compare Files        E061-13 Correlated subqueries.log                                                          	../test/CORE_基本查询/E061-13 Correlated subqueries.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E061-14 Search condition.sql                                                                                     E061-14 Search condition.log
    Compare Files        E061-14 Search condition.log                                                               	../test/CORE_基本查询/E061-14 Search condition.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E071-01 UNION DISTINCT table operator.sql                                                                        E071-01 UNION DISTINCT table operator.log
    Compare Files        E071-01 UNION DISTINCT table operator.log                                                  	../test/CORE_基本查询/E071-01 UNION DISTINCT table operator.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E071-02 UNION ALL table operator.sql                                                                             E071-02 UNION ALL table operator.log
    Compare Files        E071-02 UNION ALL table operator.log                                                       	../test/CORE_基本查询/E071-02 UNION ALL table operator.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E071-03 EXCEPT DISTINCT table operator.sql                                                                       E071-03 EXCEPT DISTINCT table operator.log
    Compare Files        E071-03 EXCEPT DISTINCT table operator.log                                                 	../test/CORE_基本查询/E071-03 EXCEPT DISTINCT table operator.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E071-05 Columns combined via table operators need not have exactly the same data type.sql                        E071-05 Columns combined via table operators need not have exactly the same data type.log
    Compare Files        E071-05 Columns combined via table operators need not have exactly the same data type.log  	../test/CORE_基本查询/E071-05 Columns combined via table operators need not have exactly the same data type.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/E071-06 Table operators in subqueries.sql                                                                        E071-06 Table operators in subqueries.log
    Compare Files        E071-06 Table operators in subqueries.log                                                  	../test/CORE_基本查询/E071-06 Table operators in subqueries.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基本查询/LDBX107-03 Query with both system tables and user tables.sql                                                     LDBX107-03 Query with both system tables and user tables.log
    Compare Files        LDBX107-03 Query with both system tables and user tables.log                               	../test/CORE_基本查询/LDBX107-03 Query with both system tables and user tables.ref

JoinTest
	[Documentation]    基础JOIN测试
    [Tags]    SMOKE   JOIN
	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基础JOIN/F041-01 Inner join (but not necessarily the INNER keyword).sql                                                   F041-01 Inner join (but not necessarily the INNER keyword).log
	Compare Files        F041-01 Inner join (but not necessarily the INNER keyword).log                  				../test/CORE_基础JOIN/F041-01 Inner join (but not necessarily the INNER keyword).ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基础JOIN/F041-02 INNER keyword.sql                                                                                        F041-02 INNER keyword.log
	Compare Files        F041-02 INNER keyword.log    			                                         				../test/CORE_基础JOIN/F041-02 INNER keyword.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基础JOIN/F041-03 LEFT OUTER JOIN.sql                                                                                      F041-03 LEFT OUTER JOIN.log
	Compare Files        F041-03 LEFT OUTER JOIN.log                                                     				../test/CORE_基础JOIN/F041-03 LEFT OUTER JOIN.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基础JOIN/F041-04 RIGHT OUTER JOIN.sql                                                                                     F041-04 RIGHT OUTER JOIN.log
	Compare Files        F041-04 RIGHT OUTER JOIN.log                                                    				../test/CORE_基础JOIN/F041-04 RIGHT OUTER JOIN.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基础JOIN/F041-05 Outer joins can be nested.sql                                                                            F041-05 Outer joins can be nested.log
	Compare Files        F041-05 Outer joins can be nested.log                                           				../test/CORE_基础JOIN/F041-05 Outer joins can be nested.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基础JOIN/F041-07 The inner table in a left or right outer join can also be used in an inner join.sql                      F041-07 The inner table in a left or right outer join can also be used in an inner join.log
	Compare Files        F041-07 The inner table in a left or right outer join can also be used in an inner join.log    ../test/CORE_基础JOIN/F041-07 The inner table in a left or right outer join can also be used in an inner join.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基础JOIN/F401-04 CROSS JOIN.sql                                                                                           F401-04 CROSS JOIN.log
	Compare Files        F401-04 CROSS JOIN.log                                                          				../test/CORE_基础JOIN/F401-04 CROSS JOIN.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_基础JOIN/F041-08 All comparison operators are supported.sql                                                               F041-08 All comparison operators are supported.log
	Compare Files        F041-08 All comparison operators are supported.log                              				../test/CORE_基础JOIN/F041-08 All comparison operators are supported.ref

DataTypeTest
	[Documentation]    数据类型测试
    [Tags]   SMOKE    DATATYPE
	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/E011-04 Arithmetic operators.sql                                                                                 E011-04 Arithmetic operators.log
     Compare Files   	 E011-04 Arithmetic operators.log                                              					../test/CORE_数据类型/E011-04 Arithmetic operators.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/E011-05 Numeric comparison.sql                                                                                   E011-05 Numeric comparison.log
    Compare Files   	 E011-05 Numeric comparison.log                                                					../test/CORE_数据类型/E011-05 Numeric comparison.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/E011-06 Implicit casting among the numeric data types.sql                                                        E011-06 Implicit casting among the numeric data types.log
    Compare Files   	 E011-06 Implicit casting among the numeric data types.log                     					../test/CORE_数据类型/E011-06 Implicit casting among the numeric data types.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/E011_E021_F051.sql                                                                                               E011_E021_F051.log
    Compare Files   	 E011_E021_F051.log                                                            					../test/CORE_数据类型/E011_E021_F051.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/E021-03 Character literals.sql                                                                                   E021-03 Character literals.log
    Compare Files   	 E021-03 Character literals.log                                                					../test/CORE_数据类型/E021-03 Character literals.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/E021-function.sql                                                                                                E021-function.log
    Compare Files   	 E021-function.log                                                             					../test/CORE_数据类型/E021-function.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/E031-01-02-03.sql                                                                                                E031-01-02-03.log
    Compare Files   	 E031-01-02-03.log                                                             					../test/CORE_数据类型/E031-01-02-03.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/F051-01 DATE data type (including support of DATE literal).sql                                                   F051-01 DATE data type (including support of DATE literal).log
    Compare Files   	 F051-01 DATE data type (including support of DATE literal).log                					../test/CORE_数据类型/F051-01 DATE data type (including support of DATE literal).ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/F051-03 TIMESTAMP data type.sql                                                                                  F051-03 TIMESTAMP data type.log
    Compare Files   	 F051-03 TIMESTAMP data type.log                                               					../test/CORE_数据类型/F051-03 TIMESTAMP data type.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.sql                                         F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.log
    Compare Files   	 F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.log      					../test/CORE_数据类型/F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/F051-05 Explicit CAST between datetime types and character string types.sql                                      F051-05 Explicit CAST between datetime types and character string types.log
    Compare Files   	 F051-05 Explicit CAST between datetime types and character string types.log   					../test/CORE_数据类型/F051-05 Explicit CAST between datetime types and character string types.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/F051-06 CURRENT_DATE.sql                                                                                         F051-06 CURRENT_DATE.log
    Compare Files   	 F051-06 CURRENT_DATE.log                                                      					../test/CORE_数据类型/F051-06 CURRENT_DATE.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_数据类型/F051-07-08 LOCALTIME_LOCALTIMESTAMP.sql                                                                          F051-07-08 LOCALTIME_LOCALTIMESTAMP.log
    Compare Files   	 F051-07-08 LOCALTIME_LOCALTIMESTAMP.log                                       					../test/CORE_数据类型/F051-07-08 LOCALTIME_LOCALTIMESTAMP.ref

SetFunctionTest
	[Documentation]    集合函数测试
    [Tags]     SMOKE   FUNCTION
	LOgon And Execute SQL Script     admin/123456  ../test/CORE_集合函数/E091-01 AVG.sql                                                                                                  E091-01 AVG.log
	Compare Files        E091-01 AVG.log                  																../test/CORE_集合函数/E091-01 AVG.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_集合函数/E091-02 COUNT.sql                                                                                                E091-02 COUNT.log
	Compare Files        E091-02 COUNT.log    			  																../test/CORE_集合函数/E091-02 COUNT.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_集合函数/E091-03 MAX.sql                                                                                                  E091-03 MAX.log
	Compare Files        E091-03 MAX.log                  																../test/CORE_集合函数/E091-03 MAX.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_集合函数/E091-04 MIN.sql                                                                                                  E091-04 MIN.log
	Compare Files        E091-04 MIN.log                  																../test/CORE_集合函数/E091-04 MIN.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_集合函数/E091-05 SUM.sql                                                                                                  E091-05 SUM.log
	Compare Files        E091-05 SUM.log                  																../test/CORE_集合函数/E091-05 SUM.ref

	LOgon And Execute SQL Script     admin/123456  ../test/CORE_集合函数/E091-07 DISTINCT quantifier.sql                                                                                  E091-07 DISTINCT quantifier.log
	Compare Files        E091-07 DISTINCT quantifier.log  																../test/CORE_集合函数/E091-07 DISTINCT quantifier.ref


StatisticsTest
	[Documentation]    Statistics采集测试
    [Tags]     SMOKE 
	LOgon And Execute SQL Script     admin/123456  ../test/LDB_EXT_Statistics_采集/LDBX001 ANALYZE statement to collect statistics.sql                                                    LDBX001 ANALYZE statement to collect statistics.log
	Compare Files        LDBX001 ANALYZE statement to collect statistics.log    										../test/LDB_EXT_Statistics_采集/LDBX001 ANALYZE statement to collect statistics.ref

	LOgon And Execute SQL Script     admin/123456  ../test/LDB_EXT_Statistics_采集/LDBX001-01 Basic ANALYZE.sql                                                                           LDBX001-01 Basic ANALYZE.log
	Compare Files        LDBX001-01 Basic ANALYZE.log    			 													../test/LDB_EXT_Statistics_采集/LDBX001-01 Basic ANALYZE.ref

	LOgon And Execute SQL Script     admin/123456  ../test/LDB_EXT_Statistics_采集/LDBX001-02 DELETE STATISTICS.sql                                                                       LDBX001-02 DELETE STATISTICS.log
	Compare Files        LDBX001-02 DELETE STATISTICS.log                  												../test/LDB_EXT_Statistics_采集/LDBX001-02 DELETE STATISTICS.ref

	LOgon And Execute SQL Script     admin/123456  ../test/LDB_EXT_Statistics_采集/LDBX001-08 linkoopdb 执行计划.sql                                                                      LDBX001-08 linkoopdb 执行计划.log
	Compare Files        LDBX001-08 linkoopdb 执行计划.log                  											../test/LDB_EXT_Statistics_采集/LDBX001-08 linkoopdb 执行计划.ref

ExternalTabTest
	[Documentation]    External_Table测试
    [Tags]     SMOKE   EXTERNAL
	LOgon And Execute SQL Script     admin/123456  ../test/LDB_EXT_External_Table/LDBX022-07 alter external table statement.sql                                                           LDBX022-07 alter external table statement.log
	Compare Files        LDBX022-07 alter external table statement.log    												../test/LDB_EXT_External_Table/LDBX022-07 alter external table statement.ref

	LOgon And Execute SQL Script     admin/123456  ../test/LDB_EXT_External_Table/LDBX022-08 create external table by parquet_hive.sql                                                    LDBX022-08 create external table by parquet_hive.log
	Compare Files        LDBX022-08 create external table by parquet_hive.log    			  							../test/LDB_EXT_External_Table/LDBX022-08 create external table by parquet_hive.ref

	LOgon And Execute SQL Script     admin/123456  ../test/LDB_EXT_External_Table/LDBX022-12 ORC file as external table.sql                                                               LDBX022-12 ORC file as external table.log
	Compare Files        LDBX022-12 ORC file as external table.log                 										../test/LDB_EXT_External_Table/LDBX022-12 ORC file as external table.ref


*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True
	Compare Skip                       ^[\| 当前时间戳].*
    Compare Skip                       ^[\| 当前时间].*
    Compare Skip                       ^[\| LdbProject ].*
    Compare Skip                       ^[\| \+\- LdbUnion ].*
    Compare Skip                       ^[\| \:\- LdbLogicalRelation].*
    Compare Skip                       ^[\| \+\- LdbLogicalRelation].*