#!/bin/sh

if [ $# -lt 2 ]
then
    echo "Supply 2 arguments to $0"
    exit 1

fi

filesdir="$1"     #path to directory on filesystem
searchstr="$2"    #search string to use for search


if [ -d "${filesdir}" ]
then
    echo "${filesdir} exists\n"

    # X=$(ls $filesdir | wc -l)
    # Y=$(grep -r "$searchstr" "$filesdir" | wc -l)

    X=$(grep -rF "$searchstr" "$filesdir" 2>/dev/null | wc -l)

    Y=$(find "$filesdir" -type f | wc -l)


    echo "The number of files are $X and the number of matching lines are $Y"
else
    echo "${filesdir} does not exist"
    exit 1
fi

