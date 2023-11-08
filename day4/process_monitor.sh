#!/bin/bash

#process_name=$1
#start_command=$(systemctl start $1)

# $# is a special variable that represents the number of arguments (parameters) passed to a script or a function

if [ $# -eq 0 ];then
	echo "[Usages] : $0 <process_name>"
	exit 1
fi

is_process_running (){
	pgrep -xl "$process_name" >/dev/null

}

process_name=$1


if is_process_running;then
	echo "$process_name is running Properly...."
else
	echo "process ${process_name} is not running...attempting to restart.."
	if sudo systemctl restart $process_name;then
	sleep 2
	echo "process has been started successfully"
	else
		echo "failed to restart the process "$process_name" ...please start manually process"
	fi

fi
