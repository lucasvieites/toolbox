#!/bin/bash
# obtiene la dirección IP y la MAC actual de eth0

echo "IP:"
/sbin/ifconfig | grep '\<inet\>' | sed -n '1p' | tr -s ' ' | cut -d ' ' -f3 | cut -d ':' -f2

echo "MAC:"
/sbin/ifconfig | grep 'eth0' | tr -s ' ' | cut -d ' ' -f5
