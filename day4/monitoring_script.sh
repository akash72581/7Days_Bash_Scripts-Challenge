#!/bin/bash

while true; do
	echo "
   	---- Monitoring Metrics Script ----

   	1. View System Metrics
   	2. Monitor a Specific Service
   	3. Exit
	"


	read -p "please select option: " option

	case ${option} in 
		1) echo " ----- System Metrics ----- "
			cpu_usages=$( top -n1 | grep ^%Cpu | awk '{printf("CPU Usages : %.2f%"), 100-$8}')
			mem_usages=$(free -t | grep Mem | awk '{printf("Mem Usage : %.2f%"), $3/$2*100}')
			disk_usages=$(df -hl | grep root | awk '{printf("Disk Usages : ") $5}')
			echo "${cpu_usages}  ${mem_usages} ${disk_usages}"
		;;
		2)
			echo " ---- Monitor a Specific Service ----"
			read -p "Enter the name of the service to monitor: " service_name
			is_process_running (){
        			pgrep -xl "$service_name" >/dev/null
			}	
			if is_process_running;then
				echo "$service_name" is running...
			else
				echo "$service_name is not running..."
				read -p "Do you want to start $service_name? (Y/N): " input
				if [[ ${input} == 'y' || ${input} == 'Y' ]];then
					sudo systemctl restart ${service_name}
					sleep 2
					echo "service $service_name has started successfully"
				elif [[ ${input} == 'n' || ${input} == 'Y' ]]
				then
					exit 0
				fi	
			fi
		;;
		3)
			exit
	esac
done
