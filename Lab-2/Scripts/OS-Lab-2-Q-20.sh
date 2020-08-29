#!/bin/bash
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 20
#Write a shell script to broadcast a specific message to any specified user or a group of
#users logged on any terminal.

echo "\n\t\tTo broadcast your message to any user or a group of users logged on any terminal, "
echo "\n\n\t\t\t\tEnter your message:"
read message

echo "\n\n\t\t***********Select the reciever****************"
echo "\n\t\t\t 1. User Terminal"
echo "\n\t\t\t 2. Group of Users logged into terminal"
echo "\n\n\t\t**********************************************"
read choice
case $choice in
	"1") 
		echo "\n\n\t\t Enter Terminal ID:"
       	read user
       	echo $message > $user
    ;;
    "2") 
		echo "\n\n\t\t Enter Group Name:"
       	read group
       	wall -g $group
    ;;
    *) echo"Invalid input"
	;;
esac