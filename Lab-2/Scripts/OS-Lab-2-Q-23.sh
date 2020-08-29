#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 23
#Write a shell script that appends the PID of the current shell to the filenames of all the
#files having extension .txt.


echo "\n\n\t******Initial and renamed list of files**********"
for name in `find *.txt`
do
	echo "\nInitial file name:\t $name"
	pid=$(echo $$ )
	filename=$(echo `basename $name .txt`)
	#pid=5
    newfilename=$(echo "${filename}${pid}.txt")
    echo "New file name:\t $newfilename"
    mv $name $newfilename
done 
echo "\n\n\t*****List of .txt files in current directory*******"
for name in `find *.txt`
do
    echo "$newfilename"
done 





