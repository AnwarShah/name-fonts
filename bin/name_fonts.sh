#!/bin/bash

# This script extract font name and rename fonts to wotf

# read one line at a time with read
while read -r line
do
  # scan file and create a name and style with space substituted by _
	type=`file -b "$line" | cut -d , -f 1`
  if [[ "$type" =~ 'Web Open Font Format' ]];
  then
    name=`fc-scan --format "%{postscriptname}" "$line" | tr ' ' '_'`
    
    echo "$line->$name.wotf"
    mv "$line" "$name.wotf"
  elif [[ "$type" =~ 'TrueType font data' ]];
  then
    name=`fc-scan --format "%{postscriptname}" "$line" | tr ' ' '_'`
    
    echo "$line->$name.ttf"
    mv "$line" "$name.ttf"
  fi
done < <(find . -maxdepth 1 -type f)

