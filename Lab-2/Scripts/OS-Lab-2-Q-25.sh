#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 25
#Create a file which contains information about items in the following manner.
#Item name | item code | item price
#Write a shell script which allows you to add, update, delete and purchase any item from
#The item list and generate a printout of a bill.

clear
filename="Items.txt" 
echo "\t**********************************************************"
echo "\t\t Item Management"
echo "\t**********************************************************"
echo "\t\t\t 1 Add item"
echo "\t\t\t 2 Update item"
echo "\t\t\t 3 Delete item"
echo "\t\t\t 4 Purchase item"
echo "\t\t\t 5 Exit"
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
		echo "\n \t Enter item name:"
		read itemname
		echo "\n \t Enter item price:"
		read itemprice
		#echo "$itemcount | $itemname | $itemprice" >> $filename
		echo "$itemname | $itemprice" >> $filename
		echo "\n\t Item \"$itemname\" with price Rs.$itemprice with code \"$itemcode\" added successfully. Here's the list of items!"
		cat -n "$filename"
   ;;
   "2") 
		echo "\t Below is the list of items. Select any item code to update it's details."
		cat -n "$filename"
		echo "\n \t Enter item code:"
		read itemcode
		itemcount=`expr $(< "$filename" wc -l) + 0`
		if [ $itemcount -ge $itemcode ]
		then
			echo "\n \t Enter item name:"
			read itemname
			echo "\n \t Enter item price:"
			read itemprice
			#item="$itemcode |$itemname | $itemprice"
			item="$itemname | $itemprice"
			echo $item
			sed -i "${itemcode}s/.*/$item/" "$filename"
			echo "\n\t Item with code \"$itemcode\" updated successfully. Here's the list of items!"
			cat -n "$filename"
		else
			echo "ERROR: Invalid item code"
		fi
   ;;
   "3") 
		echo "\t Below is the list of items. Select any item code to delete it."
		cat -n "$filename"
		echo "\n \t Enter item code:"
		read itemcode
		itemcount=`expr $(< "$filename" wc -l) + 0`
		if [ $itemcount -ge $itemcode ]
		then
			sed -i "${itemcode}d" "$filename"
			echo "\n\t Item with code \"$itemcode\" deleted successfully. Here's the updated list of items!"
			cat -n "$filename"
		else
			echo "ERROR: Invalid item code"
		fi
		
   ;;
   "4") 
		echo "\t Below is the list of items. Select any item code to buy it."
		cat -n "$filename"
		echo "\n \t Enter item code:"
		read itemcode
		itemcount=`expr $(< "$filename" wc -l) + 0`
		if [ $itemcount -ge $itemcode ]
		then
			
			line=$(< $filename sed ${itemcode}!d)
			echo $line
			itemname=$(echo $line | cut -d'|' -f 1)
			itemprice=$(echo $line | cut -d'|' -f 2)
			echo "\n \t Enter quantity:"
			read quantity
			if [ $quantity -gt 0  ]
			then 
				echo "\n\n\t\t\t>>> BILL <<<"
				echo "\t\tItem name:\t $itemname"
				echo "\t\tItem code:\t $itemcode"
				echo "\t\tItem price:\t Rs.$itemprice/-"
				cost=`expr $itemprice \* $quantity`
				echo "\t\tTotal cost:\t Rs.$cost/-"
			fi
		else
			echo "ERROR: Invalid item code"
		fi

   ;;
   "5")
		exit
   ;;
esac

