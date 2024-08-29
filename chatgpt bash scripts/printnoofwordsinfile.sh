#Write a Bash script that takes a file path as an argument and prints the number of words in that file.

#!/bin/bash

file_path=$1

# Check if the file exists
if [ ! -f "$file_path" ]; then
  echo "File does not exist"
  exit 1
fi

# Count the number of words in the file
words=$(wc -w < "$file_path")
echo "Number of words: $words"
