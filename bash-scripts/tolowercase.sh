#!/bin/bash
string="Hi tHerE, tHis haS UppErCase leTTeRs"
echo "Before converting: $string"
# Convert string to lowercase
string=`echo $string | tr "[:upper:]" "[:lower:]"`
echo "After converting: $string"
