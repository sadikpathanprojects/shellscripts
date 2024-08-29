#Write a Bash script that takes a directory path as an argument and compresses all .txt files in that directory into a single .tar.gz archive named texts_archive.tar.gz.

#!/bin/bash

directory=$1
BACKUP_NAME="texts_archive.tar.gz"

# Check if the provided argument is a valid directory
if [ ! -d "$directory" ]; then
  echo "Directory does not exist"
  exit 1
fi

# Compress all .txt files in the directory into a single tar.gz archive
tar -czvf "$BACKUP_NAME" -C "$directory" *.txt
