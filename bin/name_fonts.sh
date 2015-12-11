#!/bin/bash

# This script extract font name and rename fonts to wotf

# read one line at a time with read
while read -r line
do
    # scan file and create a name and style with space substituted by _
	name=`fc-scan --format "%{postscriptname}" "$line" | tr ' ' '_'`
    
    echo "$line->$name.wotf"
	mv "$line" "$name.wotf"
done < <(find . -maxdepth 1 -type f)

