#Write a Bash script that takes a filename as an argument and checks if the file is writable. If it is writable, print "File is writable"; otherwise, print "File is not writable".

#!/bin/bash

# Check if a filename was provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 filename"
  exit 1
fi

filename=$1

# Check if the file is writable
if [ -w "$filename" ]; then
  echo "File is writable"
else
  echo "File is not writable"
fi
