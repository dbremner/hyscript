#!/bin/bash

# 显示时间和日期

myTime=$(date +%X)
echo "Current Time: $myTime"

myDate=$(date +%x)
echo "Current Date: $myDate"

# 列出所有的登录用户
userLogin=$(users)
echo "Users login: $userLogin"


#显示系统的更新时间



# 保存到一个 log file 中
myLog='logfile'

if [ -e "$myLog" ]
then
	echo "=============================">>$myLog;
	echo "Current Time: $myTime">>$myLog;
else
	echo "Current Time: $myTime">$myLog
fi

echo "Current Date: $myDate">>$myLog
echo "Users login: $userLogin">>$myLog
