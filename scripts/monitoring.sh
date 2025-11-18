Script that downloads a file from the internet using wget or curl and stores it in a predefined
directory.

#!/bin/bash
# Author: Ghanishtha Bhardwaj
# Date: 18/11/25
# --- Script to automate downloads ---

# check if target url argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <target_url>"
    exit 1 # exit with an error status of 1 , abnormal termination
fi
# Initialise the file URL with the first argument
url="$1"

# Predefined directory for downloads
download_dir="/home/ghanishtha/downloads"
# Log file
log_file="/home/ghanishtha/downloads/dowoad_log.txt"

# Create directory if it doesn’t exist
mkdir -p "$download_dir"

# Extract filename from URL
filename=$(basename "$url")
# Download using wget
echo "Downloading $filename ..."
wget -q -O "$download_dir/$filename" "$url"

# Check if download was successful
if [ $? -eq 0 ]; then
    echo"Download successful: $download_dir/$filename"
    echo "$(date): Downloaded $filename from $url" >> "$log_file"
else
    echo "Download failed!"
    echo "$(date): Failed to download from $url" >> "$log_file"
fi
