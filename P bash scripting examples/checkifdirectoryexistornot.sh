#!/bin/bash
mkdir /tmp/abc

dirpath=/tmp/abc

if [[ -d $dirpath ]]
then
echo "directory exists "
else
echo "directory does not exists"
fi