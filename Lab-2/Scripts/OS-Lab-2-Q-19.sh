#!/bin/bash
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 19
#Write a shell script to display detailed attributes of all files that have names beginning
#with “file” followed by either 1, 2, 3, 4, or 5.

echo "Displaying detailed attributes of all files that have names beginning with “file” followed by either 1, 2, 3, 4, or 5....."
for name in `find *`
do
	for match in "file1" "file2" "file3" "file4" "file5"
	do
		if grep -q "$match" <<< "$name"
		then
		 	stat $name
		fi
	done
done 



