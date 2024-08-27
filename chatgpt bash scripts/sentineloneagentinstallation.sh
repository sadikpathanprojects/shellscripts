
#!/bin/bash

# Define variables
RPM_FILE="/path/to/sentinelone-agent.rpm"  # Update this to the path of your SentinelOne RPM file
SENTINELONE_LICENSE_KEY="your-license-key"  # Update this with your SentinelOne license key

# Check if the RPM file exists
if [ ! -f "$RPM_FILE" ]; then
    echo "Error: RPM file $RPM_FILE not found."
    exit 1
fi

# Install the SentinelOne agent
echo "Installing SentinelOne agent from $RPM_FILE..."
yum localinstall -y "$RPM_FILE"

if [ $? -ne 0 ]; then
    echo "Error: Failed to install SentinelOne agent."
    exit 1
fi

# Configure the SentinelOne agent with the license key
echo "Configuring SentinelOne agent..."
/opt/sentinelone/bin/sentinelctl --license "$SENTINELONE_LICENSE_KEY"

if [ $? -ne 0 ]; then
    echo "Error: Failed to configure SentinelOne agent with license key."
    exit 1
fi

# Start the SentinelOne service
echo "Starting SentinelOne service..."
systemctl start sentinelone

if [ $? -ne 0 ]; then
    echo "Error: Failed to start SentinelOne service."
    exit 1
fi

# Enable SentinelOne service to start on boot
echo "Enabling SentinelOne service to start on boot..."
systemctl enable sentinelone

if [ $? -ne 0 ]; then
    echo "Error: Failed to enable SentinelOne service on boot."
    exit 1
fi

echo "SentinelOne agent installation and configuration completed successfully."