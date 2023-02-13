#!/bin/bash

# Function to check if a file is a duplicate
check_duplicate() {
  local file="$1"
  local checksum=$(md5sum "$file" | awk '{print $1}')
  [ -f "$checksum" ] && return 0 || return 1
}

# Loop through all files in the current working directory
for file in *; do
  # Skip if file is a directory
  [ -d "$file" ] && continue

  # Check if file is a duplicate
  check_duplicate "$file"
  if [ $? -eq 0 ]; then
    # File is a duplicate, so remove it
    rm "$file"
    echo "Removed duplicate file: $file"
  else
    # File is not a duplicate, so create a checksum file for it
    md5sum "$file" > "$(md5sum "$file" | awk '{print $1}')"
  fi
done

