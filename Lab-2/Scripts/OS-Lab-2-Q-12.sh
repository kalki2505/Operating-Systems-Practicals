#!/bin/sh
echo "How many times you want to call HelloWorld?"
read M
echo "How much delay in seconds is preferred?"
read X
gcc -o "HelloWorld.out" "HelloWorld.c"
if [ $M -ge 0 ]
then 
	if [ $X -ge 0 ]
	then
		while [ $M -gt 0 ]
		do
			./"HelloWorld.out"
			sleep $X
			M=`expr $M - 1`
		done
	else
		echo "\n\t\t INVALID INPUT: Delay must be > 0 seconds"
	fi
else
	echo "\n\t\t INVALID INPUT"
fi