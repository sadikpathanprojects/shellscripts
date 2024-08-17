#!/bin/bash

a=20
b=15
c=5

if [ $a -lt $b ]; then
if [ $a -lt $c ]; then
echo 'a is less than b'
else
echo 'a is less than b and greater than c'
fi
elif [ $a -gt $b ];then
echo 'a is greater than b'
else
echo 'a and b are equal'
fi
