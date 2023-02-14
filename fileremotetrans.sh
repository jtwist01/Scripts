#!/bin/bash

# Set variables
source_dir="/path/to/source/dir"
remote_user="ftpabc"
remote_host="ftpabc.abc.def.net"
remote_dir="/path/to/remote/dir"
local_time=$(date "+%Y%m%d-%H%M%S")
email_subject="Special Files Have Been Transferred"

# Count the number of files in the source directory
num_files=$(ls -1 "$source_dir" | wc -l)

# Transfer files to remote server using FTP
ftp -n $remote_host <<END_SCRIPT
quote USER $remote_user
cd $remote_dir
mput "$source_dir"/*
quit
END_SCRIPT

# Check if the transfer was successful
if [ "$?" -eq 0 ]; then
  echo "Transferred $num_files files to $remote_host:$remote_dir"
  # Append timestamp to each file
  ssh $remote_user@$remote_host "cd $remote_dir; for f in *; do mv \$f 
\$f.$local_time; done"
  # Send email notification
  echo "Special files have been transferred." | mail -s "$email_subject" 
-r "george@abc123.com" "fred@abc123.com"
else
  echo "Failed to transfer files to $remote_host:$remote_dir"
fi

