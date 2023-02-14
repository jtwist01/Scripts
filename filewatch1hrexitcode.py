#!/usr/bin/env python3

import os
import time
import sys

# Set the directory to search for .txt files
SEARCH_DIR = "/path/to/search/directory"

# Initialize the counter for the number of .txt files found
FILE_COUNT = 0

# Set the duration of the script (in seconds)
DURATION = 3600

# Set the interval for checking for new files (in seconds)
CHECK_INTERVAL = 600

# Loop until all 10 .txt files have been found or the script has run for 
one hour
while FILE_COUNT < 10 and DURATION > 0:
    # Search for new .txt files in the directory
    files = os.listdir(SEARCH_DIR)
    new_files = [f for f in files if f.endswith('.txt') and 
os.path.getmtime(os.path.join(SEARCH_DIR, f)) > time.time() - 600]

    # Count the number of new .txt files found and add them to the total 
count
    num_new_files = len(new_files)
    FILE_COUNT += num_new_files

    # If new .txt files were found, print a message to the console
    if num_new_files > 0:
        print(f"Found {num_new_files} new .txt files. Total files found: 
{FILE_COUNT}.")

    # Sleep for the specified interval before checking again
    time.sleep(CHECK_INTERVAL)

    # Decrement the remaining duration of the script by the check interval
    DURATION -= CHECK_INTERVAL

# Set the exit code depending on whether all 10 files were found or not
if FILE_COUNT == 10:
    print("All 10 .txt files have been found.")
    sys.exit(7)
else:
    print(f"Not all files were located. {FILE_COUNT} out of 10 files were 
found.")
    sys.exit(1)

