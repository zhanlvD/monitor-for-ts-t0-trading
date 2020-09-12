#!/bin/bash
  
function rand(){  
    min=$1  
    max=$(($2-$min+1))  
    num=$(($RANDOM+1000000000)) #增加一个10位的数再求余  
    echo $(($num%$max+$min))  
}  
  
rnd=$(rand 0 20)  
echo $rnd
sleep $rnd 


product=$1
current=$2
total=$3
codeDir='/home/xxx/progress_alpha_watch'
cd $codeDir
today=$(date +%Y%m%d)
positionFile=/home/xxx/daily_tc/$product/conf/position.$today'_'$current'_'$total
outputFile=/home/xxx/daily_tc/$product/record/progress.$today'_'$current'_'$total
alphaFilePath=/home/xxx/daily_tc/$product/record/alpha.$today'_'$current'_'$total

/opt/anaconda3/bin/python3 -u WatchMessageSender.py $product $positionFile $outputFile $alphaFilePath $current $total >> ./watch_log/watch_log.$product.$current.$today 2>&1 

