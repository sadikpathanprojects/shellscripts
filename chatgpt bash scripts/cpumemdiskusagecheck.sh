#!/bin/bash

# Define the log file location
LOG_FILE="/var/log/system_info_report.log"

# Function to get CPU usage
get_cpu_usage() {
    echo "CPU Usage:"
    # Get the CPU usage statistics
    top -bn1 | grep "Cpu(s)" | sed "s/Cpu(s): //;s/ id,*/\n/;s/,/ /g" | awk '{print "User: "$1"%\nSystem: "$2"%\nIdle: "$3"%"}'
}

# Function to get memory usage
get_memory_usage() {
    echo "Memory Usage:"
    # Get memory usage statistics
    free -h | awk '/^Mem:/ {print "Total: "$2"\nUsed: "$3"\nFree: "$4"\nAvailable: "$7}'
}

# Function to get disk usage
get_disk_usage() {
    echo "Disk Usage:"
    # Get disk usage statistics
    df -h | awk 'NR==1 {print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6} NR>1 {print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}'
}

# Output and log the system information
{
    echo "System Information Report - $(date)"
    echo "----------------------------------"
    get_cpu_usage
    echo "----------------------------------"
    get_memory_usage
    echo "----------------------------------"
    get_disk_usage
    echo "----------------------------------"
} | tee -a "$LOG_FILE"