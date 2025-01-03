#!/bin/bash

if [ -d $HOME/agendas/ ]; then
	# directory exists
	echo "directory already exists"
else
	echo "directory DOES NOT exist, let's create it"
	mkdir $HOME/agendas
fi
