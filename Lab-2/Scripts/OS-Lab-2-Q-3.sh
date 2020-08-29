#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 3
#Input name of a file from a user and find out the complete path for the given file name.

echo "Which file are you looking for?"
read F
if [ $F ]
then
	user=$(whoami)
	count=0
	for loc in  $( find  /home/$user/ -type 'f' -name "$F")
	do 
		echo "File \"$F\" exists at the location \"$loc\"!"
		count=`expr $count + 1`
	done
	
	if [ $count -eq 0 ]
	then 
		echo "File \"$F\" does not exist!!"
	fi
else 
	echo "File \"$F\" does not exist!!"
fi
