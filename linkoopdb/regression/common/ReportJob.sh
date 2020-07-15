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
m_OutputDirList=""
for dir in sub_*
do
    [[ -e "$dir" ]] || break
    if [[ ! -d "$dir" ]]
    then
       continue
    fi

    if [ -f $dir/output.xml ]; then
        # 检查XML文件是否合法，测试被意外终止的XML将格式不对，导致后面无法Merge
        xmllint --noout $dir/output.xml > xmllint.log 2>xmllint.log||true
        if [ "$(cat xmllint.log|wc -l)" -ne 0 ]; then
            echo $dir/output.xml is bad format, Test Failed.
        else
            m_OutputDirList="$m_OutputDirList $dir/output.xml"
        fi
    else
        # 指定的测试没有完成
        echo "Test Failed . $dir/output.xml missed"
    fi

    # 备份测试结果文件到上层目录
    rm -f "$T_WORK"/output.xml
    rm -f "$T_WORK"/log.html
    rm -f "$T_WORK"/report.html
    # cp前面的\是为了放置系统环境上对cp进行的alias影响
    \cp -f $dir/*perf $dir/*sav $dir/*dif $dir/*suc $dir/*sql $dir/*log $dir/*out \
            $dir/*err $dir/*json $dir/*html $T_WORK 2>/dev/null || true
done

# 如果没有任何的JOB运行，则测试失败
echo Will merge all rebot report files to one ...
if [ X"$m_OutputDirList" = "X" ]; then
    echo "All test failed. Job blowout."
    exit 255
else
    echo $REBOT_BIN -d "$T_WORK" --tagstatexclude "owner*" --tagstatexclude "feature*" \
               --reporttitle "测试报告-$BUILD_TAG" --logtitle "测试日志-$BUILD_TAG" \
               --name "测试结果" --suitestatlevel 2 \
               -o "$T_WORK"/output.xml $m_OutputDirList
    $REBOT_BIN -d "$T_WORK" --tagstatexclude "owner*" --tagstatexclude "feature*"\
               --reporttitle "测试报告-$BUILD_TAG" --logtitle "测试日志-$BUILD_TAG" \
               --name "测试结果" --suitestatlevel 2 \
               -o "$T_WORK"/output.xml $m_OutputDirList || true
fi

# 将所有的perf文件合并成1个output.perf文件
cat "$T_WORK"/*perf > "$T_WORK"/output.perf

# 查看数据库版本信息
echo DATABASE_VERSION="$DATABASE_VERSION"
export DATABASE_VERSION="$DATABASE_VERSION"

# 将测试结果数据插入到统计数据库中
echo Will insert into robot test result to report database ...
echo $PY_BIN "$TEST_ROOT"/regression/common/ParseRobotOutput.py "$T_WORK"/output.xml "$T_WORK"/output.perf
$PY_BIN "$TEST_ROOT"/regression/common/ParseRobotOutput.py "$T_WORK"/output.xml "$T_WORK"/output.perf
