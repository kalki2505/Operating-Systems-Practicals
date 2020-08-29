#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 1
#Write a shell script to check if directory exists and if it exists, 
#display list of files and directories (along with subdirectories) in it.

echo "Which directory are you looking for?"
read D
if [ $D ]
then
	user=$(whoami)
	loc=$(find /home/$user/ -name $D)
	if [ $loc ] 
	then 
		echo "Directory \"$D\" exists at location $loc"
		cd $loc
		ls -a -R -t -x -1 $loc
		# -a do not ignore entries starting with .
		# -C list entries by columns
		# -R list subdirectories recursively
		# -t sort by modification time, newest first
		# -x list entries by lines instead of by columns
		# -1 list one file per line. 
		# -X sort alphabetically by entry extension


	else 
		echo "Directory \"$D\" does not exist!"
	fi
else
		printf "\n\n\t\t\tERROR: Invalid/NULL directory name"
fi
printf "\n\n"