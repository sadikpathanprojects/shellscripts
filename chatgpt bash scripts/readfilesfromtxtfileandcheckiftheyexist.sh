
#Write a Bash script that reads a list of filenames from a text file (file_list.txt), checks if each file exists, and prints "File exists: filename" or "File does not exist: filename" for each file.


#!/bin/bash

file_list="file_list.txt"

check_file() {
  local filename=$1

  if [ -f "$filename" ]; then
    echo "File exists: $filename"
  else
    echo "File does not exist: $filename"
  fi
}

while IFS= read -r filename; do
  check_file "$filename"
done < "$file_list"
