#!/bin/bash

# Set variables
FTP_SERVER="ftpabc@abc.def.net"
FTP_DIR="/transfer/in"
LOCAL_DIR="/path/to/local/directory"
ARCHIVE_DIR="/path/to/archive/directory"
EMAIL_RECIPIENT="George@abc123.net"

# Loop for 3 hours, checking for a .zip file every 20 minutes
for i in {1..9}; do
  # Check if .zip file exists in local directory
  if [ -f "$LOCAL_DIR/*.zip" ]; then
    # Get the name of the .zip file
    FILE_NAME=$(basename $LOCAL_DIR/*.zip)

    # Transfer the file to remote server using scp
    scp $LOCAL_DIR/$FILE_NAME $FTP_SERVER:$FTP_DIR

    # Unzip the file on the remote server
    ssh $FTP_SERVER "unzip $FTP_DIR/$FILE_NAME -d $FTP_DIR"

    # Move the .zip file to the archive directory
    mv $LOCAL_DIR/$FILE_NAME $ARCHIVE_DIR/$FILE_NAME

    # Get the names of the files that were unzipped
    UNZIPPED_FILES=$(ssh $FTP_SERVER "ls $FTP_DIR")

    # Send an email to notify George of the unzipped files
    echo "The following files were unzipped: $UNZIPPED_FILES" | mail -s 
"Unzipped files" $EMAIL_RECIPIENT
  fi

  # Wait 20 minutes before checking again
  sleep 1200
done

