#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 16
#Write a shell script to make Menu for file and directory management :
#a. Display Current Directory
#b. List Directory
#c. Make a new Directory
#d. Change Directory
#e. Copy File
#f. Rename File
#g. Delete File
#h. Edit content of File
#i. Exit


clear 
echo "\t**********************************************************"
echo "\t\t File and Directory Management"
echo "\t**********************************************************"
echo "\t\t\t 1 Display Current Directory"
echo "\t\t\t 2 List Directory"
echo "\t\t\t 3 Make a new directory"
echo "\t\t\t 4 Change directory"
echo "\t\t\t 5 Copy file"
echo "\t\t\t 6 Rename file"
echo "\t\t\t 7 Delete file"
echo "\t\t\t 8 Edit content of a file"
echo "\t\t\t 9 Exit"
echo "\t**********************************************************"
echo "\t\tEnter choice: "
read choice

case "$choice" in
   "1") ls -s
   ;;
   "2") ls
   ;;
   "3") 
		echo "\tEnter the name of the new directory: " 
		read newdir
		if [ -d $newdir ]
		then
			echo "New directory \"$newdir\" already exist"
		else
			mkdir "$newdir"
			
			if [ $? -eq 0 ]
            then
            	echo "\t New directory \"$newdir\" created successfully in the current directory \"$PWD\""
            	echo "\n\t Here's what is in the current directory along with the newly created directory"
            	ls 
            fi	
		fi
   ;;

   "4") 
		echo "\t Enter path of the new directory: " 
		read newloc
		if [ -d $newloc ]
		then
			cd $newloc
			echo "\n\t Jumped to directory \"$newloc\""
		else
			echo "$directory does not exist!"
		fi
   ;;
	
   "5")
		echo "\t Below is the list of files. Select any of them to copy it into the current directory."
		ls -p -x -1 -X | grep -v /
		echo "\n \t Enter file name:"
		read file
		if [ -f $file ]
        then
        	newfile="Copy of $file" 
			echo $newfile
			cp "$file" "$newfile" 
            if [ $? -eq 0 ]
            then
            	echo "\n\t Copy of file \"$file\" created successfully. Here's the list of files in current directory!"
				ls -p -x -1 -X | grep -v /                  
			else
				echo "UNEXPECTED ERROR OCCURRED"
            fi         
        else
            echo "$file not found in the current directory"
        fi
   ;;
   "6")
		echo "\t Below is the list of files. Select any of them to rename it"
		ls -p -x -1 -X | grep -v /
		echo "\n \t Enter file name:"
		read file
		echo "\n \t Enter new file name:"
		read newfilename
		mv "$file" "$newfilename"
		if [ $? -eq 0 ]
        then
			echo "\n\t File \"$file\" renamed to \"$newfilename\" successfully. Here's the list of files in current directory!"
			ls -p -x -1 -X | grep -v /                
		else
			echo "UNEXPECTED ERROR OCCURRED"
        fi      
		
   ;;
   "7") 
		echo "\t Below is the list of files. Select any of them to delete it"
		ls -p -x -1 -X | grep -v /
		echo "\n \t Enter file name:"
		read file
		rm -i "$file"
		if [ $? -eq 0 ]
        then
			echo "\n\t File \"$file\" deleted successfully. Here's the list of files in current directory!"
			ls -p -x -1 -X | grep -v /              
		else
			echo "UNEXPECTED ERROR OCCURRED WHILE DELETING FILE "
        fi      
   ;;
   "8") echo "\n \t Enter file name:"
		read file
		nano $file
   ;;
   "9") exit 1
   ;;

	*) echo "INVALID INPUT"
	;;
esac