#Write a Bash script that takes a directory path as an argument and prints the total number of files and directories recursively within that directory.


#!/bin/bash

# Check if a directory path was provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 directory_path"
  exit 1
fi

directory=$1

# Check if the provided argument is a valid directory
if [ ! -d "$directory" ]; then
  echo "Directory does not exist"
  exit 1
fi

# Count the total number of files and directories recursively
total_count=$(find "$directory" -type f -o -type d | wc -l)

echo "Total number of files and directories: $total_count"
