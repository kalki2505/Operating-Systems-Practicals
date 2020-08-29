#!/bin/bash
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 18
#Write a shell script to perform the following user operations :
#a. Print sorted list of users
#b. Count total number of users
#c. Search for any specific user and display no. of times the user logged in
#d. Check if any specific user is terminally active
#e. List all users without password

clear
printf "\n\n\t\t**********************************************************"
printf "\n\t\t\t\t       USER DETAILS"
printf "\n\t\t**********************************************************"
printf "\n\t\t\t 1 Sorted List of Users\n"
count=0
for username in $(ls /home/)
do
	USERS[$count]=$username
	count=`expr $count + 1`
	printf "\t\t\t Username $count: $username\n"
	
done

printf "\n\n\t\t\t 2 Total Users: $count\n"

printf "\n\n\t\t\t 3 Search User\n"
printf "\n\t\t   What is the username of the user you are looking for?"
read user
notfound=1
for username in ${USERS[*]}
do
	if [[ "$username" == "$user" ]]
	then
	    printf "\n\t\t\t\tUsername \"$user\" found! Below is the activity details...\n\n"
	    count=0
	    for details in $(last -ax $user)
	    do
	    	if [ $details == $user ]
	    	then
	    		count=`expr $count + 1`
	    	fi
	    done
	    notfound=0
	    printf "\n\n\t\t\t 3 Frequency of login: $count\n"
	    break
	fi
done
if [ $notfound -eq 1 ]
then
	printf "\n\t\t\t\tUsername \"$user\" not found!\n\n"
fi



printf "\n\n\t\t\t 4 Terminally active Users\n"
who

printf "\n\n\t\t\t 5 List of all Users without password\n"
USERS="$(cut -d: -f 1 /etc/passwd)"
for u in $USERS
do
	passwd -S $u | grep -Ew "NP" >/dev/null
	if [ $? -ne 0 ]; 
	then
		printf "\n\n\t\t\tUser without password: $u"
	fi
done

printf "\n\t\t**********************************************************\n\n"

