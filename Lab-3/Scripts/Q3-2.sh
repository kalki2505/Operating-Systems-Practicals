#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 3 awk command - Subquestion - 2
#Add line numbers to an input stream

awk '
	BEGIN{i=1} {
		printf "	%d % s\n", i,$0; 
		i++
	}'

# "$0" prints the first argument of the input stream, i prints its value
# Value of i gets increments after each input.