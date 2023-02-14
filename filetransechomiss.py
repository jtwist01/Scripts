#!/usr/bin/env python

import os
import subprocess

# Set the file names to check
files = ['action1.txt', 'action2.txt', 'action3.txt', 'action4.txt', 
'action5.txt', 'action6.txt', 'action7.txt', 'action8.txt', 'action9.txt']

# Check if all files are present
missing_files = []
for file in files:
    if not os.path.isfile(file):
        missing_files.append(file)

# If all files are present, transfer them to remote server
if len(missing_files) == 0:
    print("All files present")
    subprocess.run(['scp'] + files + 
['ftpabc@abc123.def.net:/remote/directory'])
else:
    # Print message for each missing file
    for file in missing_files:
        print(f"===> {file} missing!")

