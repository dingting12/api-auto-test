*** Settings ***
Documentation    数据导入测试
...              kafka source输入到parquet sink测试
Resource           %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   
... 			 SQL Test Setup   AND 
...              Setup Custom Settings   AND 
...              Upload csv files  
Test Teardown    SQL Test Clnup
Force Tags       STREAM  owner:贾路遥

*** Test Cases ***
StreamTestKafka-Parquet
    [Documentation]    kafka source输入到parquet sink测试
    Logon And Execute SQL Script    admin/123456              shenzhen.sql           shenzhen.log
    Compare Files                   shenzhen.log       shenzhen.ref


*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True
	SQLCli Set SQLMAPPING               random.map
    SQLCli Set SQLMAPPING               external_sql.map
	
Upload csv files
    HDFS Connnect              %{HDFSWEB_ROOTURL}/%{JOB_BASE_NAME}/
