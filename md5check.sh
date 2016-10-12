#!/bin/sh

md5sum "$1" "$2" > md5.txt
cat md5.txt | while read sum file
do
    prev_sum=$(md5sum $file | awk '{print $1}')
    if [ "$sum" != "$prev_sum" ]
    then
        echo "md5 of file $file does not match"
    else
        echo "$file is fine"
    fi
done

if [ $(head -1 md5.txt | cut -d" " -f1) != $(tail -1 md5.txt | cut -d" " -f1) ]
then 
	echo "Match not found!"
else
	echo "Match found!"
fi
