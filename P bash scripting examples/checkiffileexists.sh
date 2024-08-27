#!/bin/bash
mkdir /tmp/abc
cd /tmp/abc
touch file1

filepath=/tmp/abc/file2  #file2 does not exists

if [[ -f $filepath ]]
then
echo "file exists "
else
echo "file does not exists" 
fi