*** Settings ***
Documentation    RobotFrameWork文档实例
...              这里的文档内容会出现在报告里面

# 引用公共函数
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Test Setup       run keywords   SQL Test Setup   AND   Setup Custom Settings
Test Teardown    SQL Test Clnup
Library          OperatingSystem

*** Test Cases ***
Primary_index_for_pallas_table
    [Tags]     feature:LDBX102-01      Primary_index_for_pallas_table
    Logon And Execute SQL Script       admin/123456                                                770_LDBX102-01_Primary_index_for_pallas_table/770_Primary_index_for_pallas_table.sql
				   Compare Files       770_Primary_index_for_pallas_table.log                      770_LDBX102-01_Primary_index_for_pallas_table/770_Primary_index_for_pallas_table.ref
	Logon And Execute SQL Script       admin/123456                                                770_LDBX102-01_Primary_index_for_pallas_table/770_Primary_index_for_pallas_table_upsert(alter).sql
				   Compare Files       770_Primary_index_for_pallas_table_upsert(alter).log        770_LDBX102-01_Primary_index_for_pallas_table/770_Primary_index_for_pallas_table_upsert(alter).ref	
    Logon And Execute SQL Script       admin/123456                                                770_LDBX102-01_Primary_index_for_pallas_table/770_Primary_index_for_pallas_table_upsert.sql
				   Compare Files       770_Primary_index_for_pallas_table_upsert.log               770_LDBX102-01_Primary_index_for_pallas_table/770_Primary_index_for_pallas_table_upsert.ref	



Pallas_Complex_data_types
    [Tags]     feature:LDBX101-13      Pallas_Complex_data_types
    Logon And Execute SQL Script       admin/123456                                                1297_LDBX101-13_Pallas_Complex_data_types/1297_LDBX101-13_Pallas_Complex_data_types_array.sql
				   Compare Files       1297_LDBX101-13_Pallas_Complex_data_types_array.log         1297_LDBX101-13_Pallas_Complex_data_types/1297_LDBX101-13_Pallas_Complex_data_types_array.ref
    Logon And Execute SQL Script       admin/123456                                                1297_LDBX101-13_Pallas_Complex_data_types/1297_LDBX101-13_Pallas_Complex_data_types_udt.sql
				   Compare Files       1297_LDBX101-13_Pallas_Complex_data_types_udt.log           1297_LDBX101-13_Pallas_Complex_data_types/1297_LDBX101-13_Pallas_Complex_data_types_udt.ref			   				   				   

	
Pallas_Update_by_subquery				 
    [Tags]     feature: LDBX101-12      Pallas_Update_by_subquery
    Logon And Execute SQL Script        admin/123456                                               1296_LDBX101-12_Pallas_Update_by_subquery/1296_LDBX101-12_Pallas_Update_by_subquery.sql
				   Compare Files        1296_LDBX101-12_Pallas_Update_by_subquery.log              1296_LDBX101-12_Pallas_Update_by_subquery/1296_LDBX101-12_Pallas_Update_by_subquery.ref



Pallas_Text_Index				 
    [Tags]     feature: LDBX101-15     Pallas_Text_Index
    Logon And Execute SQL Script        admin/123456                                               1299_LDBX101-15_Pallas_Text_Index/1299_LDBX101-15_Pallas_Text_Index.sql
				   Compare Files        1299_LDBX101-15_Pallas_Text_Index.log                      1299_LDBX101-15_Pallas_Text_Index/1299_LDBX101-15_Pallas_Text_Index.ref
				   
				   
				   
Consistent_hash_based_distributed_primary_index_for_pallas table				 
    [Tags]     feature: LDBX102-03     Consistent_hash_based_distributed_primary_index_for_pallas table
    Logon And Execute SQL Script        admin/123456                                              1032_LDBX102-03_Consistent_hash_based_distributed_primary_index_for_pallas table/NO_PRIMARY_KEY.sql
				   Compare Files        NO_PRIMARY_KEY.log                                        1032_LDBX102-03_Consistent_hash_based_distributed_primary_index_for_pallas table/NO_PRIMARY_KEY.ref
	Logon And Execute SQL Script        admin/123456                                              1032_LDBX102-03_Consistent_hash_based_distributed_primary_index_for_pallas table/ONE_PRIMARY_KEY.sql
				   Compare Files        ONE_PRIMARY_KEY.log                                       1032_LDBX102-03_Consistent_hash_based_distributed_primary_index_for_pallas table/ONE_PRIMARY_KEY.ref
	Logon And Execute SQL Script        admin/123456                                              1032_LDBX102-03_Consistent_hash_based_distributed_primary_index_for_pallas table/COMPOSITE_PRIMARY_KEY.sql
				   Compare Files        COMPOSITE_PRIMARY_KEY.log                                 1032_LDBX102-03_Consistent_hash_based_distributed_primary_index_for_pallas table/COMPOSITE_PRIMARY_KEY.ref

  
*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True

