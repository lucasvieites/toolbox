#!/bin/bash
xhost local:$USER
export DISPLAY=:0.0
zenity --info --title "Lorem ipsum" --text "You have 5 minutes left on your internet session. If you'd like to extend this, please contact your helpdesk."
date >> ./thingy_log.txt
