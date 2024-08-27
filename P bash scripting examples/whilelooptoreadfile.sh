#!/bin/bash

#this while loop will read the data in the file1

while read var
do
	echo $var
done < /root/file1