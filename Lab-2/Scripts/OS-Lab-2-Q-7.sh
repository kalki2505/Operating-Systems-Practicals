#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 7
#sort directory in ascending order of the size of each file.

printf "\n\n\t\t To sort directory in ascending order of the size of each file, give the following details."

printf "\n\t\tWhat is the directory name?"
read dir
if [ $dir ] 
then 
	user=$(whoami)
	loc=$(find /home/$user/ -name $dir)
	if [ $loc ]
	then
		#echo "Directory \"$D\" exists at location $loc"
		printf "\n\n\t\t\t Files in the directory \"$loc\"\n\n"
		# l - displaying information about file
		# S - sorting by Size in descending order
		# r - reversing output in ascending order 
		ls -S -r -s -l -1 $loc

	else
		printf "\n\n\t\t\tDirectory \"$dir\" not found!"
	fi
else
		printf "\n\n\t\t\tERROR: Invalid/NULL directory name"
fi
printf "\n\n"


