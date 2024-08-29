#Write a Bash script that takes a filename as an argument and appends the current date and time to the end of the file.

#!/bin/bash

# Check if a filename was provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 filename"
  exit 1
fi

filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "File does not exist"
  exit 1
fi

# Append the current date and time to the end of the file
echo "Current date and time: $(date)" >> "$filename"
