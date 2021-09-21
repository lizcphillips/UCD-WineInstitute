#!/bin/bash
path=/mnt/c/Users/ecphillips/staging
for file in $path/*.txt
do
	cp $file $file.bak
	sed -i "1 i <c01 level=\"subseries\"><did><unittitle>$file</unittitle></did>" $file
	echo "</c01>" >> $file
done
cat $path/*.txt > d242_upload.xml
