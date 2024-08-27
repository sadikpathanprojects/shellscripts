#!/bin/bash

# Define variables
LOCAL_DIR="/path/to/local/directory"  # Update this to the directory you want to back up
REMOTE_USER="username"                # Update this to your remote server username
REMOTE_HOST="remote.server.com"       # Update this to your remote server hostname or IP
REMOTE_DIR="/path/to/remote/directory" # Update this to the directory on the remote server
LOG_FILE="/var/log/backup.log"         # Update this to the location of your log file

# Create the log file if it does not exist
touch "$LOG_FILE"

# Check if the local directory exists
if [ ! -d "$LOCAL_DIR" ]; then
    echo "$(date) - Error: Local directory $LOCAL_DIR does not exist." >> "$LOG_FILE"
    exit 1
fi

# Perform the backup using rsync
rsync -avz --delete "$LOCAL_DIR/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR" >> "$LOG_FILE" 2>&1

# Check if rsync was successful
if [ $? -eq 0 ]; then
    echo "$(date) - Backup completed successfully." >> "$LOG_FILE"
else
    echo "$(date) - Error: Backup failed." >> "$LOG_FILE"
fi