#!/bin/bash

#Funciton for display usanges and options
function display_options {
	echo "Usages: $0 [OPTIONS]"
	echo "Options:"
	echo "-c,	--create	for creating the user"
	echo "-d,	--delete	for deleting the user"
	echo "-r,	--reset		for reseting the password"
	echo "-l,	--list		for list out the users"
	echo "-h,	--help		for help"

}

#if user executed only programm without options then it will display_options function will check
#-z flag : we can check whether parameter(programme_name) is passed or not. 
if [ -z $1 ]
then
	display_options
fi

#for creating the user:

if [ "$1" == "-c" ] || [ "$1" == "--create" ] 
then

	read -p "Enter the username:" user
	find=$(cat /etc/passwd | cut -d ":" -f 1 | grep ${user})
	
	if [ "${find}" == "${user}" ]
	then
		echo "User '${user}' is already exists...please try with different name."
	else	
		sudo useradd -m $user
		read -s -p "Enter your password here:" passwd
		echo -e "\n"	
		echo "User '${user}' has created successfully..."
	fi
#else
	#display_options
fi

#for deleting the user:

if [ "$1" == "-d" ] || [ "$1" == "--delete" ]
then

        read -p "Enter the username which you want to delete:" user
        find=$(cat /etc/passwd | cut -d ":" -f 1 | grep ${user})

        if [ "${find}" == "${user}" ]
        then
		sudo userdel -rf ${user}
		echo "User '${user}' has deleted successfully"

        else
                echo "User '${user}' does not found....please provide correct username"
        fi
#else
        #display_options
fi




#for Reset the Password for user :
if [ "$1" == "-r" ] || [ "$1" == "--reset" ]
then

        read -p "Enter the username which you want reset the password:" user
        find=$(cat /etc/passwd | cut -d ":" -f 1 | grep ${user})

        if [ "${find}" == "${user}" ]
        then
		sudo passwd $user
	else
		echo "User '${user}' does not found....please provide correct username"
        fi
#else
        #display_options
fi

#List out the Usernames:
if [ "$1" == "-l" ] || [ "$1" == "--list" ]
then
	echo "List of the System Users and their UID's:"
	sudo cat /etc/passwd | awk -F ':' '$3 < 1000 {print $1,$3}'
	echo "#################################"
	echo "List of Normal Users and their UID's: "
	sudo cat /etc/passwd | awk -F ':' '$3 >= 1000 {print $1,$3}'
	 
fi

if [ "$1" == "-h" ] || [ "$1" == "--help" ]
then
        display_options
fi




