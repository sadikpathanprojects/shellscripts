#!/bin/bash

myarray=(1 2 hello bro)

#length of an array is
echo "length of array is ${#myarray[*]}"

#accessing only 3rd index element
echo "third element of the array ${myarray[*]:3}"

#2nd and 3rd index element accessing
echo "2nd and 3rd index value is ${myarray[*]:2:2}"

#appending the new values to an array 
myarray+=(4,5,6,7)  #this is added as one element

#printing the array elements
echo "${myarray[*]}"

# accessing all the element using the for loop
for i in ${myarray[@]}
do
echo "$i"
done

#printing the length of an array
echo "length of array is ${#myarray[*]}"


#different way to access the elements of array using for loop:
length=${#myarray[*]}

for(( i=0; i<$length; i++ ))
do
	echo "element is ${myarray[$i]}"
done

 