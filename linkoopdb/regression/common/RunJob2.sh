#!/bin/bash
# -------------------------------------------------------------------------------
# 文件名称:    RunJob.sh
# 描述   :    集成在Jenkins中，用来运行Robot文件
# -------------------------------------------------------------------------------

# 关闭调试信息
set +x

# 找到可用的文件名
for ((i=1; i<=1000; i ++))
do
    if [ ! -f "$T_WORK"/output"$i".xml ]; then
         m_output_xmlfilename=output"$i".xml
         break
    fi
done

# 根据传递的文件名称来建立工作目录
TEST_MAIN=$1
TEST_NAME=`basename $TEST_MAIN`
TEST_NAME=${TEST_NAME%.*}
export T_WORK=$T_UP_T_WORK/sub_$TEST_NAME
mkdir -p $T_WORK

echo ======================================
echo $TEST_NAME
echo $T_WORK
echo $MAX_PROCESSES
echo ======================================

# 开始i运行脚本
cd "$(dirname "$1")" || { echo "Failed to enter test directory"; exit 1; }
echo "$ROBOT_BIN" --listener allure_robotframework\;"$T_WORK" --loglevel DEBUG:INFO\
    --outputdir "$T_WORK" -o "$m_output_xmlfilename" "$1"
$ROBOT_BIN --listener allure_robotframework\;"$T_WORK" --loglevel DEBUG:INFO\
    --outputdir "$T_WORK" -o "$m_output_xmlfilename" "$1"

