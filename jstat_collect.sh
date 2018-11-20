#!/bin/bash
. /etc/profile
. ~/.bash_profile

FILE_DATE=`date +%Y%m%d%H%M%S`
FILE_PATH=/home/weblogic/jvm_log
FILE_NAME=jstat_${FILE_DATE}.log
PID=`ps -ef |grep -v grep | grep AdminServer | awk '{print $2}'`

jstat -gcutil $PID 1s 60 > $FILE_PATH/$FILE_NAME
