#!/bin/bash

if [[ ! $1 =~ ^[-+]?[0-9]*$ ]] || [[ ! $2 =~ ^[-+]?[0-9]*$ ]]; then
    echo $1
    echo "Usage: $0 <number> <number>"
    exit 1
fi
   
if [[ $1 -gt $2 ]]; then
    echo "$1 ist größer als $2"
elif [[ $1 -lt $2 ]]; then
    echo "$1 ist kleiner als $2"
else
    echo "$1 ist gleich zu $2"
fi