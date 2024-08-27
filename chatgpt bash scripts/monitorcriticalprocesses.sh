#!/bin/bash

# Define critical processes and their display names for logging
declare -A PROCESSES=(
    ["nginx"]="Nginx Web Server"
    ["mysql"]="MySQL Database"
    ["apache2"]="Apache HTTP Server"
)

# Log file to record the script's actions
LOG_FILE="/var/log/process_monitor.log"

# Function to check if a process is running
check_process() {
    local process_name=$1
    local display_name=$2
    
    if pgrep -x "$process_name" > /dev/null; then
        echo "$(date) - $display_name ($process_name) is running." >> $LOG_FILE
    else
        echo "$(date) - $display_name ($process_name) is not running." >> $LOG_FILE
    fi
}

# Monitor each process
for process_name in "${!PROCESSES[@]}"; do
    check_process "$process_name" "${PROCESSES[$process_name]}"
done