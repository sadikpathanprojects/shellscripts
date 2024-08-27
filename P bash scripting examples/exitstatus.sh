#!/bin/bash


cat /abc/tempfile  #this file or directory is not existing
echo $?  #this will output 1


# $? gives the status of the previous command if that was successful or not.
