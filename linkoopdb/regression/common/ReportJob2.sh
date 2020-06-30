#!/bin/bash

# -------------------------------------------------------------------------------
# 文件名称:    ReportJob.sh
# 描述   :    集成在Jenkins中，用来在JOB完成后汇总相关报表信息
# -------------------------------------------------------------------------------

# 关闭调试信息
set +x

# 等待所有进程结束
wait

# 显示测试结束时间
echo JOB stoped at .... "$(date)"

# 开始汇总报表数据,备份测试结果文件
cd "$T_WORK" || { echo "Failed to enter test directory"; exit 1; }
for dir in sub_*
do
    [[ -e "$dir" ]] || break
    if [[ ! -d "$dir" ]]
    then
       continue
    fi

    if [ -f $dir/output.xml ]; then
        m_OutputDirList="$m_OutputDirList $dir/output.xml"
    else
        # 指定的测试没有完成
        echo "Test Failed . $dir/output.xml missed"
    fi

    # 备份测试结果文件到上层目录
    rm -f "$T_WORK"/output.xml
    rm -f "$T_WORK"/log.html
    rm -f "$T_WORK"/report.html
    cp -f $dir/*perf $dir/*sav $dir/*dif $dir/*suc $dir/*sql $dir/*log $dir/*out \
            $dir/*json $dir/*html $T_WORK 2>/dev/null || true
done

echo Will merge all rebot report files to one ...
echo $REBOT_BIN -d "$T_WORK" -o "$T_WORK"/output.xml "$m_OutputDirList"
$REBOT_BIN -d "$T_WORK" -o "$T_WORK"/output.xml "$m_OutputDirList" || true

# 将测试结果数据插入到统计数据库中
echo Will insert into robot test result to report database ...
echo $PY_BIN "$TEST_ROOT"/regression/common/ParseRobotOutput.py "$T_WORK"/output.xml
$PY_BIN "$TEST_ROOT"/regression/common/ParseRobotOutput.py "$T_WORK"/output.xml
