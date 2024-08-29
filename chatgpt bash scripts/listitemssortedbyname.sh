
#Bash script that takes a directory path as an argument and prints the names of all files and directories within that directory, sorted by name:

#!/bin/bash

directory=$1

# Check if the provided argument is a valid directory
if [ ! -d "$directory" ]; then
  echo "Directory does not exist"
  exit 1
fi

# List and sort files and directories within the specified directory
ls -1 "$directory" | sort
