#!/bin/bash
# -------------------------------------------------------------------------------
# 文件名称:    RunJob.sh
# 描述   :    集成在Jenkins中，用来运行Robot文件
# -------------------------------------------------------------------------------

# 关闭调试信息
set +x

# 根据传递的文件名称来建立工作目录
TEST_MAIN=$1
TEST_NAME=`basename $TEST_MAIN`
TEST_NAME=${TEST_NAME%.*}
export T_WORK=$T_UP_T_WORK/sub_$TEST_NAME
mkdir -p $T_WORK

# 进入程序目录，开始运行程序
cd "$(dirname "$TEST_MAIN")" || { echo "Failed to enter test directory"; exit 1; }
echo "Run test case $TEST_MAIN ... "
if [ "$MAX_PROCESSES" -eq 1 ]; then
    echo "$ROBOT_BIN" --listener allure_robotframework\;"$T_WORK" --loglevel DEBUG:INFO\
        --outputdir "$T_WORK" -o output.xml "$TEST_MAIN"
    $ROBOT_BIN --listener allure_robotframework\;"$T_WORK" --loglevel DEBUG:INFO\
        --outputdir "$T_WORK" -o output.xml "$TEST_MAIN"
else
    # 不再打印屏幕输出，而是直接输出信息到__stdout,以及__stderr中
    echo "Run test case in queue $TEST_MAIN ... "
    $ROBOT_BIN --listener allure_robotframework\;"$T_WORK" --loglevel DEBUG:INFO --outputdir "$T_WORK" \
          "$TEST_MAIN" > "$T_WORK"/"$TEST_NAME".__stdout 2 > "$T_WORK"/"$TEST_NAME".__stderr || true &
    push $!
    while [[ "$run" -ge $MAX_PROCESSES ]];do
        check
        sleep 1
    done
fi

# 重置T_WORK变量
export T_WORK=$T_UP_T_WORK
