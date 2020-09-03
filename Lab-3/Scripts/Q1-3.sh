#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 1 grep command - Subquestion - 3
#Display line numbers of the files that contains the words “hello”

echo "What directory name are you looking for?"
read directory
word="hello"

totalfiles=0				#count of total files that has pattern matches

if [ $directory ]		#if input is given and not null
then

	user=$(whoami)

	count=0			#count of directories who name is $directory
	printf "\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	printf "\n :) List of files has pattern \"$word\" in the directory \"$directory\""	
	printf "\n-----------------------------------------------------------------------------------------------------------------------------\n"
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
	    		#printf "\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	    		#printf "\n :) Following $matches line/s contains has pattern \"$word\" in the file \"$file\""	
	    		#printf "\n-----------------------------------------------------------------------------------------------------------------------------\n"
		   		#printf "\n\nTotal $matches line/s matched with pattern \"$word\" in the file \"$file\""
		   		printf "\n\n\t File name: \"$file\" \t Location : $loc/$file Total matching lines: $matches"
		   		printf "\n\t Matching lines with pattern \"$word\":\n"
		   		grep -n "$word" "$file"	#get list of all lines having pattern $word
				totalfiles=`expr $totalfiles + 1`
				printf "\n-----------------------------------------------------------------------------------------------------------------------------\n"
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
		printf  "\t\tTotal files with matching pattern \"$word\": $totalfiles\n\n"
	fi
else
	echo "ERROR: INVALID/ NULL INPUT"
fi