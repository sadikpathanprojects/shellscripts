#!/bin/bash

# Define the input file containing the list of usernames
USER_FILE="/path/to/userlist.txt"  # Update this path to your file containing usernames

# Define the default password
DEFAULT_PASSWORD="your_default_password"  # Update this to your desired default password

# Define the log file location
LOG_FILE="/var/log/user_addition.log"

# Check if the user file exists
if [ ! -f "$USER_FILE" ]; then
    echo "$(date) - Error: User file $USER_FILE not found." >> "$LOG_FILE"
    exit 1
fi

# Function to add a user and set the default password
add_user() {
    local username=$1
    
    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "$(date) - User $username already exists." >> "$LOG_FILE"
    else
        # Add the user
        useradd "$username"
        
        # Check if the user was added successfully
        if [ $? -eq 0 ]; then
            echo "$(date) - User $username added successfully." >> "$LOG_FILE"
            # Set the default password
            echo "$username:$DEFAULT_PASSWORD" | chpasswd
            # Check if the password was set successfully
            if [ $? -eq 0 ]; then
                echo "$(date) - Password for user $username set successfully." >> "$LOG_FILE"
            else
                echo "$(date) - Failed to set password for user $username." >> "$LOG_FILE"
            fi
        else
            echo "$(date) - Failed to add user $username." >> "$LOG_FILE"
        fi
    fi
}

# Read the user file and add each user
while IFS= read -r username; do
    # Skip empty lines or lines starting with '#'
    if [ -n "$username" ] && [[ "$username" != \#* ]]; then
        add_user "$username"
    fi
done < "$USER_FILE"