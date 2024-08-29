#Write a Bash script that takes a file path as an argument and replaces all occurrences of the word "foo" with "bar" in that file.

#!/bin/bash

# Check if a filename was provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 file_path"
  exit 1
fi

file_path=$1

# Check if the file exists
if [ ! -f "$file_path" ]; then
  echo "File does not exist"
  exit 1
fi

# Replace all occurrences of "foo" with "bar" in the file
sed -i 's/foo/bar/g' "$file_path"

echo "Replaced all occurrences of 'foo' with 'bar' in $file_path"
