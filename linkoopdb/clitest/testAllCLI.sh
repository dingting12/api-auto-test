#!/bin/bash
export CURRENT_HOME=`cd $(dirname $0)/; pwd`
echo $CURRENT_HOME
cliddl1=$CURRENT_HOME/cliddl.sh.expected
cliddl2=$CURRENT_HOME/cliddl.sh.output

clidml1=$CURRENT_HOME/clidml.sh.expected
clidml2=$CURRENT_HOME/clidml.sh.output

clicmd1=$CURRENT_HOME/clicmd.sh.expected
clicmd2=$CURRENT_HOME/clicmd.sh.output

var1=/home/testdb/linkoopdb
var2=/home/user/linkoopdb

var3=tcp://node4/ldb
var4=tcp://testdb/ldb


ls *.expected | xargs sed -i 's?'$var1'?'$var2'?g'
ls *.expected | xargs sed -i 's?'$var3'?'$var4'?g'

ls *.output | xargs sed -i 's?'$var1'?'$var2'?g'
ls *.output | xargs sed -i 's?'$var3'?'$var4'?g'

diff $cliddl1 $cliddl2 > /dev/null
if [ $? -eq 0 ]; then
    echo "test ddl sql pass"
else
    echo "test ddl sql fail"
    exit 1;
fi

diff $clidml1 $clidml2 > /dev/null
if [ $? -eq 0 ]; then
    echo "test dml sql pass"
else
    echo "test dml sql fail"
    exit 1;
fi

diff $clicmd1 $clicmd2 > /dev/null
if [ $? -eq 0 ]; then
    echo "test cli cmd pass"
else
    echo "test cli cmd fail"
    exit 1;
fi
