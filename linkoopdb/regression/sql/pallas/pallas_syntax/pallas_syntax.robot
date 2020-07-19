*** Settings ***
Resource          %{TEST_ROOT}/regression/common/SetupRobot.robot
Suite Setup       SQL Test Setup
Suite Teardown    Tear Down

*** Settings ***
Documentation    PALLAS建表语法回归测试
Force Tags       SQL-Test  owner:阮娜


*** Test Cases ***
Pallas-Syntax
    [Documentation]    PALLAS建表语法回归测试
    [Tags]     Smoke   PALLAS

    Logon And Execute SQL Script       admin/123456   create_table_basic_syntax.sql   create_table_basic_syntax.log
    Compare Files                      create_table_basic_syntax.log   create_table_basic_syntax.ref

    Logon And Execute SQL Script       admin/123456   create_table_data_type.sql   create_table_data_type.log
    Compare Files                      create_table_data_type.log   create_table_data_type.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_binlog.sql   create_table_with_binlog.log
    Compare Files                      create_table_with_binlog.log   create_table_with_binlog.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_dict_compress_enabled.sql   create_table_with_dict_compress_enabled.log
    Compare Files                      create_table_with_dict_compress_enabled.log   create_table_with_dict_compress_enabled.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_insert_cache_count.sql   create_table_with_insert_cache_count.log
    Compare Files                      create_table_with_insert_cache_count.log   create_table_with_insert_cache_count.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_min_shard_duplicate_number.sql create_table_with_min_shard_duplicate_number.log
    Compare Files                      create_table_with_min_shard_duplicate_number.log create_table_with_min_shard_duplicate_number.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_peringestnum.sql create_table_with_peringestnum.log
    Compare Files                      create_table_with_peringestnum.log create_table_with_peringestnum.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_perinsertnum.sql create_table_with_perinsertnum.log
    Compare Files                      create_table_with_perinsertnum.log create_table_with_perinsertnum.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_sensitive.sql create_table_with_sensitive.log
    Compare Files                      create_table_with_sensitive.log create_table_with_sensitive.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_shard_duplicate_number.sql create_table_with_shard_duplicate_number.log
    Compare Files                      create_table_with_shard_duplicate_number.log create_table_with_shard_duplicate_number.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_shard_number.sql create_table_with_shard_number.log
    Compare Files                      create_table_with_shard_number.log create_table_with_shard_number.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_txnnum.sql create_table_with_txnnum.log
    Compare Files                      create_table_with_txnnum.log create_table_with_txnnum.ref

    Logon And Execute SQL Script       admin/123456   create_table_with_upsert.sql create_table_with_upsert.log
    Compare Files                      create_table_with_upsert.log create_table_with_upsert.ref

Tear Down
    Logon And Execute SQL Script       admin/123456   tear_down.sql