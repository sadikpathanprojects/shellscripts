#!/bin/bash

function abc {
     if [[ $# -eq 0 ]]
     then
         echo "provide atleast one arguments"
         exit 1     #this will stop the script.
    else
        echo "this function is running and the provided argument is $1"
    fi
}


abc 
echo "this is the test echo"


