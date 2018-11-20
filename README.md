# jvm-collection
jvm collection
这些脚本用来处理jvm内存、堆栈信息、jvm线程cpu使用率的收集。
脚本生成的日志存放在/home/weblogic/jvm_log/目录下。
该脚本仅仅提供了一种收集日志的思路，不可以直接使用。用户需要自行修改针对进程id提取的代码内容。
同一时刻进行信息收集才有效，建议通过crontab下建立定时任务，来进行日志的收集，以便于对于jvm性能问题的分析。
