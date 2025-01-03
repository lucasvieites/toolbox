#!/bin/bash
# Find out if a file is empty and, if so, delete it
# Prerequisites: create an empty file, for example by running: touch ~/tmp/my_empty_file.txt
FILE="~/tmp/my_empty_file.txt"

# Check if file exists and size is greater than zero
if [ -s $FILE ]
then
	echo "$FILE exists and size is greater than 0";
elif [ -f $FILE ]; then
	echo "$FILE exists and size is 0";
	echo "Deleting $FILE ...";
	rm $FILE
else
	echo "$FILE does not exist"
fi

exit
