#Write a Bash script that takes a directory path as an argument and prints the number of files and directories within that directory.#

#!/bin/bash

# Check if a directory path was provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 directory_path"
  exit 1
fi

directory=$1

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory does not exist"
  exit 1
fi

# Count the number of files and directories within the provided directory
num_files=$(find "$directory" -maxdepth 1 -type f | wc -l)
num_dirs=$(find "$directory" -maxdepth 1 -type d | wc -l)

# Subtract 1 from the directory count to exclude the directory itself
num_dirs=$((num_dirs - 1))

echo "Number of files: $num_files"
echo "Number of directories: $num_dirs"
