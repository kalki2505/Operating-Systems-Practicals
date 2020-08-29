#!/bin/sh
#Author: Kalki Bhavsar
#Email: kalki.b@ahduni.edu.in, kalkibhavsar2505@gmail.com
#Enrollment Number: AU1841029

#Question 10
#to compare files in a directory and if they have the same content,
#delete one of them.

echo "What directory name are you looking for?"
read directory
user=$(whoami)
count=0
for loc in  $( find  /home/$user/ -type 'd' -name "$directory")
do 
  echo "Directory \"$directory\" exists at location \"$loc\""
  cd $loc
  for file1 in $(find $loc -type f)
    do
      for file2 in $(find $loc -type f)
      do
        echo "Processing \"$file1\" and \"$file2\""
        if [ $file1 != $file2 ]
        then
          if [ -f $file1 -a -f $file2 ]
          then

            difference=$( cmp "$file1" "$file2" )
            
            if [ $difference ]
            then
              echo "\"$file1\" and \"$file2\" have different content."
            else
              echo "\"$file1\" and \"$file2\" have same content. Deleting \"$file2\"...."
              rm "$file2"
              if [ $? -eq 0 ]
              then
                  echo -e "\tFile $file2 deleted Successfully!"
              else
                  echo -e "\tError in deleting file $file2!"
              fi
            fi
          fi
        fi
      done
    done
  
  count=`expr $count + 1`
done
if [ $count -eq 0 ] 
then 
  echo "Directory \"$directory\" does not exist!"
fi
