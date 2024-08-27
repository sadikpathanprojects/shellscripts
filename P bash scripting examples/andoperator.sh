#!/bin/bash

read -p "whats your age?" var1
read -p "whats your nationality?" var2

if [[ $var1 -ge 18 ]] && [[ $var2 == "India" ]]
then
    echo "you can vote."
else
echo "you cant vote"
fi