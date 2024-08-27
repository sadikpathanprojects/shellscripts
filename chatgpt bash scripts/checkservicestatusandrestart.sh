#!/bin/bash

# Define the service name
SERVICE_NAME="apache2"  # Change this to the service you want to monitor

# Define the log file location
LOG_FILE="/var/log/service_monitor.log"

# Function to check if the service is running


#The --quiet option suppresses output, so it only returns the exit status.
check_service() {
    if systemctl is-active --quiet "$SERVICE_NAME"; then
        echo "$(date) - $SERVICE_NAME is running." >> "$LOG_FILE"
    else
        echo "$(date) - $SERVICE_NAME is not running. Restarting..." >> "$LOG_FILE"
        # Restart the service
        systemctl restart "$SERVICE_NAME"
        # Check if the restart was successful
        if systemctl is-active --quiet "$SERVICE_NAME"; then
            echo "$(date) - $SERVICE_NAME restarted successfully." >> "$LOG_FILE"
        else
            echo "$(date) - Failed to restart $SERVICE_NAME." >> "$LOG_FILE"
        fi
    fi
}

# Run the check and restart function
check_service