#!/bin/bash

count=0

while read -r line; do
    echo "$line"
    ((count+=1))
done < ../README.md
echo "$0 looped $count times"