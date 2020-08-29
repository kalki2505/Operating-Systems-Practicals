#!/bin/bash
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 14
#Write a shell script to display all files in any specific directory(read from the user) in the
#following format : (One example given for your reference)
#File		Size in KB	Date 	Protection		Owner
#test			6		Sep 1 	-rw-rw-r--		user


echo "What is the directory name?"
read dirname

if [ -d $dirname ]
then
	printf "\n\t\t FILE \t\t\t\t Size in kB \t\t Date \t\t Protection \t\t Owner\n"
    ls -os $dirname | awk '{print "\t\t", $9, "\t\t\t\t",$1, "\t\t", $6, "\t\t", $2, "\t\t", $4}'
	ls $dirname |wc -l
else
    echo "OOPS! $dirname does not exist....."
fi
