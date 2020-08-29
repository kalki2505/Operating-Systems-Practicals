#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 4
#Write a shell script and use for loop to move all the files 
#in the current directory to another specified directory.

printf "\n\n\t\tTo move all the files in the current directory to another specified directory, give the following details."

printf "\n\t\tWhat is the source directory?"
read sourcedir
if [ $sourcedir ]
then

	if [ -d $sourcedir ]
	then
		printf "\n\t\tWhat is the destination directory?"
		read destinationdir
		if [ $destinationdir ]
		then
			#if target directory does not exist, create a new one in the current dir

			if [ ! -d $destinationdir ]
			then
				# making new directory
				mkdir $destinationdir
				echo "Destination directory \"$destinationdir\" not found in current directory. Hence created a new one!"
			fi

			destinationfiles=$(ls $sourcedir)
			# iterating through all files listed by ls command
			for file in $destinationfiles
			do
				printf "\n\t\t\tMoving \"$file\"..."
				mv -i "$PWD/$sourcedir/$file" "$PWD/$destinationdir/$file"
			done
			printf "\n\n\t\t\tFiles from $sourcedir moved to $destinationdir successfully."
		


		else
			printf "\n\n\t\t\tERROR: Invalid/NULL destination directory name"
		fi
	else
		printf "\n\n\t\t\tSource directory \"$sourcedir\" not found in the current directory $PWD"

	fi
else
		printf "\n\n\t\t\tERROR: Invalid/NULL source directory name"
fi
printf "\n\n"