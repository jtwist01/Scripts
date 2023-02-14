#!/bin/bash

# Set the file names to check
files=(action1.txt action2.txt action3.txt action4.txt action5.txt 
action6.txt action7.txt action8.txt action9.txt)

# Check if all files are present
missing_files=()
for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then
        missing_files+=("$file")
    fi
done

# If all files are present, transfer them to remote server
if [ ${#missing_files[@]} -eq 0 ]; then
    echo "All files present"
    scp "${files[@]}" ftpabc@abc123.def.net:/remote/directory
else
    # Print message for each missing file
    for file in "${missing_files[@]}"; do
        echo "===> $file missing!"
    done
fi

