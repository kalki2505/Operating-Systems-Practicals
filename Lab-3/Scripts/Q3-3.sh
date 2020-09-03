#!/bin/bash
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 3 awk command - Subquestion - 3
#Collect each line of input in a separate array element then prints them out in reverse

echo "Enter the input stream. Press ENTER  to stop the stream."
total_input_lines=0
array=()
# Read the input line until newline/empty/null user input is sent
while read input_line
do
    if [ $input_line ]		# checking if input line's length 0 i.e empty input
    then
    	array+=("$input_line")
    	total_input_lines=`expr $total_input_lines + 1`
    	
    else
    	echo "Input stream over... Thank you for your input"
        break
    fi
done

echo "Total lines in the input stream: $total_input_lines"
# Printing all the input lines in reverse order
echo "Reverse order of the input stream: "
while [ ! $total_input_lines -eq -1 ]
do
    echo ${array[$total_input_lines]}
    total_input_lines=`expr $total_input_lines - 1`
done
