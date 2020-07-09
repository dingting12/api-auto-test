*** Settings ***
Documentation    流批join
...              测试不同类型的流表和维表join，并将得到的结果插入到不同的source中，验证结果是否正确
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings   AND   Setup Random Settings
Test Teardown    SQL Test Clnup
Force Tags       STREAM

*** Test Cases ***
JoinTest-kafka&hdfs
    [Documentation]    kafka source join hdfs source isnert into kafka sink
    Logon And Execute SQL Script    admin/123456              kafka_join_mysql_into_kafka.sql           kafka_join_mysql_into_kafka.log
    Compare Files                   kafka_join_mysql_into_kafka.log       kafka_join_mysql_into_kafka.ref
	

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True

*** Keywords ***
Setup Random Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               random.map