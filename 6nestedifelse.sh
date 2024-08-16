#!/bin/sh

a = 10
b = 20
c = 5

if [$a -lt  $b]
then
if [$a -lt $c]
  then
  echo “a is less than b and c”
      else 
  echo “a is less than b and greater than c”
fi
else if [$a -gt $b]
then 
   echo “a is greater than b” 
else 
    echo “a and b are equal.”
fi
