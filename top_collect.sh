#!/bin/bash
. /etc/profile
. ~/.bash_profile

FILE_DATE=`date +%Y%m%d%H%M%S`
FILE_PATH=/home/weblogic/jvm_log
FILE_NAME=jstat_${FILE_DATE}.log
PID=`ps -ef |grep -v grep | grep AdminServer | awk '{print $2}'`

jstat -gcutil $PID 1s 60 > $FILE_PATH/$FILE_NAME
[weblogic@prd-cxcb-app-01 scripts]$ cat top_collect.sh 
#!/bin/bash
. /etc/profile
. ~/.bash_profile

FILE_DATE=`date +%Y%m%d%H%M%S`
FILE_PATH=/home/weblogic/jvm_log
FILE_NAME=top_${FILE_DATE}.log

top_collect ()
{
 pid=`ps -ef | grep java | grep weblogic | grep -v patrol | grep -v grep | awk '{print $2}'`
 top -b -H -d 10 -n 6 -p $pid > $FILE_PATH/$FILE_NAME
}
 
top_collect
