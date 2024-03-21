# toolbox

Little scripts that make my life easier. This repository is split in several directories containing PHP, Bash, and other scripts.

## PHP-scripts
### urlendecode.php - Url encoder/decoder

This script encodes and decodes a string via de <i>urlencode()</i> and <i>urldecode()</i> functions.

### timestamp2date.php - UNIX timestamp converter

This script converts a [UNIX timestamp](http://en.wikipedia.org/wiki/Timestamp) to a more readable format: "day-month-year hours:minutes:seconds"

### sortuniq.php - Sort text and remove duplicates

This script sorts the lines of the entered text and removes duplicates. Basically, it's the same as what ```cat file.txt | sort | uniq``` would do on a bash command line.

### functions.php

A collection of PHP functions I have used in my websites

### function_tester.php

Usage samples for the functions in functions.php

## Bash-scripts
### svg_preview.sh - creates PNG files from SVG

Traverses a directory structure, down to a configurable depth, looking for SVG files and creating a PNG image preview from all SVGs it finds.

It checks if a preview already exists and only creates a new one if the PNG is older than the SVG.
