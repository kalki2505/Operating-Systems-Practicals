#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 3 awk command - Subquestion - 1
#Print name and time of login sorted by time


last | awk '{ print $1,$7,$8,$9,$10}' | sort -k7 | sort -k8
