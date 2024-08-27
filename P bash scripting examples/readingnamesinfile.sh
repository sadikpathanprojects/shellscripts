#!/bin/bash

#this script reads the names written in a file using for loop

file="/root/file2"

for name in $(cat $file)
do
echo "name is $name"
done