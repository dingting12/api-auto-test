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
	LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-01 SELECT privilege at the table level.sql                                                            E081-01 SELECT privilege at the table level.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-02 DELETE privilege.sql                                                                               E081-02 DELETE privilege.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-03 INSERT privilege at the table level.sql                                                            E081-03 INSERT privilege at the table level.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-04 UPDATE privilege at the table level.sql                                                            E081-04 UPDATE privilege at the table level.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-05 UPDATE privilege at the column level.sql                                                           E081-05 UPDATE privilege at the column level.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本安全与授权/E081-08 WITH GRANT OPTION.sql                                                                              E081-08 WITH GRANT OPTION.log
	LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/E101-01 INSERT statement.sql                                                                                 E101-01 INSERT statement.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/E101-03 Searched UPDATE statement.sql                                                                        E101-03 Searched UPDATE statement.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/E101-04 Searched DELETE statement.sql                                                                        E101-04 Searched DELETE statement.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/F200 TRUNCATE TABLE statement.sql                                                                            F200 TRUNCATE TABLE statement.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/LDBX201-02 insert from subquery on dfs engine.sql                                                            LDBX201-02 insert from subquery on dfs engine.log
    LOgon And Execute SQL Script     admin/123456  CORE 基本数据管理/LDBX201-06 insert by subquery对default值，not nullable约束的处理.sql                                         LDBX201-06 insert by subquery对default值，not nullable约束的处理.log
	LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F021 在系统表中标注schema是否大小写敏感.sql                                                                F021 在系统表中标注schema是否大小写敏感.log
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F021-01 COLUMNS view.sql                                                                                   F021-01 COLUMNS view.log
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F021-02 TABLES view.sql                                                                                    F021-02 TABLES view.log
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F021-03 VIEWS view.sql                                                                                     F021-03 VIEWS view.log
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F501-01 SQL_FEATURES view.sql                                                                              F501-01 SQL_FEATURES view.log
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F501-02 SQL_SIZING view.sql                                                                                F501-02 SQL_SIZING view.log
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/F501-03 SQL_LANGUAGES view.sql                                                                             F501-03 SQL_LANGUAGES view.log
    LOgon And Execute SQL Script     admin/123456  CORE 系统信息schema/S011-01 USER_DEFINED_TYPES view.sql                                                                        S011-01 USER_DEFINED_TYPES view.log
	LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031 Configurable compact output parallel.sql                                                              F031 Configurable compact output parallel.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-01 CREATE TABLE statement to create persistent base tables.sql                                        F031-01 CREATE TABLE statement to create persistent base tables.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-02 CREATE VIEW statement.sql                                                                          F031-02 CREATE VIEW statement.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-03 GRANT statement.sql                                                                                F031-03 GRANT statement.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-04 ALTER TABLE statement.sql                                                                          F031-04 ALTER TABLE statement.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-13 DROP TABLE statement.sql                                                                           F031-13 DROP TABLE statement.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-16 DROP VIEW statement.sql                                                                            F031-16 DROP VIEW statement.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F031-19 REVOKE statement.sql                                                                               F031-19 REVOKE statement.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/F382 Alter column data type.sql                                                                            F382 Alter column data type.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/LDBX031-07 中文表名，列名的支持.sql                                                                        LDBX031-07 中文表名，列名的支持.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/LDBX141-02 Copy model by copying files.sql                                                                 LDBX141-02 Copy model by copying files.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本schema管理/T171 LIKE clause in table definition.sql                                                                   T171 LIKE clause in table definition.log
	LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-01 SELECT DISTINCT.sql                                                                                      E051-01 SELECT DISTINCT.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-02 GROUP BY clause.sql                                                                                      E051-02 GROUP BY clause.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-04 GROUP BY can contain columns not in list.sql                                                             E051-04 GROUP BY can contain columns not in list.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-05 Select list items can be renamed.sql                                                                     E051-05 Select list items can be renamed.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-06 HAVING clause.sql                                                                                        E051-06 HAVING clause.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-07 Qualified all in select list.sql                                                                         E051-07 Qualified all in select list.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-08 Correlation names in the FROM clause.sql                                                                 E051-08 Correlation names in the FROM clause.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E051-09 Rename columns in the FROM clause.sql                                                                    E051-09 Rename columns in the FROM clause.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-01 Comparison predicate.sql                                                                                 E061-01 Comparison predicate.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-02 BETWEEN predicate.sql                                                                                    E061-02 BETWEEN predicate.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-03 IN predicate with list of values.sql                                                                     E061-03 IN predicate with list of values.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-04 LIKE predicate.sql                                                                                       E061-04 LIKE predicate.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-05 LIKE predicate ESCAPE clause.sql                                                                         E061-05 LIKE predicate ESCAPE clause.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-06 NULL predicate.sql                                                                                       E061-06 NULL predicate.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-07 Quantified comparison predicate.sql                                                                      E061-07 Quantified comparison predicate.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-08 EXISTS predicate.sql                                                                                     E061-08 EXISTS predicate.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-13 Correlated subqueries.sql                                                                                E061-13 Correlated subqueries.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E061-14 Search condition.sql                                                                                     E061-14 Search condition.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-01 UNION DISTINCT table operator.sql                                                                        E071-01 UNION DISTINCT table operator.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-02 UNION ALL table operator.sql                                                                             E071-02 UNION ALL table operator.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-03 EXCEPT DISTINCT table operator.sql                                                                       E071-03 EXCEPT DISTINCT table operator.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-05 Columns combined via table operators need not have exactly the same data type.sql                        E071-05 Columns combined via table operators need not have exactly the same data type.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/E071-06 Table operators in subqueries.sql                                                                        E071-06 Table operators in subqueries.log
    LOgon And Execute SQL Script     admin/123456  CORE_基本查询/LDBX107-03 Query with both system tables and user tables.sql                                                     LDBX107-03 Query with both system tables and user tables.log
	LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-01 Inner join (but not necessarily the INNER keyword).sql                                                   F041-01 Inner join (but not necessarily the INNER keyword).log
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-02 INNER keyword.sql                                                                                        F041-02 INNER keyword.log
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-03 LEFT OUTER JOIN.sql                                                                                      F041-03 LEFT OUTER JOIN.log
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-04 RIGHT OUTER JOIN.sql                                                                                     F041-04 RIGHT OUTER JOIN.log
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-05 Outer joins can be nested.sql                                                                            F041-05 Outer joins can be nested.log
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-07 The inner table in a left or right outer join can also be used in an inner join.sql                      F041-07 The inner table in a left or right outer join can also be used in an inner join.log
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F401-04 CROSS JOIN.sql                                                                                           F401-04 CROSS JOIN.log
    LOgon And Execute SQL Script     admin/123456  CORE_基础JOIN/F041-08 All comparison operators are supported.sql                                                               F041-08 All comparison operators are supported.log
	LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E011-04 Arithmetic operators.sql                                                                                 E011-04 Arithmetic operators.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E011-05 Numeric comparison.sql                                                                                   E011-05 Numeric comparison.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E011-06 Implicit casting among the numeric data types.sql                                                        E011-06 Implicit casting among the numeric data types.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E011_E021_F051.sql                                                                                               E011_E021_F051.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E021-03 Character literals.sql                                                                                   E021-03 Character literals.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E021-function.sql                                                                                                E021-function.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/E031-01-02-03.sql                                                                                                E031-01-02-03.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-01 DATE data type (including support of DATE literal).sql                                                   F051-01 DATE data type (including support of DATE literal).log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-03 TIMESTAMP data type.sql                                                                                  F051-03 TIMESTAMP data type.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.sql                                         F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-05 Explicit CAST between datetime types and character string types.sql                                      F051-05 Explicit CAST between datetime types and character string types.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-06 CURRENT_DATE.sql                                                                                         F051-06 CURRENT_DATE.log
    LOgon And Execute SQL Script     admin/123456  CORE_数据类型/F051-07-08 LOCALTIME_LOCALTIMESTAMP.sql                                                                          F051-07-08 LOCALTIME_LOCALTIMESTAMP.log
	LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-01 AVG.sql                                                                                                  E091-01 AVG.log
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-02 COUNT.sql                                                                                                E091-02 COUNT.log
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-03 MAX.sql                                                                                                  E091-03 MAX.log
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-04 MIN.sql                                                                                                  E091-04 MIN.log
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-05 SUM.sql                                                                                                  E091-05 SUM.log
    LOgon And Execute SQL Script     admin/123456  CORE_集合函数/E091-07 DISTINCT quantifier.sql                                                                                  E091-07 DISTINCT quantifier.log
	LOgon And Execute SQL Script     admin/123456  LDB EXT Statistics 采集/LDBX001 ANALYZE statement to collect statistics.sql                                                    LDBX001 ANALYZE statement to collect statistics.log
    LOgon And Execute SQL Script     admin/123456  LDB EXT Statistics 采集/LDBX001-01 Basic ANALYZE.sql                                                                           LDBX001-01 Basic ANALYZE.log
    LOgon And Execute SQL Script     admin/123456  LDB EXT Statistics 采集/LDBX001-02 DELETE STATISTICS.sql                                                                       LDBX001-02 DELETE STATISTICS.log
    LOgon And Execute SQL Script     admin/123456  LDB EXT Statistics 采集/LDBX001-08 linkoopdb 执行计划.sql                                                                      LDBX001-08 linkoopdb 执行计划.log
	LOgon And Execute SQL Script     admin/123456  LDB_EXT_External_Table/LDBX022-07 alter external table statement.sql                                                           LDBX022-07 alter external table statement.log
    LOgon And Execute SQL Script     admin/123456  LDB_EXT_External_Table/LDBX022-08 create external table by parquet_hive.sql                                                    LDBX022-08 create external table by parquet_hive.log
    LOgon And Execute SQL Script     admin/123456  LDB_EXT_External_Table/LDBX022-12 ORC file as external table.sql                                                               LDBX022-12 ORC file as external table.log


	Compare Files        E081-01 SELECT privilege at the table level.log        CORE 基本安全与授权/E081-01 SELECT privilege at the table level.ref
	Compare Files        E081-02 DELETE privilege.log    			            CORE 基本安全与授权/E081-02 DELETE privilege.ref
	Compare Files        E081-03 INSERT privilege at the table level.log        CORE 基本安全与授权/E081-03 INSERT privilege at the table level.ref
	Compare Files        E081-04 UPDATE privilege at the table level.log        CORE 基本安全与授权/E081-04 UPDATE privilege at the table level.ref
	Compare Files        E081-05 UPDATE privilege at the column level.log       CORE 基本安全与授权/E081-05 UPDATE privilege at the column level.ref
	Compare Files        E081-08 WITH GRANT OPTION.log                          CORE 基本安全与授权/E081-08 WITH GRANT OPTION.ref
	Compare Files        E101-01 INSERT statement.log    																CORE 基本数据管理/E101-01 INSERT statement.ref
	Compare Files        E101-03 Searched UPDATE statement.log    			  										CORE 基本数据管理/E101-03 Searched UPDATE statement.ref
	Compare Files        E101-04 Searched DELETE statement.log                  										CORE 基本数据管理/E101-04 Searched DELETE statement.ref
	Compare Files        F200 TRUNCATE TABLE statement.log                   											CORE 基本数据管理/F200 TRUNCATE TABLE statement.ref
	Compare Files        LDBX201-02 insert from subquery on dfs engine.log            								CORE 基本数据管理/LDBX201-02 insert from subquery on dfs engine.ref
	Compare Files        LDBX201-06 insert by subquery对default值，not nullable约束的处理.log              			CORE 基本数据管理/LDBX201-06 insert by subquery对default值，not nullable约束的处理.ref
	Compare Files        F021 在系统表中标注schema是否大小写敏感.log    		CORE 系统信息schema/F021 在系统表中标注schema是否大小写敏感.ref
	Compare Files        F021-01 COLUMNS view.log    			  				CORE 系统信息schema/F021-01 COLUMNS view.ref
	Compare Files        F021-02 TABLES view.log                  				CORE 系统信息schema/F021-02 TABLES view.ref
	Compare Files        F021-03 VIEWS view.log                   				CORE 系统信息schema/F021-03 VIEWS view.ref
	Compare Files        F501-01 SQL_FEATURES view.log            				CORE 系统信息schema/F501-01 SQL_FEATURES view.ref
	Compare Files        F501-02 SQL_SIZING view.log              				CORE 系统信息schema/F501-02 SQL_SIZING view.ref
	Compare Files        F501-03 SQL_LANGUAGES view.log           				CORE 系统信息schema/F501-03 SQL_LANGUAGES view.ref
	Compare Files        S011-01 USER_DEFINED_TYPES view.log      				CORE 系统信息schema/S011-01 USER_DEFINED_TYPES view.ref
	Compare Files        F031 Configurable compact output parallel.log                             CORE_基本schema管理/F031 Configurable compact output parallel.ref
	Compare Files        F031-01 CREATE TABLE statement to create persistent base tables.log       CORE_基本schema管理/F031-01 CREATE TABLE statement to create persistent base tables.ref
	Compare Files        F031-02 CREATE VIEW statement.log                                         CORE_基本schema管理/F031-02 CREATE VIEW statement.ref
	Compare Files        F031-03 GRANT statement.log                                               CORE_基本schema管理/F031-03 GRANT statement.ref
	Compare Files        F031-04 ALTER TABLE statement.log                                         CORE_基本schema管理/F031-04 ALTER TABLE statement.ref
	Compare Files        F031-13 DROP TABLE statement.log                                          CORE_基本schema管理/F031-13 DROP TABLE statement.ref
	Compare Files        F031-16 DROP VIEW statement.log                                           CORE_基本schema管理/F031-16 DROP VIEW statement.ref
	Compare Files        F031-19 REVOKE statement.log                                              CORE_基本schema管理/F031-19 REVOKE statement.ref
    Compare Files        F382 Alter column data type.log                                           CORE_基本schema管理/F382 Alter column data type.ref
    Compare Files        LDBX031-07 中文表名，列名的支持.log                                       CORE_基本schema管理/LDBX031-07 中文表名，列名的支持.ref
    Compare Files        LDBX141-02 Copy model by copying files.log                                CORE_基本schema管理/LDBX141-02 Copy model by copying files.ref
    Compare Files        T171 LIKE clause in table definition.log                                  CORE_基本schema管理/T171 LIKE clause in table definition.ref
    Compare Files        E051-01 SELECT DISTINCT.log                                                                CORE_基本查询/E051-01 SELECT DISTINCT.ref
    Compare Files        E051-02 GROUP BY clause.log                                                                CORE_基本查询/E051-02 GROUP BY clause.ref
    Compare Files        E051-04 GROUP BY can contain columns not in list.log                                       CORE_基本查询/E051-04 GROUP BY can contain columns not in list.ref
    Compare Files        E051-05 Select list items can be renamed.log                                               CORE_基本查询/E051-05 Select list items can be renamed.ref
    Compare Files        E051-06 HAVING clause.log                                                                  CORE_基本查询/E051-06 HAVING clause.ref
    Compare Files        E051-07 Qualified all in select list.log                                                   CORE_基本查询/E051-07 Qualified all in select list.ref
    Compare Files        E051-08 Correlation names in the FROM clause.log                                           CORE_基本查询/E051-08 Correlation names in the FROM clause.ref
    Compare Files        E051-09 Rename columns in the FROM clause.log                                              CORE_基本查询/E051-09 Rename columns in the FROM clause.ref
    Compare Files        E061-01 Comparison predicate.log                                                           CORE_基本查询/E061-01 Comparison predicate.ref
    Compare Files        E061-02 BETWEEN predicate.log                                                              CORE_基本查询/E061-02 BETWEEN predicate.ref
    Compare Files        E061-03 IN predicate with list of values.log                                               CORE_基本查询/E061-03 IN predicate with list of values.ref
    Compare Files        E061-04 LIKE predicate.log                                                                 CORE_基本查询/E061-04 LIKE predicate.ref
    Compare Files        E061-05 LIKE predicate ESCAPE clause.log                                                   CORE_基本查询/E061-05 LIKE predicate ESCAPE clause.ref
    Compare Files        E061-06 NULL predicate.log                                                                 CORE_基本查询/E061-06 NULL predicate.ref
    Compare Files        E061-07 Quantified comparison predicate.log                                                CORE_基本查询/E061-07 Quantified comparison predicate.ref
    Compare Files        E061-08 EXISTS predicate.log                                                               CORE_基本查询/E061-08 EXISTS predicate.ref
    Compare Files        E061-13 Correlated subqueries.log                                                          CORE_基本查询/E061-13 Correlated subqueries.ref
    Compare Files        E061-14 Search condition.log                                                               CORE_基本查询/E061-14 Search condition.ref
    Compare Files        E071-01 UNION DISTINCT table operator.log                                                  CORE_基本查询/E071-01 UNION DISTINCT table operator.ref
    Compare Files        E071-02 UNION ALL table operator.log                                                       CORE_基本查询/E071-02 UNION ALL table operator.ref
    Compare Files        E071-03 EXCEPT DISTINCT table operator.log                                                 CORE_基本查询/E071-03 EXCEPT DISTINCT table operator.ref
    Compare Files        E071-05 Columns combined via table operators need not have exactly the same data type.log  CORE_基本查询/E071-05 Columns combined via table operators need not have exactly the same data type.ref
    Compare Files        E071-06 Table operators in subqueries.log                                                  CORE_基本查询/E071-06 Table operators in subqueries.ref
    Compare Files        LDBX107-03 Query with both system tables and user tables.log                               CORE_基本查询/LDBX107-03 Query with both system tables and user tables.ref
	Compare Files        F041-01 Inner join (but not necessarily the INNER keyword).log                  							CORE_基础JOIN/F041-01 Inner join (but not necessarily the INNER keyword).ref
	Compare Files        F041-02 INNER keyword.log    			                                         							CORE_基础JOIN/F041-02 INNER keyword.ref
	Compare Files        F041-03 LEFT OUTER JOIN.log                                                     							CORE_基础JOIN/F041-03 LEFT OUTER JOIN.ref
	Compare Files        F041-04 RIGHT OUTER JOIN.log                                                    							CORE_基础JOIN/F041-04 RIGHT OUTER JOIN.ref
	Compare Files        F041-05 Outer joins can be nested.log                                           							CORE_基础JOIN/F041-05 Outer joins can be nested.ref
	Compare Files        F041-07 The inner table in a left or right outer join can also be used in an inner join.log                CORE_基础JOIN/F041-07 The inner table in a left or right outer join can also be used in an inner join.ref
	Compare Files        F401-04 CROSS JOIN.log                                                          							CORE_基础JOIN/F401-04 CROSS JOIN.ref
	Compare Files        F041-08 All comparison operators are supported.log                              							CORE_基础JOIN/F041-08 All comparison operators are supported.ref
    Compare Files   	 E011-04 Arithmetic operators.log                                              CORE_数据类型/E011-04 Arithmetic operators.ref
    Compare Files   	 E011-05 Numeric comparison.log                                                CORE_数据类型/E011-05 Numeric comparison.ref
    Compare Files   	 E011-06 Implicit casting among the numeric data types.log                     CORE_数据类型/E011-06 Implicit casting among the numeric data types.ref
    Compare Files   	 E011_E021_F051.log                                                            CORE_数据类型/E011_E021_F051.ref
    Compare Files   	 E021-03 Character literals.log                                                CORE_数据类型/E021-03 Character literals.ref
    Compare Files   	 E021-function.log                                                             CORE_数据类型/E021-function.ref
    Compare Files   	 E031-01-02-03.log                                                             CORE_数据类型/E031-01-02-03.ref
    Compare Files   	 F051-01 DATE data type (including support of DATE literal).log                CORE_数据类型/F051-01 DATE data type (including support of DATE literal).ref
    Compare Files   	 F051-03 TIMESTAMP data type.log                                               CORE_数据类型/F051-03 TIMESTAMP data type.ref
    Compare Files   	 F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.log      CORE_数据类型/F051-04 Comparison predicate on DATE, TIME, and TIMESTAMP data types.ref
    Compare Files   	 F051-05 Explicit CAST between datetime types and character string types.log   CORE_数据类型/F051-05 Explicit CAST between datetime types and character string types.ref
    Compare Files   	 F051-06 CURRENT_DATE.log                                                      CORE_数据类型/F051-06 CURRENT_DATE.ref
    Compare Files   	 F051-07-08 LOCALTIME_LOCALTIMESTAMP.log                                       CORE_数据类型/F051-07-08 LOCALTIME_LOCALTIMESTAMP.ref
	Compare Files        E091-01 AVG.log                  CORE_集合函数/E091-01 AVG.ref
	Compare Files        E091-02 COUNT.log    			  CORE_集合函数/E091-02 COUNT.ref
	Compare Files        E091-03 MAX.log                  CORE_集合函数/E091-03 MAX.ref
	Compare Files        E091-04 MIN.log                  CORE_集合函数/E091-04 MIN.ref
	Compare Files        E091-05 SUM.log                  CORE_集合函数/E091-05 SUM.ref
	Compare Files        E091-07 DISTINCT quantifier.log  CORE_集合函数/E091-07 DISTINCT quantifier.ref
	Compare Files        LDBX001 ANALYZE statement to collect statistics.log    	LDB EXT Statistics 采集/LDBX001 ANALYZE statement to collect statistics.ref
	Compare Files        LDBX001-01 Basic ANALYZE.log    			 				LDB EXT Statistics 采集/LDBX001-01 Basic ANALYZELDBX001-01 Basic ANALYZE.ref
	Compare Files        LDBX001-02 DELETE STATISTICS.log                  			LDB EXT Statistics 采集/LDBX001-02 DELETE STATISTICS.ref
	Compare Files        LDBX001-08 linkoopdb 执行计划.log                  		LDB EXT Statistics 采集/LDBX001-08 linkoopdb 执行计划.ref
	Compare Files        LDBX022-07 alter external table statement.log    						LDB_EXT_External_Table/LDBX022-07 alter external table statement.ref
	Compare Files        LDBX022-08 create external table by parquet_hive.log    			  	LDB_EXT_External_Table/LDBX022-08 create external table by parquet_hive.ref
	Compare Files        LDBX022-12 ORC file as external table.log                 				LDB_EXT_External_Table/LDBX022-12 ORC file as external table.ref
