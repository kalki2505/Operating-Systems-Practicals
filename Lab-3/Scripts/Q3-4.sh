#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 3 awk command - Subquestion - 4
#Write down a program which works like a scientific calculator and performs following
#operations
#• Floating point calculations
#• Trigonometric operations
#• Logarithms
#• Exponent


# initialize the value of pi globally
pi=`echo "scale=10;4*a(1)" | bc -l` 


printf "\n\n\t\t*******************Menu***************************" 

printf "\n\t\t\t\t 1 Floating Point Calculations" 
printf "\n\t\t\t\t 2 Trigonometric Operations" 
printf "\n\t\t\t\t 3 Logarithmic Operations"
printf "\n\t\t\t\t 4 Exponential Operations"
printf "\n\t\t\t\t 5 Exit"

echo '\n\n\t\t\t Enter your choice: ' 
read choice 

case $choice in 
	
	1) 
		echo "\nEnter expression: "
		read expression	
		cal() {
			awk "BEGIN{	print $* }"; 
		}
		evaluatedexpression=`cal $expression` 
		echo "Evaluated expression: $evaluatedexpression" 		
	;; 

	2) 
		echo "\nEnter The Trigonometric Function (sin, cos) : "
		read trigofunction
		echo "Enter The Degree: "
		read degrees 

		evaluatedexpression=$(awk "BEGIN{print $trigofunction($degrees*atan2(0,-1)/180)}");
		echo "$trigofunction($degrees)= $evaluatedexpression" ;
	;; 

	3) 
		echo "\nEnter The Logarithmic Value: "
		read value 
		echo $value | awk '{printf "%11.9f\n",log($1)/log(10)}'
	;; 

	4) echo "\nEnter the base number a: "	
		read a 
		echo "Enter exponent number e: "
		read x
		evaluatedexpression=$(echo "$a 1" | awk "{print (($a/1)^$x)}")
		echo "$a^$x = $evaluatedexpression"	
	;;			 
	5) 
		echo "\n\n Thank you for using this calculator"
	;;
	*) 
		break;; 
esac 

