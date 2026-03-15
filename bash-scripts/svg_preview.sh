#!/bin/bash
# title           : svg_preview.sh
# description     : Creates a png file from all svg files found in the directory tree at DEPTH
# author          : Lucas Vieites
# date            : 20180411
# version         : 0.2
# usage           : svg_preview.sh [DEPTH]
# dependencies    : this script relies on the 'convert' command from ImageMagick
#                   (https://www.imagemagick.org/)
# =============================================================================================
# v0.2 - Added support for filenames with spaces

DEPTH=${1:-3}

# Find all svg files in the directory tree using null delimiter for proper space handling
find . -type f -maxdepth "$DEPTH" -name "*.svg" -print0 | while IFS= read -r -d '' SVGFILE; do
	# Get the path, name, and extension in different variables
	DIR=$(dirname "$SVGFILE")
echo "DIR is ${DIR}"
	NAME=$(basename "$SVGFILE" | cut -d'.' -f1)
echo "NAME is ${NAME}"
	EXTENSION=$(basename "$SVGFILE" | cut -d'.' -f2)
echo "EXTENSION is ${EXTENSION}"
	
	# Use quoted variables to handle spaces in filenames
	PNG_FILE="${DIR}/${NAME}_preview.png"
	SVG_FILE="${DIR}/${NAME}.${EXTENSION}"
	
	# Check if preview exists
	if [ -f "$PNG_FILE" ]; then
		# If SVG file is newer than PNG preview
		if [ "$SVG_FILE" -nt "$PNG_FILE" ]; then
			echo "The SVG is newer than the PNG, creating new preview."
			# convert SVG to PNG to get newer preview
			convert -monitor "$SVG_FILE" "$PNG_FILE"
		else
			echo "The preview is up to date, keeping the existing PNG file."
		fi
	else
		# Create the preview for the first time
		echo "Creating ${PNG_FILE} for the first time."
		convert -monitor "$SVG_FILE" "$PNG_FILE"
		echo
	fi
	echo "========================================================================================="
done
