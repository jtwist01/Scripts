#!/bin/bash

# List of expected filenames
filenames=(apple.txt orange.txt pear.txt peach.txt plum.txt)

# Get today's date in the format YYYYMMDD
today=$(date +%Y%m%d)

send_email() {
    recipient="fred@abc123.com"
    subject="Missing files, please investigate"
    body="File $1 is missing. Please upload it as soon as possible."
    # Send the email
    echo "$body" | mail -s "$subject" -r "john@abc123.com" "$recipient"
}

# Check for missing files
for filename in "${filenames[@]}"; do
    file_path="${today}_${filename}"
    if [ ! -f "$file_path" ]; then
        send_email "$filename"
    fi
done
