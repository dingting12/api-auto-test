*** Settings ***
Documentation    流批join
...              测试不同类型的流表和维表join，并将得到的结果插入到不同的source中，验证结果是否正确
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings   AND   Setup Random Settings
Test Teardown    SQL Test Clnup
Force Tags       STREAM   owner:贾路遥

*** Test Cases ***
JoinTest-kafka&jdbc-kafka
    [Documentation]    kafka source join mysql source insert into kafka sink
    Logon And Execute SQL Script    admin/123456              kafka_source/kafka_join_mysql_into_kafka.sql           kafka_join_mysql_into_kafka.log
    Compare Files                   kafka_join_mysql_into_kafka.log       kafka_source/kafka_join_mysql_into_kafka.ref

JoinTest-kafka&hdfs-kafka
    [Documentation]    kafka source join hdfs source insert into kafka sink
    Logon And Execute SQL Script    admin/123456              kafka_source/kafka_join_hdfs_into_kafka.sql          kafka_join_hdfs_into_kafka.log
    Compare Files                   kafka_join_hdfs_into_kafka.log       kafka_source/kafka_join_hdfs_into_kafka.ref
	
JoinTest-kafka&hdfs-pallas
    [Documentation]    kafka source join hdfs source insert into kafka sink
    Logon And Execute SQL Script    admin/123456              kafka_source/kafka_join_hdfs_into_pallas.sql          kafka_join_hdfs_into_pallas.log
    Compare Files                   kafka_join_hdfs_into_pallas.log       kafka_source/kafka_join_hdfs_into_pallas.ref
	
JoinTest-kafka&jdbc-palls
    [Documentation]    kafka source join hdfs source insert into kafka sink
    Logon And Execute SQL Script    admin/123456              kafka_source/kafka_join_mysql_into_pallas.sql          kafka_join_mysql_into_pallas.log
    Compare Files                   kafka_join_mysql_into_pallas.log       kafka_source/kafka_join_mysql_into_pallas.ref
	

*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True

*** Keywords ***
Setup Random Settings
	SQLCli Enable ConsoleOutput         True
    SQLCli Set SQLMAPPING               random.map