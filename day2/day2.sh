#!/bin/bash

echo "Welcome to the File and Directory Explorer!"

echo "file and directoris in current path "
file=$(ls -lh | awk '{print $9,$2}')
PATH=$PATH:$PWD
while true
do
	for i in file
		do
			echo -e "$file"
		done
	read -p "enter the any key to count of characters(leave blank for exit) : " input

	if [ -z "$input" ]
	then
		echo "GOOD BYEEEEEE..!!!"
		break
	else
		echo -n "$input" | wc -c
	fi
	
done

