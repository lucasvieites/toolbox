#!/bin/bash
# title           : svg_preview.sh
# description     : Creates a png file from all svg files found in the directory tree at DEPTH
# author          : Lucas Vieites
# date            : 20180411
# version         : 0.1
# usage           : svg_preview.sh
# dependencies    : this script relies on the 'convert' command from ImageMagick
#                   (https://www.imagemagick.org/)
# =============================================================================================
# TODO: Make this work with filenames that have spaces in them

DEPTH=3

# Find all svg files in the directory tree
for SVGFILE in `find . -type f -maxdepth ${DEPTH} -name "*.svg"`;
do
	# Get the path, name, and extension in different variables
	DIR=`dirname "$SVGFILE"`
	echo "DIR is ${DIR}";
	NAME=`basename "$SVGFILE" | cut -d'.' -f1`
	echo "NAME is ${NAME}";
	EXTENSION=`basename "$SVGFILE" | cut -d'.' -f2`
	echo "EXTENSION is ${EXTENSION}";
	# Check if preview exists
	if [ -f ${DIR}/${NAME}_preview.png ];
	then
		if [ ${DIR}/${NAME}.svg -nt ${DIR}/${NAME}_preview.png ]; # If SVG file is newer than PNG preview
		then
			echo "The SVG is newer than the PNG, creating new preview.";
			# convert SVG to PNG to get newer preview
			convert -monitor ${DIR}/${NAME}.svg ${DIR}/${NAME}_preview.png;
		else
			echo "The preview is older, keeping the existing PNG file.";
		fi
	else
		# Create the preview for the first time
		echo "Creating ${DIR}/${NAME}_preview.png for the first time.";
		convert -monitor ${DIR}/${NAME}.svg ${DIR}/${NAME}_preview.png;
		echo
	fi
	echo "========================================================================================="
done