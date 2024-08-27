#!/bin/bash

read -p "which site you want to connect with" site
ping -c 1 $site

# $? checks the status of the last command. if last command was successful then $? will be 0. else $? will be 1.
if [[ $? -eq 0 ]]
then 
    echo "the connection was successful"
else
    echo "the connection was not successful"
fi