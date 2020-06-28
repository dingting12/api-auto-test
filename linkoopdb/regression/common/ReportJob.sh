#!/bin/bash

# -------------------------------------------------------------------------------
# 文件名称:    ReportJob.sh
# 描述   :    集成在Jenkins中，用来在JOB完成后汇总相关报表信息
# -------------------------------------------------------------------------------

# 关闭调试信息
set +x

# 合并统计信息, 合并之前先删除旧的统计信息
rm -f "$T_WORK"/output.xml
rm -f "$T_WORK"/log.html
rm -f "$T_WORK"/report.html
echo "Will merge all rebot report files to one ... "
echo $REBOT_BIN -d "$T_WORK" -o "$T_WORK"/output.xml "$T_WORK"/output[0-9]*.xml
$REBOT_BIN -d "$T_WORK" -o "$T_WORK"/output.xml "$T_WORK"/output[0-9]*.xml || true

# 将测试结果数据插入到统计数据库中
echo "Will insert into robot test result to report database ..."
echo $PY_BIN "$TEST_ROOT"/regression/common/ParseRobotOutput.py "$T_WORK"/output.xml
$PY_BIN "$TEST_ROOT"/regression/common/ParseRobotOutput.py "$T_WORK"/output.xml
