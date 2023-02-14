#!/bin/bash

# Set variables for FTP server and directories
FTP_SERVER="ftptrans@abc123.abc.net"
SOURCE_DIR="/ftp/abc/out"
DEST_DIR="/ftp/abc/stacking"

# Transfer files to remote server
rsync -avz --remove-source-files $SOURCE_DIR/* $FTP_SERVER:$DEST_DIR/

# Count number of files transferred and in stacking directory
num_transferred=$(ls $SOURCE_DIR | wc -l)
num_stacking=$(ssh $FTP_SERVER "ls $DEST_DIR | wc -l")

# Send email with transfer information
echo "Files transferred: $num_transferred" | mail -s "FTP transfer report" 
ftpabc@abc123.net
echo "Files in stacking directory: $num_stacking" | mail -s "FTP transfer 
report" ftpabc@abc123.net

# Output transfer information to console
echo "Files transferred: $num_transferred"
echo "Files in stacking directory: $num_stacking"

