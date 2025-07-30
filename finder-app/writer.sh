#!/bin/bash

if [ $# -lt 2 ]
then
    echo "Specify both path and content text"
    exit 1
fi

writefile=$1
writestr=$2

if [ -f $writefile ]
then
    echo "$writestr" > $writefile
else
    dpath=$(dirname "$writefile")
    if ! mkdir -p "$dpath"
    then
        echo "Err: Could not create directory '$dpath'"
        exit 1
    fi

    if ! touch $writefile
    then
        echo "File could not be created"
        exit 1
    fi

    echo "$writestr" > $writefile
fi