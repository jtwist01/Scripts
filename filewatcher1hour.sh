#!/bin/bash

# Set the directory to search for .txt files
SEARCH_DIR="/path/to/search/directory"

# Initialize the counter for the number of .txt files found
FILE_COUNT=0

# Set the duration of the script (in seconds)
DURATION=3600

# Set the interval for checking for new files (in seconds)
CHECK_INTERVAL=600

# Loop until all 10 .txt files have been found or the script has run for 
one hour
while [ $FILE_COUNT -lt 10 ] && [ $DURATION -gt 0 ]
do
  # Search for new .txt files in the directory
  NEW_FILES=$(find $SEARCH_DIR -maxdepth 1 -name "*.txt" -newermt "-10 
minutes")

  # Count the number of new .txt files found and add them to the total 
count
  NUM_NEW_FILES=$(echo "$NEW_FILES" | wc -l)
  FILE_COUNT=$((FILE_COUNT + NUM_NEW_FILES))

  # If new .txt files were found, print a message to the console
  if [ $NUM_NEW_FILES -gt 0 ]
  then
    echo "Found $NUM_NEW_FILES new .txt files. Total files found: 
$FILE_COUNT."
  fi

  # Sleep for the specified interval before checking again
  sleep $CHECK_INTERVAL

  # Decrement the remaining duration of the script by the check interval
  DURATION=$((DURATION - CHECK_INTERVAL))
done

# Print a message indicating the results of the search
if [ $FILE_COUNT -eq 10 ]
then
  echo "All 10 .txt files have been found."
else
  echo "Not all files were located. $FILE_COUNT out of 10 files were 
found."
fi

