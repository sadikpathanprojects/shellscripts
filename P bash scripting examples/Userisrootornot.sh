#!/bin/bash

if [[ $UID -eq 0 ]]

then
      echo "user logged in is root"

else
      echo "user logged in is not root"
fi
