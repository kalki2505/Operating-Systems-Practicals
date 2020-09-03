#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 1 grep command - Subquestion - 4
#Search the string “nice time” in all the files in current directory and its subdirectories.

echo "What directory name are you looking for?"
read directory
word="nice time"


if [ $directory ]		#if input is given and not null
then

	user=$(whoami)

	count=0			#count of directories who name is $directory
	for loc in  $( find  /home/$user/ -type 'd' -name "$directory")
	do 
		#printf "\n Directory \"$directory\" exists at location \"$loc\""
		cd $loc
		printf "\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		printf "\n :) List of files has pattern \"$word\" in the directory \"$loc/$directory\""	
		printf "\n-----------------------------------------------------------------------------------------------------------------------------\n"
		grep --color -R "$word" *
			# --colour 		Surround  the  matched  (non-empty)  strings,  matching lines, context lines, file names, 
			#				line numbers, byte offsets, and separators (for fields and
	        #      			groups of context lines) with escape sequences to display them in color on the terminal. 

	        # -R  			Read all files under each directory, recursively.
		count=`expr $count + 1`
	done
	if [ $count -eq 0 ] 
	then 
		echo "Directory \"$directory\" does not exist!"
	else
		printf "\n-----------------------------------------------------------------------------------------------------------------------------\n"
	fi
else
	echo "ERROR: INVALID/ NULL INPUT"
fi