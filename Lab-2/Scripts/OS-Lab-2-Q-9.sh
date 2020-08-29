#!/bin/bash
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 9
#Write a shell script to compare identically named files in two different directories and if
#they are the same, copy one of them in a third directory.
user=$(whoami)
echo "What is the name of the source directory 1 you are looking for?"
read sourcedirectory1
if [ $sourcedirectory1 ]
then
	loc1=$(find /home/$user/ -type 'd' -name $sourcedirectory1)
	if [ $loc1 ] 
	then 
		echo "Source directory 1 \"$sourcedirectory1\" exists at location $loc1"
		echo "What is the name of the source directory 2 you are looking for?"
		read sourcedirectory2
		if [ $sourcedirectory2 ]
		then
			loc2=$(find /home/$user/ -type 'd' -name $sourcedirectory2)
			if [ $loc2 ] 
			then 
				echo "Source directory 2 \"$sourcedirectory2\" exists at location $loc2"
				

				echo "What is the name of the destination directory you are looking for?"
						read destinationdirectory
						if [ $destinationdirectory ]
						then
							loc3=$(find /home/$user/ -type 'd' -name  $destinationdirectory)
							if [ $loc3 ] 
							then 
								echo "Destination directory  \"$destinationdirectory\" exists at location $loc3"							
							else 
								loc3="/home/$user/$destinationdirectory"
								mkdir $loc3						
								echo "Destination directory \"$destinationdirectory\" does not exist! Hence creating a new one at $loc3"
							fi

							sourcefiles1=$(ls $loc1)
							sourcefiles2=$(ls $loc2)
							count=0
							for file1 in $sourcefiles1
							do
							    for file2 in $sourcefiles2
							    do
							        if [ -f "$loc1/$file1" -a -f "$loc2/$file2" ]
							        then
							            if [ "$file1" == "$file2" ]
							            then
							                diff "$loc1/$file1" "$loc2/$file2" 1> /dev/null
							                if [ $? -eq 0 ]
							                then
							                    echo "$file1 and $file2 are same content !"
							                    cp "$loc1/$file1" "$loc3/$file3"
							                    cp "$loc2/$file2" "$loc3/$file3"
							                    count=`expr $count + 1`
							                fi
							            fi
							        fi
							    done
							done

							echo "Total $count files transferred from $sourcedirectory1 and $sourcedirectory2 to $destinationdirectory...."

						else
								printf "\n\n\t\t\tERROR: Invalid/NULL destination directory name"
						fi



			else 
				echo "Source directory 2 \"$sourcedirectory2\" does not exist!"
			fi
		else
				printf "\n\n\t\t\tERROR: Invalid/NULL source directory 2 name"
		fi
	else 
		echo "Source directory 1 \"$sourcedirectory1\" does not exist!"
	fi
else
		printf "\n\n\t\t\tERROR: Invalid/NULL source directory 1 name"
fi
printf "\n\n"

