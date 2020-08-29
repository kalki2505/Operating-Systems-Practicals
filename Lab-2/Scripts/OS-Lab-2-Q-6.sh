#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 6
#Delete all zero-sized file from it and its sub-directories.

printf "\n\n\t\tDelete all zero-sized file from it and its sub-directories, give the following details."

printf "\n\t\tWhat is the directory name?"
read dir
if [ $dir ] 
then 
	user=$(whoami)
	count=0
	for loc in  $( find  /home/$user/ -type 'd' -name "$dir")
	do 
		#echo "Directory \"$D\" exists at location $loc"
		cd $loc
		# Deleting files with size 0
		find . -type f -size 0 -delete
		printf "\n\n\t\t\tMESSAGE: Zero-sized files deleted from the directory \"$loc\""
		count=`expr $count + 1`
	done
	if [ $count -eq 0 ] 
	then 
		printf "\n\n\t\t\tDirectory \"$dir\" not found!"
	fi
else
		printf "\n\n\t\t\tERROR: Invalid/NULL directory name"
fi
printf "\n\n"


