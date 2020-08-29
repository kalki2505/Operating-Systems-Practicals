#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 22
#Write a shell script to display the following menu for a particular file :
#i. Display all the words of a file in ascending order.
#ii.Display a file in descending order.
#iii.Display a file in reverse order.
#iv.Toggle all the characters in the file.
#v.Display type of the file.


echo "Which file are you looking for in the current directory?"
read filename
#filename="Employees.txt"
if [ -f $filename ] 
then 
	echo "\t**********************************************************"
	echo "\t\t Play with files"
	echo "\t**********************************************************"
	echo "\n\t\tInitial data of the file!"
	cat $filename
	echo "\n\n\t\t 1 Here's all words of file \"$filename\" in ascending order!\n"
	touch tmp
	for word in $( cat $filename )
	do
		echo $word >> tmp
	done
	echo $(sort tmp)
	rm tmp
	
	echo "\n\n\t\t 2 Here's the file \"$filename\" in descending order!\n"
	tac $filename
	echo "\n\n\t\t 3 Here's the file \"$filename\" in reverse order!\n"

	cat "$filename" | while read -r line; do
		echo "$line" |rev
	done




	echo "\n\n\t\t 4 Here's the toggled file \"$filename\"!\n"
	a=0
	cat "$filename" | while read -r line; do
		rem=`expr $a % 2`
		if [ $rem -ne 0 ]
		then
			echo "$line"
			echo "$previousline"
		fi
		previousline="$line"
		a=`expr $a + 1`
	done





	echo "\n\n\t\t\t 5 Here's the type of the file!\n"
	file -i $filename

	echo "\t**********************************************************"

	
else 
	echo "File \"$filename\" does not exist in the current directory \"$PWD\"!"
fi

