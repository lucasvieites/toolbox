#!/bin/bash
# This scripts converts all files in the current directory
# from Latin-1 (ISO-8859-1) to UTF-8
# and converts Windows line endings (CRLF) to Unix LF
# Prerequisites: have the iconv and dos2unix commands installed

# Put all files in the current directory in a variable
files=`find ./ -type f`

# Make the newline the default separator
export IFS=$'\n'

# Run iconv on every file
for file in $files; do
	echo Converting ${file} ...;
	base=`basename $file`
	iconv -f latin1 -t utf-8 $file > $base.utf8
	# Change EOL character to LF
	dos2unix $base.utf8
	# Change the name of the converted file to the original one
	mv -i $base.utf8 $base
done
