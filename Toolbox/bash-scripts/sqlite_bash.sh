#!/bin/bash
sqlite3 test.db  "create table n (id INTEGER PRIMARY KEY,f TEXT,l TEXT);"
sqlite3 test.db  "insert into n (f,l) values ('john','smith');"
sqlite3 test.db  "select * from n";

# Check if a table exists
DB="test.db"

function table_exists(){
	Q="SELECT name FROM sqlite_master WHERE type='table' AND name='$1';"
	R=`sqlite3 $DB "$Q"`
	if [ "$R" = "$1" ]; then
		echo 1
	else
		echo 0
	fi
}

STATE=$( table_exists “n” )
if [ "$STATE" -gt 0 ]; then
	sqlite3 $DB "CREATE TABLE n (id INTEGER PRIMARY KEY, f TEXT, l TEXT);"
else
	echo "TABLE ALREADY EXISTS"
fi
