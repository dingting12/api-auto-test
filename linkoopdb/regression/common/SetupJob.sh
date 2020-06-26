#!/bin/bash

# -------------------------------------------------------------------------------
# 文件名称:    SetupJob.sh
# 描述   :    集成在Jenkins中，用来在JOB开始前设置相关环境信息
# -------------------------------------------------------------------------------

# 环境变量
PY_HOME=/opt/anaconda3/
PY_BIN=$PY_HOME/bin/python
SQLCLI_BIN=$PY_HOME/bin/sqlcli
ROBOT_BIN=$PY_HOME/bin/robot
REBOT_BIN=$PY_HOME/bin/rebot
export TEST_ROOT=$WORKSPACE/linkoopdb
export T_WORK=$WORKSPACE/linkoopdb/output
export ROBOT_OPTIONS="--critical regression --suitestatlevel 3"
export ROBOT_SYSLOG_FILE=$T_WORK/robot_syslog.log
export Build_ID=$JOB_BASE_NAME-$BUILD_DISPLAY_NAME
export Creator=$BUILD_USER_ID

# 打印环境变量信息
echo PY_HOME="$PY_HOME"
echo PY_BIN="$PY_BIN"
echo SQLCLI_BIN="$SQLCLI_BIN"
echo ROBOT_BIN="$ROBOT_BIN"
echo REBOT_BIN="$REBOT_BIN"

# 检查Label_ID是否为空，用户是否忘记输入
# shellcheck disable=SC2154
if [ X"$Label_ID" = "X" ]; then
    echo "Please enter your label_id before run test ..."
    exit 255
fi

# 建立T_WORK目录，如果之前存在，则清空目录
rm -r -f "$T_WORK"
mkdir -p "$T_WORK"

# 切换当前工作目录为T_WORK下, 并执行环境设置脚本
$PY_BIN "$TEST_ROOT"/regression/common/SetupLabelBuildTag.py "$Label_ID" > "$T_WORK"/__tempenv__.sh
if [ "$(grep -c Successful "$T_WORK"/__tempenv__.sh)" -eq 1 ]; then
    cd "$T_WORK" || { echo "Failed to cd $T_WORK"; exit 255; }
    source __tempenv__.sh
    cat __tempenv__.sh
else
    echo "SetupLabelBuildTag failed ..."
    cat __tempenv__.sh
    exit 255
fi
