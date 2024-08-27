#!/bin/bash

# Define source and destination directories
SOURCE_DIR="/path/to/source"    # The directory you want to back up
DEST_DIR="/path/to/destination" # The directory where the backup will be stored
BACKUP_NAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Create a backup
echo "Starting backup from $SOURCE_DIR to $DEST_DIR/$BACKUP_NAME"
tar -czf "$DEST_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

# Verify if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed!"
    exit 1
fi

# Optional: Remove old backups older than a specific number of days
# Uncomment the following lines to enable this feature
# RETENTION_DAYS=7
# find "$DEST_DIR" -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS -exec rm {} \;
# echo "Old backups older than $RETENTION_DAYS days have been removed."

exit 0