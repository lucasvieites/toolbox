#!/bin/bash
# Test script for filename replacement with datestamp
# Prerequisite: create ~/tmp/mytestfile.txt, for example by running "touch ~/tmp/mytestfile.txt"
echo "Let's add the date to a filename"

# Get the name of the file without the path (this could be changed to be obtained from an argument)
filename=$(basename "~/tmp/mytestfile.txt")
# Get the file extension
extension="${filename##*.}"
# Get the filename without extension
filename="${filename%.*}"
# Get today's date in Year-month-day format
# See man page dor "date" for more formatting options
today=`date +"%Y%m%d"`

# Build the new filename with the parts
DESTFILE="${today}-${filename}.${extension}"
# Show it to the world!
echo "Old name: " $filename.${extension}
echo "New name: " $DESTFILE
