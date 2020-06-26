#!/bin/bash

# -------------------------------------------------------------------------------
# 文件名称:    ReportJob.sh
# 描述   :    集成在Jenkins中，用来在JOB完成后汇总相关报表信息
# -------------------------------------------------------------------------------

# 合并统计信息, 合并之前先删除旧的统计信息
rm -f "$T_WORK"/output.xml
rm -f "$T_WORK"/log.html
rm -f "$T_WORK"/report.html
$REBOT_BIN -d "$T_WORK" -o "$T_WORK"/output.xml "$T_WORK"/output[0-9]*.xml || true

# 将测试结果数据插入到统计数据库中
$PY_BIN "$TEST_ROOT"/regression/common/ParseRobotOutput.py "$T_WORK"/output.xml
