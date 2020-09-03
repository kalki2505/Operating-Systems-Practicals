#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 1 grep command - Subquestion - 5
#Display 5 lines in the file before and after the string “Good Morning”.

echo "Which file are you looking for?"
read F
word="Good Morning"
if [ $F ]
then
	user=$(whoami)
	count=0
	for loc in  $( find  /home/$user/ -type 'f' -name "$F")
	do 
		#echo "File \"$F\" exists at location \"$loc\"!" 
		echo "\n\nBelow are the  5 lines in the file before and after the string \"$word\"! in the file at $loc/$file \n"
		# --colour 		Surround  the  matched  (non-empty)  strings,  matching lines, context lines, file names, 
		#				line numbers, byte offsets, and separators (for fields and
        #      			groups of context lines) with escape sequences to display them in color on the terminal. 
		# -n 			prints line number
		# -A NUM        Print NUM lines of trailing context after matching lines.  Here NUM=5
       	# -B NUM,       Print  NUM  lines  of  leading context before matching lines. Here NUM=5

       	#In short the output by -n, -B 5, -A 5 is collectively displayed on the terminal because of the "--colour" command
		grep --color -n -B 5 -A 5 "$word" "$F"
		count=`expr $count + 1`
	done
	if [ $count -eq 0 ] 
	then 
		echo "File \"$F\" does not exist!"
	fi
else 
	echo "INVALID/ NULL filename"
fi

