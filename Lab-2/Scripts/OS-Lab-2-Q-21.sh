#!/bin/bash
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 21
#Write a shell script to list all files in a specific directory that are
#a. Newer than a specified date
#b. Older than a specified date


echo "To list all the files older and newer than the date specified enter the following..."
echo "What is the directory name?"
read directory
echo "What is the date in the format 'yyyy-mm-dd' ? "
read date
if [ $directory ]
then
	if [ -d $directory ]
	then
	    echo "List of the files newer than the specified $date "
	    find $directory -type f -newermt $date
	    echo "List of the files older than the specified $date "
	    find $directory -type f ! -newermt $date
	else
	    echo "Directory \"$directory\" does not exist!"
	fi
else
	echo "INVALID INPUT/ NULL INPUT"
fi

