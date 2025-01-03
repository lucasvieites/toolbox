#!/bin/bash
# evaluate substring in bash
STRINGVAR=$1
if [[ ${STRINGVAR:0:2} == "co" ]]; then
	echo "las dos primeras letras son 'co'";
else
	echo "las dos primeras letras NO son 'co'";
fi