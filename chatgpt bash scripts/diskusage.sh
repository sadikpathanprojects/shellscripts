#!/bin/bash

# Threshold percentage for disk usage
THRESHOLD=80

# Email to send the alert
ALERT_EMAIL="admin@example.com"

# Get the current disk usage percentage for the root (/) partition
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if disk usage exceeds the threshold
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    # Prepare the alert message
    SUBJECT="Disk Space Alert: Usage at ${DISK_USAGE}%"
    MESSAGE="Warning: The disk usage on $(hostname) is at ${DISK_USAGE}%.\n\nPlease take action to free up space."
    
    # Send an email alert
    echo -e "$MESSAGE" | mail -s "$SUBJECT" "$ALERT_EMAIL"
fi