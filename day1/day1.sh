#!/bin/bash

#the above line is shebang line which tells your program where to run your program.(like your movie production name)

# for multiline comment use
<< ////
##############################################
#echo is used to print the content

echo "Enter your name : "
read name			#read is using for reading the input i.e name
echo "Welcome $name to your first script...!!!"
echo "Happy Scripting"

#another program
echo Hello, who am I talking to?
read varname
echo It\'s nice to meet you $varname

###############################################

#Varible : we used to store the value and use whenever we want.

first_name=Akash
last_name=Kamble
echo "Hi my name is $first_name $last_name"


################################################
#use of Varaible for creating script for addition :

#Simple calculator for 2 var.
#val1=25
#val2=12

read -p "Enter 1st Number:" val1
read -p "Enter 2nd Number:" val2

sum=$(($val1 + $val2))
echo "addition of $val1 and $val2 is $sum"
sub=$((val1 - $val2))
echo "substraction of $val1 and $val2 is $sub"
mul=$(($val1 * $val2))
echo "multiplication of $val1 and $val2 is $mul"
div=$(($val1 / $val2))
echo "dividation of $val1 and $val2 is $div"

////

####################################################
#Predefined Variables : Bash Provides built in var that holds useful info.
#we can use that variables anywhere in our script because they are globally defied.

echo "we are currently using $BASH"
echo "Hostname of our system is $HOSTNAME"
echo "Home directory of current use is $HOME"
echo "present working directory is $PWD"
echo "Content of current directory : `ls`"
PATH=$PATH:$PWD

