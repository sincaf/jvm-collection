#!/bin/bash
. /etc/profile
. ~/.bash_profile

FILE_DATE=`date +%Y%m%d%H%M%S`
FILE_PATH=/home/weblogic/jvm_log
FILE_NAME=jstack_${FILE_DATE}.log

jstack_collect ()
{
 try=0
 pid=`ps -ef | grep java | grep weblogic | grep -v patrol | grep -v grep | awk '{print $2}'`
 while [[ $try -lt 6 ]];
 do
  try=$((try + 1))
  echo ============${try}==`date`=================== >> $FILE_PATH/$FILE_NAME
  jstack $pid >> $FILE_PATH/$FILE_NAME
  sleep 10
 done
}
 
jstack_collect
