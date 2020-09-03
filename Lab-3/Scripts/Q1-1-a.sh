#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 1 grep command - Subquestion - 1(a)
#Search the following
#a) Word “kind or wind” in all file of current directory

echo "What directory name are you looking for?"
read directory
word="kind or wind"

totalmatchlines=0				#count of total matches

if [ $directory ]		#if input is given and not null
then

	user=$(whoami)

	count=0			#count of directories who name is $directory

	for loc in  $( find  /home/$user/ -type 'd' -name "$directory")
	do 
		#printf "\n Directory \"$directory\" exists at location \"$loc\""
		cd $loc
		for file in $( ls -p | grep -v /)
	    do
	    	#printf "\n\nSearching for pattern \"$word\" in file \"$file\" ...."
	    	matches=$(grep -c "$word" "$file" )			#count for the number of pattern matches
	    	if [ $matches -gt 0 ]	# if a pattern found if total matches > 0
	    	then
	    		printf "\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	    		printf "\n :) Following $matches line/s contains has pattern \"$word\" in the file \"$file\""	
	    		printf "\n-----------------------------------------------------------------------------------------------------------------------------\n"
	    		grep "$word" "$file"	#get list of all lines starting from 'm' character
		   		totalmatchlines=`expr $totalmatchlines + $matches`
		   		printf "\n\nTotal $matches line/s matched with pattern \"$word\" in the file \"$file\""
		   	#else
		   		#printf "\n OOPS! :( \n No line matched with pattern \"$word\" in the file \"$file\""
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