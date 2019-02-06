#!/bin/bash
set -x
>/tmp/check_agent.log
exec 2>>/tmp/check_agent.log

for Agent in  $(ls /etc/init.d/go-agent*)
do
	status=$(${Agent} status)
	echo "${Agent} status = ${status}"
	echo "$status" |grep -i "stopped" 
	if [ $? == 0 ];
	then
		echo "${Agent} has stopped"
		echo "Restarting ${Agent}"
		${Agent} restart
	fi
done