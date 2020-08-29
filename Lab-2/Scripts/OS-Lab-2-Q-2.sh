#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 2
#read the name of a specific file and delete the file if it exists.

echo "Which file are you looking for?"
read F
if [ $F ]
then
	user=$(whoami)
	count=0
	for loc in  $( find  /home/$user/ -type 'f' -name "$F")
	do 
		echo "File \"$F\" exists at location \"$loc\"!" 
		rm -i -v $loc
		# if file was removed successfully
		#ls $loc
	    if [ -f "$loc" ]
	    then
	    	echo "ERROR occured in deleting file \"$F\"  from the location \"$loc\"!"	    
	    else
	    	echo "File \"$F\" deleted successfully from the location \"$loc\"!"
	    fi	
		count=`expr $count + 1`
	done
	if [ $count -eq 0 ] 
	then 
		echo "File \"$F\" does not exist!"
	fi
else 
	echo "File \"$F\" does not exist!"
fi
