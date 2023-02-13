#!/bin/bash

# Loop through all .txt files in the current directory
for file in *.txt; do
  # Get the 4th character of the filename
  fourth_char=${file:3:1}

  # Use a case statement to check the 4th character
  case $fourth_char in
    A) new_file="ABC_$file" ;;
    B) new_file="BAT_$file" ;;
    C) new_file="CAT_$file" ;;
    *) new_file="$file" ;;
  esac

  # Rename the file if the new name is different from the original name
  if [ "$file" != "$new_file" ]; then
    mv "$file" "$new_file"
  fi
done

