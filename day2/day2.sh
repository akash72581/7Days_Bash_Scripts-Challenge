#!/bin/bash			

echo "Welcome to the File and Directory Explorer!"

echo "file and directoris in current path "
file=$(ls -lh | awk '{print $9,$2}')		#using this we can print filename and size of the file

while true					#do until specific condition becomes true
do
	for i in file				#for loop - print the all files and dir line by line
		do
			echo -e "$file"		#print the files and directories
		done				#for loop ends
	read -p "enter the any key to count of characters(leave blank for exit) : " input  #taking input from the user 

	if [ -z "$input" ]			#if user input is blank -z:checking the empty string
	then
		echo "GOOD BYEEEEEE..!!!"
		break				#it will break the while loop and program terminate
	else
		echo -n "$input" | wc -c	#if there is i/p from user it will print the count of that string
	fi					#end the if statment
	
done						#end of while loop

