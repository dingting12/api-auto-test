#!/bin/bash
# -------------------------------------------------------------------------------
# 文件名称:    RunJob.sh
# 描述   :    集成在Jenkins中，用来运行Robot文件
# -------------------------------------------------------------------------------

# 关闭调试信息
set +x

# 具体的robot处理
function run_robot_file() {
  # 需要传递一个参数，就是robot文件的名字
  TEST_MAIN=$1

	# 过滤掉所有包含Regress_Friendly No信息的Robot文件，不运行
  m_Regress_Friendly=$(grep -c -i -E "^\.\.\..*Regress_Friendly.*No" "$TEST_MAIN"||true)
  if [[ $m_Regress_Friendly -gt 0 ]];then
    echo Ignore file ["$TEST_MAIN"] ..., Regress_Friendly is no.
    return 0
  fi

  # 根据传递的文件名称来建立工作目录
  TEST_NAME=$(basename "$TEST_MAIN")
  TEST_NAME=${TEST_NAME%.*}"_$RANDOM$RANDOM"
  export T_WORK=$T_UP_T_WORK/sub_"$TEST_NAME"
  if [ -d "T_WORK" ]
  then
    echo "Failed to create empty sub directory. Fatal exist.  .."
  fi
  mkdir -p "$T_WORK"

  # 进入程序目录，开始运行程序
  cd "$(dirname "$TEST_MAIN")" || { echo "Failed to enter test directory"; exit 1; }
  if [ "$MAX_PROCESSES" -eq 1 ]; then
      echo "Run test case $TEST_MAIN ... "
      echo "$ROBOT_BIN" --listener allure_robotframework\;"$T_WORK" \
          --loglevel DEBUG:INFO $ROBOTOPTIONS --outputdir "$T_WORK" -o output.xml \
         "$TEST_MAIN"
      $ROBOT_BIN --listener allure_robotframework\;"$T_WORK" \
          --loglevel DEBUG:INFO $ROBOTOPTIONS --outputdir "$T_WORK" -o output.xml \
          "$TEST_MAIN"
  else
      # 检查队列中的进程数量，如果已经达到最大进程数，则等待
      while [[ "$run" -ge $MAX_PROCESSES ]];do
          check
          sleep 1
      done
      # 多进程模式下不再打印屏幕输出，而是直接输出信息到__stdout,以及__stderr中
      echo "Run test case in queue $TEST_MAIN ... "
      $ROBOT_BIN --listener allure_robotframework\;"$T_WORK" \
            --loglevel DEBUG:INFO $ROBOTOPTIONS --outputdir "$T_WORK" \
           "$TEST_MAIN" > "$T_WORK"/"$TEST_NAME".__stdout 2>"$T_WORK"/"$TEST_NAME".__stderr || true &
      push $!    # 将上一个进程的PID放入队列中
  fi

  # 重置T_WORK变量
  export T_WORK=$T_UP_T_WORK
}

# 主程序，循环处理所有传入的参数
for arg in "$@"
do
  echo $arg
  if [ -d "$arg" ]
  then
    for robot_file in $(find "$arg" -name '*.robot')
    do
      run_robot_file $robot_file
    done
  else
    extension=${arg##*.}
    if [ "X"$extension == "Xrobot" ]
    then
      run_robot_file $arg
    fi
  fi
done
