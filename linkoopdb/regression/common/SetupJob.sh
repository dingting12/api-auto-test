#!/bin/bash

# -------------------------------------------------------------------------------
# 文件名称:    SetupJob.sh
# 描述   :    集成在Jenkins中，用来在JOB开始前设置相关环境信息
# -------------------------------------------------------------------------------

# 关闭调试信息
set +x

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
    return
fi
echo Query catalog to get build tag for label ["$Label_ID"]

# 如果没有定义最大进程数，则最大进程数按照1（不并发）来计算
if [ X"$MAX_PROCESSES" = "X" ]; then
    MAX_PROCESSES=1
fi
echo Max Processes is : [ "$MAX_PROCESSES" ]

# 建立T_WORK目录，如果之前存在，则清空目录
rm -r -f "$T_WORK"
mkdir -p "$T_WORK"

# 切换当前工作目录为T_WORK下, 并执行环境设置脚本
$PY_BIN "$TEST_ROOT"/regression/common/SetupLabelBuildTag.py "$Label_ID" | grep '^Env' |awk '{print $2}' \
            > "$T_WORK"/__buildtag__.txt
cat "$T_WORK"/__buildtag__.txt
cat "$T_WORK"/__buildtag__.txt|awk '{print "export "$0}' > "$T_WORK"/__tempenv__.sh
source "$T_WORK"/__tempenv__.sh

# 检查数据库版本
echo "CALL DATABASE_VERSION();" > $T_WORK/checkdatabaseversion.sql
DATABASE_VERSION=$($SQLCLI_BIN --logon admin/123456 --nologo \
  --execute $T_WORK/checkdatabaseversion.sql|grep ^\||grep -v @p0|awk '{print $2}')

# 生成数据库环境信息文件
cat > "$T_WORK"/environment.properties << EOF
Label_ID="$Label_ID"
MAX_PROCESSES="$MAX_PROCESSES"
DATABASE_VERSION="$DATABASE_VERSION"
EOF
cat "$T_WORK"/__buildtag__.txt >> "$T_WORK"/environment.properties

# 存放进程的队列, 当前运行进程数
Qarr=();
run=0

# 将进程的添加到队列里的函数
function push() {
	Qarr=("${Qarr[@]}" "$1")
    run=${#Qarr[@]}
}

# 检测队列里的进程是否运行完毕
function check() {
	oldQ=("${Qarr[@]}")
	Qarr=()
	for p in "${oldQ[@]}";do
		if [[ -d "/proc/$p" ]];then
			Qarr=("${Qarr[@]}" "$p")
		fi
	done
	run=${#Qarr[@]}
}

# 备份T_WORK目录信息，随后在子目录中运行
T_UP_T_WORK=$T_WORK

# 显示测试开始时间
echo JOB started at .... "$(date)"

