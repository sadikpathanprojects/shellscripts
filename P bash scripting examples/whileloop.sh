#!/bin/bash

count=0
num=10

while [ $count -le $num ]
do
	echo "numbers are $count"
	let count++
done