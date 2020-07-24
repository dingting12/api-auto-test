#!/bin/bash
str="define _END =\"\";"
for i in {1..99}  
do  
echo $i
cat $str >> query$i.tpl
done  
