#!/bin/sh
clear
apm=$(date +%p)
time=$(date +%r)
date=$(date +%D)
if [ "$apm" = "AM" ]
then
	echo "\n\n\t\t Good Morning User! Today's date is $date. It's $time!\n\n"
else
	echo "\n\n\t\t Good Night User! Today's date is $date. It's $time!\n\n"
fi