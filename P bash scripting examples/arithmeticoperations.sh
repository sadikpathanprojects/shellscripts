#!/bin/bash

a=13
b=12

add=$a + $b   #command not found is the output
echo add  


add=$a+$b   
echo add  # output : add


add=$a+$b
echo $add  #output : 13+12


let addition=$a+$b
echo $addition  #output is 25


echo "substraction is $(($a-$b))"
