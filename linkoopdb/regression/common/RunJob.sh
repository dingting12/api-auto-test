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

# 开始i运行脚本
cd "$(dirname "$1")" || { echo "Failed to enter test directory"; exit 1; }
echo "$ROBOT_BIN" --listener allure_robotframework\;"$T_WORK" --loglevel DEBUG:INFO\
    --outputdir "$T_WORK" -o "$m_output_xmlfilename" "$1"
$ROBOT_BIN --listener allure_robotframework\;"$T_WORK" --loglevel DEBUG:INFO\
    --outputdir "$T_WORK" -o "$m_output_xmlfilename" "$1"

