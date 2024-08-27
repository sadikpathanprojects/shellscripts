#!/bin/bash

echo "first arguments passed with script is $1"
echo "second argument passed with script is $2"

echo "all the arguments are $@"
echo "number of arguments are $#"

#for loop to access all the arguments

for filename in $@
do
echo "printing the argument $filename"
done
