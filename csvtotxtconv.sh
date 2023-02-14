#!/bin/bash

# Get the current date and time in YYYY-MM-DD-HHMMSS format
datetime=$(date +"%Y-%m-%d-%H%M%S")

# Set the input and output file names
input_file="input.csv"
output_file="output_${datetime}.txt"

# Convert the input file to the output file using awk
awk -F, '{print $0}' "${input_file}" > "${output_file}"

# Print a message to the console indicating the conversion is complete
echo "File '${input_file}' has been converted to '${output_file}'"

