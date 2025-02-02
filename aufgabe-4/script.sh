#!/bin/bash

maxPacketLoss=50

packet_loss=$(ping -c5 "$1" | grep -oP '\d+(?=% packet loss)')

if [ "$packet_loss" -eq 100 ]; then
    echo "Server ist down"
elif [ "$packet_loss" -ge "$maxPacketLoss" ]; then
    echo "Zu viele Pakete werden verloren"
else 
    echo "Dem Server geht's gut"
fi

echo "Paketverlust: $packet_loss%"
