#!/bin/bash

# Define the log file and the error keyword
LOG_FILE="/path/to/logfile.log"  # Update this path to your log file
ERROR_KEYWORD="ERROR"           # Update this to the keyword or pattern you're searching for

# Define the log file location for results
RESULT_FILE="/var/log/error_search_results.log"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "$(date) - Error: Log file $LOG_FILE not found." >> "$RESULT_FILE"
    exit 1
fi

# Count the occurrences of the error keyword
ERROR_COUNT=$(grep -i "$ERROR_KEYWORD" "$LOG_FILE" | wc -l)

# Log the results
{
    echo "$(date) - Searching for '$ERROR_KEYWORD' in $LOG_FILE"
    echo "Number of occurrences: $ERROR_COUNT"
} >> "$RESULT_FILE"

# Output the results to the console
echo "Search completed. Results are logged in $RESULT_FILE"