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
	LOgon And Execute SQL Script     admin/123456  E051-01 SELECT DISTINCT.sql
    LOgon And Execute SQL Script     admin/123456  E051-02 GROUP BY clause.sql
    LOgon And Execute SQL Script     admin/123456  E051-04 GROUP BY can contain columns not in list.sql
    LOgon And Execute SQL Script     admin/123456  E051-05 Select list items can be renamed.sql
    LOgon And Execute SQL Script     admin/123456  E051-06 HAVING clause.sql
    LOgon And Execute SQL Script     admin/123456  E051-07 Qualified all in select list.sql
    LOgon And Execute SQL Script     admin/123456  E051-08 Correlation names in the FROM clause.sql
    LOgon And Execute SQL Script     admin/123456  E051-09 Rename columns in the FROM clause.sql
    LOgon And Execute SQL Script     admin/123456  E061-01 Comparison predicate.sql
    LOgon And Execute SQL Script     admin/123456  E061-02 BETWEEN predicate.sql
    LOgon And Execute SQL Script     admin/123456  E061-03 IN predicate with list of values.sql
    LOgon And Execute SQL Script     admin/123456  E061-04 LIKE predicate.sql
    LOgon And Execute SQL Script     admin/123456  E061-05 LIKE predicate ESCAPE clause.sql
    LOgon And Execute SQL Script     admin/123456  E061-06 NULL predicate.sql
    LOgon And Execute SQL Script     admin/123456  E061-07 Quantified comparison predicate.sql
    LOgon And Execute SQL Script     admin/123456  E061-08 EXISTS predicate.sql
    LOgon And Execute SQL Script     admin/123456  E061-13 Correlated subqueries.sql
    LOgon And Execute SQL Script     admin/123456  E061-14 Search condition.sql
    LOgon And Execute SQL Script     admin/123456  E071-01 UNION DISTINCT table operator.sql
    LOgon And Execute SQL Script     admin/123456  E071-02 UNION ALL table operator.sql
    LOgon And Execute SQL Script     admin/123456  E071-03 EXCEPT DISTINCT table operator.sql
    LOgon And Execute SQL Script     admin/123456  E071-05 Columns combined via table operators need not have exactly the same data type.sql
    LOgon And Execute SQL Script     admin/123456  E071-06 Table operators in subqueries.sql
    LOgon And Execute SQL Script     admin/123456  LDBX107-03 Query with both system tables and user tables.sql

    Compare Files       E051-01 SELECT DISTINCT.sql                                                                E051-01 SELECT DISTINCT.ref
    Compare Files       E051-02 GROUP BY clause.sql                                                                E051-02 GROUP BY clause.ref
    Compare Files       E051-04 GROUP BY can contain columns not in list.sql                                       E051-04 GROUP BY can contain columns not in list.ref
    Compare Files       E051-05 Select list items can be renamed.sql                                               E051-05 Select list items can be renamed.ref
    Compare Files       E051-06 HAVING clause.sql                                                                  E051-06 HAVING clause.ref
    Compare Files       E051-07 Qualified all in select list.sql                                                   E051-07 Qualified all in select list.ref
    Compare Files       E051-08 Correlation names in the FROM clause.sql                                           E051-08 Correlation names in the FROM clause.ref
    Compare Files       E051-09 Rename columns in the FROM clause.sql                                              E051-09 Rename columns in the FROM clause.ref
    Compare Files       E061-01 Comparison predicate.sql                                                           E061-01 Comparison predicate.ref
    Compare Files       E061-02 BETWEEN predicate.sql                                                              E061-02 BETWEEN predicate.ref
    Compare Files       E061-03 IN predicate with list of values.sql                                               E061-03 IN predicate with list of values.ref
    Compare Files       E061-04 LIKE predicate.sql                                                                 E061-04 LIKE predicate.ref
    Compare Files       E061-05 LIKE predicate ESCAPE clause.sql                                                   E061-05 LIKE predicate ESCAPE clause.ref
    Compare Files       E061-06 NULL predicate.sql                                                                 E061-06 NULL predicate.ref
    Compare Files       E061-07 Quantified comparison predicate.sql                                                E061-07 Quantified comparison predicate.ref
    Compare Files       E061-08 EXISTS predicate.sql                                                               E061-08 EXISTS predicate.ref
    Compare Files       E061-13 Correlated subqueries.sql                                                          E061-13 Correlated subqueries.ref
    Compare Files       E061-14 Search condition.sql                                                               E061-14 Search condition.ref
    Compare Files       E071-01 UNION DISTINCT table operator.sql                                                  E071-01 UNION DISTINCT table operator.ref
    Compare Files       E071-02 UNION ALL table operator.sql                                                       E071-02 UNION ALL table operator.ref
    Compare Files       E071-03 EXCEPT DISTINCT table operator.sql                                                 E071-03 EXCEPT DISTINCT table operator.ref
    Compare Files       E071-05 Columns combined via table operators need not have exactly the same data type.sql  E071-05 Columns combined via table operators need not have exactly the same data type.ref
    Compare Files       E071-06 Table operators in subqueries.sql                                                  E071-06 Table operators in subqueries.ref
    Compare Files       LDBX107-03 Query with both system tables and user tables.sql                               LDBX107-03 Query with both system tables and user tables.ref
