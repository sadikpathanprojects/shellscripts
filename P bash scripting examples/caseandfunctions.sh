#!/bin/bash

function printpwd {
    echo "this is the function that prints the current working directory"
    pwd
}

function printls {
    echo "this is the function that prints the list of the items"
    ls -l;
}

echo "enter the below options"
echo "1.to see the current working directory"
echo "2.to list the files"

read -r choice

case $choice in
    1)printpwd;;
    2)printls;;
    *) echo "not a valid input"
esac