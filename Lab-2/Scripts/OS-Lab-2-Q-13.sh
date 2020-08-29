#!/bin/bash
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 13
#Write a shell script to read a dynamic number of files names as command-line
#arguments and create a file with each those names. If a file name already exists, then
#move that file to another subdirectory and then create a new file with that name.

echo "Enter the name of a subdirectory: "
read subdirectory
if [ $subdirectory ]
then
	if [ -d $subdirectory ]
	then
		echo "subdirectory $subdirectory already exists!"
	else
		for filename in "$@"
		do
			echo "Argument: $filename"
		   	if [ -f $filename ]
		   	then
		   		mkdir -p $subdirectory
		   		loc="${PWD}/${subdirectory}/$filename"
		   		touch $loc
		   		echo "File \"$filename\" created at $loc..."
		   	else
		   		touch "$filename"
		   		echo "File \"$filename\" created at current location $PWD..."
		   	fi
		done
	fi
else
	echo "NULL subdirectory"
fi
