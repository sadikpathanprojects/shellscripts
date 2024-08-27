#!/bin/bash

echo "enter the below options"
echo "1.to see the current working directory"
echo "2.to list the files"

read choice

case $choice in
    1)pwd;;
    2)ls;;
    *) echo "not a valid input"
esac