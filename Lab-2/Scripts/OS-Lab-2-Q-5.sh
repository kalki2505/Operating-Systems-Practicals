#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 5
#Display the name of all executable files in the given directory and print total

printf "\n\n\t\tDisplay the name of all executable files in the given directory and print its total"

printf "\n\t\tWhat is the name of the directory?   "
read dir
user=$(whoami)
if [ $dir ]
then
    count=0
    for loc in  $( find  /home/$user/ -type 'd' -name "$dir")
    do 
         printf "\n\n\t\tThe list of all executable files in the current directory"

        # finding files which are executable
        exefiles=$(find $loc -type f -executable)
        # for counting total files
        filecount=0
        for file in $exefiles
        do
            filecount=`expr $filecount + 1`
            printf "\n\t\t\t File $filecount: \"$file\"" 
        done
        printf "\n\n\t\t*****Total executable files: $filecount*******"

        count=`expr $count + 1`
    done
    if [ $count -eq 0 ] 
    then 
        echo "Directory \"$dir\" does not exist!"
    fi
else
        printf "\n\n\t\t\tERROR: Invalid/NULL directory name"
fi
printf "\n\n"