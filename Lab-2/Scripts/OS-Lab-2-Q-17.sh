#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 17
#Write a shell script which reads a text file and output the following:
#a. Count the number of characters, words and lines
#b. File in reverse order
#c. Frequency of any particular word in the file
#d. Replace Lower case alphabets in place of Upper Case Alphabets

clear
echo "Which file are you looking for in the current directory?"
read filename
#filename="Employees.txt"
if [ -f $filename ] 
then 
	echo "\t**********************************************************"
	echo "\t\t File Analysis"
	echo "\t**********************************************************"
	echo "\n\t\tInitial data of the file!"
	cat $filename
	echo "\n\n\t\t 1 Here's all count record of file \"$filename\""
	ch=$(wc -m $filename)
	lines=$(wc -l $filename)
	words=$(wc -w $filename)
	echo "\n\t\t\t Total lines: $lines"
	echo "\n\t\t\t Total words: $words"
	echo "\n\t\t\t Total characters: $ch"

	echo "\n\n\t\t 2 Here's the file \"$filename\" in reverse order!\n"

	tac "$filename" | while read -r line; do
		echo "$line" |rev
	done


	echo "\n\n\t\t\t 3 Here's lower to upper converted text!\n"
	cat "$filename" | while read -r line; do
		echo $line | tr [:lower:] [:upper:]

	done
	

	echo "\t**********************************************************"

	
else 
	echo "File \"$filename\" does not exist in the current directory \"$PWD\"!"
fi

