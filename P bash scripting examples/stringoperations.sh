#!/bin/bash

mystring="heLlo world"

#printing the length of the string
length=${#mystring}
echo $length

#printing all the letters of string in uppercase 
upper=${mystring^^}
echo $upper

#printing the string in lower case
lower=${mystring,,}
echo $lower

#replace world by buddy in string
replace=${mystring/world/buddy}
echo $replace

slice=${mystring:6:5}
echo $slice