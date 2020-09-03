#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 1 grep command - Subquestion - 1(a)
#1) Search the following
#b) Sequence of three integers

echo "What directory name are you looking for?"
read directory
pat="012 123 234 345 456 567 678 789"
revpat=$( echo pat | rev )

totalmatchlines=0		#count of total matches


if [ $directory ]		#if input is given and not null
then

	user=$(whoami)
	
	count=0		#count of directories who name is $directory


	for loc in  $( find  /home/$user/ -type 'd' -name "$directory")
	do 
		#printf "\n Directory \"$directory\" exists at location \"$loc\""
		cd $loc
		for file in $( ls -p | grep -v /)
	    do
	    	#printf "\n\nSearching for sequence and string of 3 digits in file \"$file\" ...."
	    	printf "\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
			printf "\n :) Following $matches line/s contains words having 3 consecutive digits in the file \"$file\""	
			printf "\n-----------------------------------------------------------------------------------------------------------------------------\n"		 
			printf ":)  List of sequence of 3 digits in the file \"$file\"\n"			   
			#get list of all lines having pattern $seq which is 3 digit number			   		
	    	grep "[[:digit:]][[:digit:]][[:digit:]]" "$file"
			totalmatchlines=`expr $totalmatchlines + $(grep -c "[[:digit:]][[:digit:]][[:digit:]]" "$file")`			   		
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