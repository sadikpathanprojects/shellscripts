#!/bin/bash
fruits=( banana apple orange )

max=2
for (( i=0; i <= "$max"; ++i ))
do
    echo "${fruits[$i]}"
done 
