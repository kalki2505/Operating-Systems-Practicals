#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 8
#Write a shell script and use for loop to copy all the files 
#in the current directory to another specified directory.

printf "\n\n\t\tTo copy all the files from the two source directories to destination directory, give the following details."
user=$(whoami)
printf "\n\t\tWhat is the name of the source directory 1 ?"
read sourcedir1
if [ $sourcedir1 ]
then
	loc1=$(find /home/$user/ -name $sourcedir1)
	if [ $loc1 ]
	then
		printf "\n\t\tWhat is the name of the source directory 2 ?"
		read sourcedir2
		if [ $sourcedir2 ]
		then
			loc2=$(find /home/$user/ -name $sourcedir2)
			if [ $loc2 ]
			then
				printf "\n\t\tWhat is name of the destination directory?"
				read destinationdir
				if [ $destinationdir ]
				then
					loc3=$(find /home/$user/ -name $destinationdir)
					if [ $loc3 ]
					then
					#if target directory does not exist, create a new one in the current dir	
						cp -R -i $loc1/* $loc3
						cp -R -i $loc2/* $loc3
						printf "\n\n\t\t\tFiles from $loc1 and $loc2 copied to $loc3 successfully."		
						
					else
						# making new directory
						loc3="/home/${user}/Desktop/$destinationdir"
						#printf "\n\n $loc3"
						mkdir $loc3
						if [ -d $dloc3 ]
						then
							echo "Destination directory \"$destinationdir\" not found ! Hence created a new one at $loc3 !"
							cp -R -i $loc1/* $loc3
							cp -R -i $loc2/* $loc3
							printf "\n\n\t\t\tFiles from $loc1 and $loc2 copied to $loc3 successfully."	
						else
							printf "\n\n\t\t\tOOPS! ERROR OCCURRED... Seems like invalid input!"
						fi
					fi


				else
					printf "\n\n\t\t\tERROR: Invalid/NULL destination directory name"
				fi
			else
				printf "\n\n\t\t\tSource directory 2 \"$sourcedir2\" not found !"
			fi
		else
			printf "\n\n\t\t\tERROR: Invalid/NULL source directory 2 name"
		fi
	else
		printf "\n\n\t\t\tSource directory 1 \"$sourcedir1\" not found !"
	fi
else
	rintf "\n\n\t\t\tERROR: Invalid/NULL source directory 1 name"
fi
printf "\n\n"