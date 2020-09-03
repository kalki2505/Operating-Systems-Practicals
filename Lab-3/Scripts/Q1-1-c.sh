#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 1 grep command - Subquestion - 1(a)
#1) Search the following
#b) Search for the word/s where ‘m’ should be the first character in the word/s.

echo "What directory name are you looking for?"
read directory

totalmatchlines=0		#count of total matches

if [ $directory ]		#if input is given and not null
then

	user=$(whoami)
	count=0		#count of directories who name is $directory

	for loc in  $( find  /home/$user/ -type 'd' -name "$directory")
	do 
		#printf "\n Directory \"$directory\" exists at location \"$loc\""
		cd $loc
		for file in $( ls -p *.txt | grep -v /)
	    do
	    	#printf "\n\nSearching for words starting with m or M in file \"$file\" ...."
	    	#Command: grep -E '\bm' file.txt 		for all words starting with m
			#Command: grep -E 'm\b' file.txt 		for all words ending with m

			matches=$(grep -c -E '\bm' "$file")		#total matches for a particular file $file
			if [ $matches -gt 0 ]
	    	then
	    		printf "\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	    		printf "\n :) Following $matches line/s contains words starting with 'm' in the file \"$file\""	
	    		printf "\n-----------------------------------------------------------------------------------------------------------------------------\n"
	    		grep -n ^m "$file"	#get list of all lines starting from 'm' character
		   		totalmatchlines=`expr $totalmatchlines + $matches`			   
		   	fi
	    done
		count=`expr $count + 1`
	done

	
	if [ $count -eq 0 ] 
	then 
		echo "Directory \"$directory\" does not exist!"
	else
		printf "\n-----------------------------------------------------------------------------------------------------------------------------\n"
		printf  "\t\tTotal matched lines: $totalmatchlines\n\n"
	fi
else
	echo "ERROR: INVALID/ NULL INPUT"
fi