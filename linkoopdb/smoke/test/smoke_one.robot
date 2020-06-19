*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       SQL Test Setup
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
SCHEMATEST
	[Documentation]    冒烟测试
    [Tags]     SQL-Test       smoke test   
	LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-01 SELECT privilege at the table level.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-02 DELETE privilege.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-03 INSERT privilege at the table level.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-04 UPDATE privilege at the table level.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-05 UPDATE privilege at the column level.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-08 WITH GRANT OPTION.sql
	LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/E101-01 INSERT statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/E101-03 Searched UPDATE statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/E101-04 Searched DELETE statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/F200 TRUNCATE TABLE statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/LDBX201-02 insert from subquery on dfs engine.sql
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/LDBX201-06 insert by subquery对default值，not nullable约束的处理.sql
	LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F021 在系统表中标注schema是否大小写敏感.sql
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F021-01 COLUMNS view.sql
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F021-02 TABLES view.sql
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F021-03 VIEWS view.sql
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F501-01 SQL_FEATURES view.sql
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F501-02 SQL_SIZING view.sql
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F501-03 SQL_LANGUAGES view.sql
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/S011-01 USER_DEFINED_TYPES view.sql
	LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031 Configurable compact output parallel.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-01 CREATE TABLE statement to create persistent base tables.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-02 CREATE VIEW statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-03 GRANT statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-04 ALTER TABLE statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-13 DROP TABLE statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-16 DROP VIEW statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-19 REVOKE statement.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F382 Alter column data type.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/LDBX031-07 中文表名，列名的支持.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/LDBX141-02 Copy model by copying files.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/T171 LIKE clause in table definition.sql
	LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-01 SELECT DISTINCT.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-02 GROUP BY clause.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-04 GROUP BY can contain columns not in list.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-05 Select list items can be renamed.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-06 HAVING clause.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-07 Qualified all in select list.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-08 Correlation names in the FROM clause.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-09 Rename columns in the FROM clause.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-01 Comparison predicate.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-02 BETWEEN predicate.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-03 IN predicate with list of values.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-04 LIKE predicate.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-05 LIKE predicate ESCAPE clause.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-06 NULL predicate.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-07 Quantified comparison predicate.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-08 EXISTS predicate.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-13 Correlated subqueries.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-14 Search condition.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-01 UNION DISTINCT table operator.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-02 UNION ALL table operator.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-03 EXCEPT DISTINCT table operator.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-05 Columns combined via table operators need not have exactly the same data type.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-06 Table operators in subqueries.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/LDBX107-03 Query with both system tables and user tables.sql
	LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-01 Inner join (but not necessarily the INNER keyword).sql
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-02 INNER keyword.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-03 LEFT OUTER JOIN.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-04 RIGHT OUTER JOIN.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-05 Outer joins can be nested.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-07 The inner table in a left or right outer join can also be used in an inner join.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F401-04 CROSS JOIN.sql
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-08 All comparison operators are supported.sql
	LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E011-04 Arithmetic operators.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E011-05 Numeric comparison.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E011-06 Implicit casting among the numeric data types.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E011_E021_F051.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E021-03 Character literals.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E021-function.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E031-01-02-03.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-01 DATE data type (including support of DATE literal).sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-03 TIMESTAMP data type.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-05 Explicit CAST between datetime types and character string types.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-06 CURRENT_DATE.sql
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-07-08 LOCALTIME_LOCALTIMESTAMP.sql
	LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-01 AVG.sql
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-02 COUNT.sql
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-03 MAX.sql
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-04 MIN.sql
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-05 SUM.sql
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-07 DISTINCT quantifier.sql
	LOgon And Execute SQL Script     admin/123456  LDB EXT Statistics 采集/LDBX001 ANALYZE statement to collect statistics.sql
    LOgon And Execute SQL Script     admin/123456  LDB EXT Statistics 采集/LDBX001-01 Basic ANALYZE.sql
    LOgon And Execute SQL Script     admin/123456  LDB EXT Statistics 采集/LDBX001-02 DELETE STATISTICS.sql
    LOgon And Execute SQL Script     admin/123456  LDB EXT Statistics 采集/LDBX001-08 linkoopdb 执行计划.sql
	LOgon And Execute SQL Script     admin/123456  LDB_EXT_External_Table/LDBX022-07 alter external table statement.sql
    LOgon And Execute SQL Script     admin/123456  LDB_EXT_External_Table/LDBX022-08 create external table by parquet_hive.sql
    LOgon And Execute SQL Script     admin/123456  LDB_EXT_External_Table/LDBX022-12 ORC file as external table.sql


	Compare Files        CORE 基本安全与授权/E081-01 SELECT privilege at the table level.log        CORE 基本安全与授权/E081-01 SELECT privilege at the table level.ref
	Compare Files        CORE 基本安全与授权/E081-02 DELETE privilege.log    			            CORE 基本安全与授权/E081-02 DELETE privilege.ref
	Compare Files        CORE 基本安全与授权/E081-03 INSERT privilege at the table level.log        CORE 基本安全与授权/E081-03 INSERT privilege at the table level.ref
	Compare Files        CORE 基本安全与授权/E081-04 UPDATE privilege at the table level.log        CORE 基本安全与授权/E081-04 UPDATE privilege at the table level.ref
	Compare Files        CORE 基本安全与授权/E081-05 UPDATE privilege at the column level.log       CORE 基本安全与授权/E081-05 UPDATE privilege at the column level.ref
	Compare Files        CORE 基本安全与授权/E081-08 WITH GRANT OPTION.log                          CORE 基本安全与授权/E081-08 WITH GRANT OPTION.ref
	Compare Files        CORE 基本数据管理/E101-01 INSERT statement.log    																CORE 基本数据管理/E101-01 INSERT statement.ref
	Compare Files        CORE 基本数据管理/E101-03 Searched UPDATE statement.log    			  										CORE 基本数据管理/E101-03 Searched UPDATE statement.ref
	Compare Files        CORE 基本数据管理/E101-04 Searched DELETE statement.log                  										CORE 基本数据管理/E101-04 Searched DELETE statement.ref
	Compare Files        CORE 基本数据管理/F200 TRUNCATE TABLE statement.log                   											CORE 基本数据管理/F200 TRUNCATE TABLE statement.ref
	Compare Files        CORE 基本数据管理/LDBX201-02 insert from subquery on dfs engine.log            								CORE 基本数据管理/LDBX201-02 insert from subquery on dfs engine.ref
	Compare Files        CORE 基本数据管理/LDBX201-06 insert by subquery对default值，not nullable约束的处理.log              			CORE 基本数据管理/LDBX201-06 insert by subquery对default值，not nullable约束的处理.ref
	Compare Files        CORE 系统信息schema/F021 在系统表中标注schema是否大小写敏感.log    		CORE 系统信息schema/F021 在系统表中标注schema是否大小写敏感.ref
	Compare Files        CORE 系统信息schema/F021-01 COLUMNS view.log    			  				CORE 系统信息schema/F021-01 COLUMNS view.ref
	Compare Files        CORE 系统信息schema/F021-02 TABLES view.log                  				CORE 系统信息schema/F021-02 TABLES view.ref
	Compare Files        CORE 系统信息schema/F021-03 VIEWS view.log                   				CORE 系统信息schema/F021-03 VIEWS view.ref
	Compare Files        CORE 系统信息schema/F501-01 SQL_FEATURES view.log            				CORE 系统信息schema/F501-01 SQL_FEATURES view.ref
	Compare Files        CORE 系统信息schema/F501-02 SQL_SIZING view.log              				CORE 系统信息schema/F501-02 SQL_SIZING view.ref
	Compare Files        CORE 系统信息schema/F501-03 SQL_LANGUAGES view.log           				CORE 系统信息schema/F501-03 SQL_LANGUAGES view.ref
	Compare Files        CORE 系统信息schema/S011-01 USER_DEFINED_TYPES view.log      				CORE 系统信息schema/S011-01 USER_DEFINED_TYPES view.ref
	Compare Files        CORE_基本schema管理/F031 Configurable compact output parallel.log                             CORE_基本schema管理/F031 Configurable compact output parallel.ref
	Compare Files        CORE_基本schema管理/F031-01 CREATE TABLE statement to create persistent base tables.log       CORE_基本schema管理/F031-01 CREATE TABLE statement to create persistent base tables.ref
	Compare Files        CORE_基本schema管理/F031-02 CREATE VIEW statement.log                                         CORE_基本schema管理/F031-02 CREATE VIEW statement.ref
	Compare Files        CORE_基本schema管理/F031-03 GRANT statement.log                                               CORE_基本schema管理/F031-03 GRANT statement.ref
	Compare Files        CORE_基本schema管理/F031-04 ALTER TABLE statement.log                                         CORE_基本schema管理/F031-04 ALTER TABLE statement.ref
	Compare Files        CORE_基本schema管理/F031-13 DROP TABLE statement.log                                          CORE_基本schema管理/F031-13 DROP TABLE statement.ref
	Compare Files        CORE_基本schema管理/F031-16 DROP VIEW statement.log                                           CORE_基本schema管理/F031-16 DROP VIEW statement.ref
	Compare Files        CORE_基本schema管理/F031-19 REVOKE statement.log                                              CORE_基本schema管理/F031-19 REVOKE statement.ref
    Compare Files        CORE_基本schema管理/F382 Alter column data type.log                                           CORE_基本schema管理/F382 Alter column data type.ref
    Compare Files        CORE_基本schema管理/LDBX031-07 中文表名，列名的支持.log                                       CORE_基本schema管理/LDBX031-07 中文表名，列名的支持.ref
    Compare Files        CORE_基本schema管理/LDBX141-02 Copy model by copying files.log                                CORE_基本schema管理/LDBX141-02 Copy model by copying files.ref
    Compare Files        CORE_基本schema管理/T171 LIKE clause in table definition.log                                  CORE_基本schema管理/T171 LIKE clause in table definition.ref
    Compare Files        CORE_基本查询/E051-01 SELECT DISTINCT.sql                                                                CORE_基本查询/E051-01 SELECT DISTINCT.ref
    Compare Files        CORE_基本查询/E051-02 GROUP BY clause.sql                                                                CORE_基本查询/E051-02 GROUP BY clause.ref
    Compare Files        CORE_基本查询/E051-04 GROUP BY can contain columns not in list.sql                                       CORE_基本查询/E051-04 GROUP BY can contain columns not in list.ref
    Compare Files        CORE_基本查询/E051-05 Select list items can be renamed.sql                                               CORE_基本查询/E051-05 Select list items can be renamed.ref
    Compare Files        CORE_基本查询/E051-06 HAVING clause.sql                                                                  CORE_基本查询/E051-06 HAVING clause.ref
    Compare Files        CORE_基本查询/E051-07 Qualified all in select list.sql                                                   CORE_基本查询/E051-07 Qualified all in select list.ref
    Compare Files        CORE_基本查询/E051-08 Correlation names in the FROM clause.sql                                           CORE_基本查询/E051-08 Correlation names in the FROM clause.ref
    Compare Files        CORE_基本查询/E051-09 Rename columns in the FROM clause.sql                                              CORE_基本查询/E051-09 Rename columns in the FROM clause.ref
    Compare Files        CORE_基本查询/E061-01 Comparison predicate.sql                                                           CORE_基本查询/E061-01 Comparison predicate.ref
    Compare Files        CORE_基本查询/E061-02 BETWEEN predicate.sql                                                              CORE_基本查询/E061-02 BETWEEN predicate.ref
    Compare Files        CORE_基本查询/E061-03 IN predicate with list of values.sql                                               CORE_基本查询/E061-03 IN predicate with list of values.ref
    Compare Files        CORE_基本查询/E061-04 LIKE predicate.sql                                                                 CORE_基本查询/E061-04 LIKE predicate.ref
    Compare Files        CORE_基本查询/E061-05 LIKE predicate ESCAPE clause.sql                                                   CORE_基本查询/E061-05 LIKE predicate ESCAPE clause.ref
    Compare Files        CORE_基本查询/E061-06 NULL predicate.sql                                                                 CORE_基本查询/E061-06 NULL predicate.ref
    Compare Files        CORE_基本查询/E061-07 Quantified comparison predicate.sql                                                CORE_基本查询/E061-07 Quantified comparison predicate.ref
    Compare Files        CORE_基本查询/E061-08 EXISTS predicate.sql                                                               CORE_基本查询/E061-08 EXISTS predicate.ref
    Compare Files        CORE_基本查询/E061-13 Correlated subqueries.sql                                                          CORE_基本查询/E061-13 Correlated subqueries.ref
    Compare Files        CORE_基本查询/E061-14 Search condition.sql                                                               CORE_基本查询/E061-14 Search condition.ref
    Compare Files        CORE_基本查询/E071-01 UNION DISTINCT table operator.sql                                                  CORE_基本查询/E071-01 UNION DISTINCT table operator.ref
    Compare Files        CORE_基本查询/E071-02 UNION ALL table operator.sql                                                       CORE_基本查询/E071-02 UNION ALL table operator.ref
    Compare Files        CORE_基本查询/E071-03 EXCEPT DISTINCT table operator.sql                                                 CORE_基本查询/E071-03 EXCEPT DISTINCT table operator.ref
    Compare Files        CORE_基本查询/E071-05 Columns combined via table operators need not have exactly the same data type.sql  CORE_基本查询/E071-05 Columns combined via table operators need not have exactly the same data type.ref
    Compare Files        CORE_基本查询/E071-06 Table operators in subqueries.sql                                                  CORE_基本查询/E071-06 Table operators in subqueries.ref
    Compare Files        CORE_基本查询/LDBX107-03 Query with both system tables and user tables.sql                               CORE_基本查询/LDBX107-03 Query with both system tables and user tables.ref
	Compare Files        CORE_基础JOIN/F041-01 Inner join (but not necessarily the INNER keyword).log                  							CORE_基础JOIN/F041-01 Inner join (but not necessarily the INNER keyword).ref
	Compare Files        CORE_基础JOIN/F041-02 INNER keyword.log    			                                         							CORE_基础JOIN/F041-02 INNER keyword.ref
	Compare Files        CORE_基础JOIN/F041-03 LEFT OUTER JOIN.log                                                     							CORE_基础JOIN/F041-03 LEFT OUTER JOIN.ref
	Compare Files        CORE_基础JOIN/F041-04 RIGHT OUTER JOIN.log                                                    							CORE_基础JOIN/F041-04 RIGHT OUTER JOIN.ref
	Compare Files        CORE_基础JOIN/F041-05 Outer joins can be nested.log                                           							CORE_基础JOIN/F041-05 Outer joins can be nested.ref
	Compare Files        CORE_基础JOIN/F041-07 The inner table in a left or right outer join can also be used in an inner join.log                CORE_基础JOIN/F041-07 The inner table in a left or right outer join can also be used in an inner join.ref
	Compare Files        CORE_基础JOIN/F401-04 CROSS JOIN.log                                                          							CORE_基础JOIN/F401-04 CROSS JOIN.ref
	Compare Files        CORE_基础JOIN/F041-08 All comparison operators are supported.log                              							CORE_基础JOIN/F041-08 All comparison operators are supported.ref
    Compare Files   	 CORE_数据类型/E011-04 Arithmetic operators.sql                                              CORE_数据类型/E011-04 Arithmetic operators.ref
    Compare Files   	 CORE_数据类型/E011-05 Numeric comparison.sql                                                CORE_数据类型/E011-05 Numeric comparison.ref
    Compare Files   	 CORE_数据类型/E011-06 Implicit casting among the numeric data types.sql                     CORE_数据类型/E011-06 Implicit casting among the numeric data types.ref
    Compare Files   	 CORE_数据类型/E011_E021_F051.sql                                                            CORE_数据类型/E011_E021_F051.ref
    Compare Files   	 CORE_数据类型/E021-03 Character literals.sql                                                CORE_数据类型/E021-03 Character literals.ref
    Compare Files   	 CORE_数据类型/E021-function.sql                                                             CORE_数据类型/E021-function.ref
    Compare Files   	 CORE_数据类型/E031-01-02-03.sql                                                             CORE_数据类型/E031-01-02-03.ref
    Compare Files   	 CORE_数据类型/F051-01 DATE data type (including support of DATE literal).sql                CORE_数据类型/F051-01 DATE data type (including support of DATE literal).ref
    Compare Files   	 CORE_数据类型/F051-03 TIMESTAMP data type.sql                                               CORE_数据类型/F051-03 TIMESTAMP data type.ref
    Compare Files   	 CORE_数据类型/F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.sql      CORE_数据类型/F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.ref
    Compare Files   	 CORE_数据类型/F051-05 Explicit CAST between datetime types and character string types.sql   CORE_数据类型/F051-05 Explicit CAST between datetime types and character string types.ref
    Compare Files   	 CORE_数据类型/F051-06 CURRENT_DATE.sql                                                      CORE_数据类型/F051-06 CURRENT_DATE.ref
    Compare Files   	 CORE_数据类型/F051-07-08 LOCALTIME_LOCALTIMESTAMP.sql                                       CORE_数据类型/F051-07-08 LOCALTIME_LOCALTIMESTAMP.ref
	Compare Files        CORE_集合函数/E091-01 AVG.log                  CORE_集合函数/E091-01 AVG.ref
	Compare Files        CORE_集合函数/E091-02 COUNT.log    			  CORE_集合函数/E091-02 COUNT.ref
	Compare Files        CORE_集合函数/E091-03 MAX.log                  CORE_集合函数/E091-03 MAX.ref
	Compare Files        CORE_集合函数/E091-04 MIN.log                  CORE_集合函数/E091-04 MIN.ref
	Compare Files        CORE_集合函数/E091-05 SUM.log                  CORE_集合函数/E091-05 SUM.ref
	Compare Files        CORE_集合函数/E091-07 DISTINCT quantifier.log  CORE_集合函数/E091-07 DISTINCT quantifier.ref
	Compare Files        LDB EXT Statistics 采集/LDBX001 ANALYZE statement to collect statistics.log    	LDB EXT Statistics 采集/LDBX001 ANALYZE statement to collect statistics.ref
	Compare Files        LDB EXT Statistics 采集/LDBX001-01 Basic ANALYZE.log    			 				LDB EXT Statistics 采集/LDBX001-01 Basic ANALYZELDBX001-01 Basic ANALYZE.ref
	Compare Files        LDB EXT Statistics 采集/LDBX001-02 DELETE STATISTICS.log                  			LDB EXT Statistics 采集/LDBX001-02 DELETE STATISTICS.ref
	Compare Files        LDB EXT Statistics 采集/LDBX001-08 linkoopdb 执行计划.log                  		LDB EXT Statistics 采集/LDBX001-08 linkoopdb 执行计划.ref
	Compare Files        LDB_EXT_External_Table/LDBX022-07 alter external table statement.log    						LDB_EXT_External_Table/LDBX022-07 alter external table statement.ref
	Compare Files        LDB_EXT_External_Table/LDBX022-08 create external table by parquet_hive.log    			  	LDB_EXT_External_Table/LDBX022-08 create external table by parquet_hive.ref
	Compare Files        LDB_EXT_External_Table/LDBX022-12 ORC file as external table.log                 				LDB_EXT_External_Table/LDBX022-12 ORC file as external table.ref
