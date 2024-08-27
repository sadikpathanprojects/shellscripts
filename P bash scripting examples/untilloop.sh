#!/bin/bash



num=1
until [ $num -eq 11 ]
do
    echo $num
   num=`expr $num + 1`   #let num++
done