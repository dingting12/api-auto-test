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



Create_schema_using_pallas_engine				 
    [Tags]     feature: LDBX101-19     Create_schema_using_pallas_engine
    Logon And Execute SQL Script        admin/123456                                              2003_LDBX101-19_Create_schema_using_pallas_engine/CREATE_DBLINK.sql
				   Compare Files        CREATE_DBLINK.log                                         2003_LDBX101-19_Create_schema_using_pallas_engine/CREATE_DBLINK.ref
	Logon And Execute SQL Script        admin/123456                                              2003_LDBX101-19_Create_schema_using_pallas_engine/CREATE_TABLE.sql
				   Compare Files        CREATE_TABLE.log     									  2003_LDBX101-19_Create_schema_using_pallas_engine/CREATE_TABLE.ref
	Logon And Execute SQL Script        admin/123456                                              2003_LDBX101-19_Create_schema_using_pallas_engine/CREATE_VIEW.sql
				   Compare Files        CREATE_VIEW.log                                           2003_LDBX101-19_Create_schema_using_pallas_engine/CREATE_VIEW.ref
	Logon And Execute SQL Script        admin/123456                                              2003_LDBX101-19_Create_schema_using_pallas_engine/CREATE_EXTERNAL_TABLE.sql
				   Compare Files        CREATE_EXTERNAL_TABLE.log                                 2003_LDBX101-19_Create_schema_using_pallas_engine/CREATE_EXTERNAL_TABLE.ref



Bulk_load_on_pallas				 
    [Tags]     feature: LDBX101-11      Bulk_load_on_pallas
    Logon And Execute SQL Script        admin/123456                                              1314_LDBX101-11_Bulk_load_on_pallas/1314_LDBX101-11_Bulk_load_on_pallas.sql
				   Compare Files        1314_LDBX101-11_Bulk_load_on_pallas.log                   1314_LDBX101-11_Bulk_load_on_pallas/1314_LDBX101-11_Bulk_load_on_pallas.ref


Node(shard)_status_monitoring(basic)				 
    [Tags]     feature: LDBX045-08      Node(shard)_status_monitoring(basic)
    Logon And Execute SQL Script        admin/123456                                              1286_LDBX045-08_Node(shard)_status_monitoring(basic)/1286_LDBX045-08_Node(shard)_status_monitoring(basic).sql
				   Compare Files        1286_LDBX045-08_Node(shard)_status_monitoring(basic).log  1286_LDBX045-08_Node(shard)_status_monitoring(basic)/1286_LDBX045-08_Node(shard)_status_monitoring(basic).ref				   				   
 
 
*** Keywords ***
Setup Custom Settings
    Compare Enable ConsoleOutput       True 
	SQLCli Enable ConsoleOutput        True

