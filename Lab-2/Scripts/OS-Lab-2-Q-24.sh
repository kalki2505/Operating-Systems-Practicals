#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 24
#Create a file which contains information about employees.
#The sample record is
#Iyer|Ramanujan|2007|35 cement road, Nagpur|8000
#Write a shell script with three functionality
#i. To add a new employee in file
#ii.To get information about any employee. (Enter name through the keyboard)
#iii.To display all employees whose basic pay is between 4000 to 7000

clear
filename="Employees.txt" 
echo "\t**********************************************************"
echo "\t\t Employee Management"
echo "\t**********************************************************"
echo "\t\t\t 1 Add employee"
echo "\t\t\t 2 Update employee"
echo "\t\t\t 3 Delete employee"
echo "\t\t\t 4 Search employee by name"
echo "\t\t\t 5 Search employees between salary range"
echo "\t\t\t 6 Exit"
echo "\t**********************************************************"
echo "\t\tEnter choice: "
read choice

case "$choice" in
   "1") 
		#echo "File name is $filename"
		touch $filename
		chmod u=rwx "$filename"
		itemcount=`expr $(< "$filename" wc -l) + 1`
		#echo "Total items = $itemcount"
		echo "\n \t Enter employee name:"
		read employeename
		echo "\n \t Enter employee surname:"
		read surname
		echo "\n \t Enter employee's joining year:"
		read yearofjoin
		echo "\n \t Enter employee's address:"
		read address
		echo "\n \t Enter employee's salary:"
		read salary
		echo "$employeename | $surname | $yearofjoin | $address | $salary" >> $filename
		echo "\n\t Employee \"$employeename\" added successfully. Here's the list of all employees!"
		cat -n "$filename"
   ;;
   "2") 
		echo "\t Below is the list of employees. Select any employee code to update it's details."
		cat -n "$filename"
		echo "\n \t Enter employee code:"
		read code
		count=`expr $(< "$filename" wc -l) + 0`
		if [ $count -ge $code ]
		then
			echo "\n \t Enter employee name:"
			read employeename
			echo "\n \t Enter employee surname:"
			read surname
			echo "\n \t Enter employee's joining year:"
			read yearofjoin
			echo "\n \t Enter employee's address:"
			read address
			echo "\n \t Enter employee's salary:"
			read salary
			employee="$employeename | $surname | $yearofjoin | $address | $salary"
			sed -i "${code}s/.*/$employee/" "$filename"
			echo "\n\t Employee \"$employeename\" updated successfully. Here's the list of all employees!"
			cat -n "$filename"
		else
			echo "ERROR: Invalid employee code"
		fi
   ;;
   "3") 
		echo "\t Below is the list of employees. Select any employee code to update it's details."
		cat -n "$filename"
		echo "\n \t Enter employee code:"
		read code
		count=`expr $(< "$filename" wc -l) + 0`
		if [ $count -ge $code ]
		then
			sed -i "${code}d" "$filename"
			echo "\n\t Employee with code \"$code\" deleted successfully. Here's the updated list of all employees!"
			cat -n "$filename"
		else
			echo "ERROR: Invalid item code"
		fi
		
   ;;
   "4") 
		echo "\n \t Enter employee name:"
		read employeename
		count=`expr $(< "$filename" wc -l) + 0`

		grep "$employeename" "$filename" | while read -r employee ; do
		    echo "Search result/ Matching employee details : $employee"
		done

   ;;
   "5")
   		echo "Search results/ Matching Employee Details whose salary is between 4000 and 7000..."
		for row in $(awk '{print $NF}' $filename)
	    do 
	        if [ $row -gt 4000 ] && [ $row -lt 7000 ];
	        then
	            employee=$(awk '/'$row'/ {print}' $filename)
	            echo "$employee"
	        fi
	    done
	;;
   "6")
		exit 1
   ;;
esac


