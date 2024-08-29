#Write a Bash script that takes a directory path as an argument and creates a .zip archive of all files in that directory. The archive should be named archive.zip.

#!/bin/bash

directory=$1
archivename="archive.zip"

# Check if the provided argument is a valid directory
if [ ! -d "$directory" ]; then
  echo "Directory does not exist"
  exit 1
fi

# Create a zip archive of all files in the directory
zip -r "$archivename" "$directory"/*
