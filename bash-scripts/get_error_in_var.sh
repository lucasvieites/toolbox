#!/bin/bash
# Get error from command into variable
output=`mysql -u root -pmysqlpassword  "SELECT test FROM cosa" 2>&1`
echo "======================================================"
echo $output
echo "======================================================"
