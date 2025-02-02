#!/bin/bash

if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <number>"
    exit 1
fi

function fakultaet {
    if [[ $1 -eq 0 ]]; then
        echo 1
    else
        echo $(( $1 * $(fakultaet $(( $1 - 1 ))) ))
    fi
}

fakultaet "$1"
