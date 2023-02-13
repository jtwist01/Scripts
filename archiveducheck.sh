#!/bin/bash

# Get the current date and time
date=$(date +"%Y-%m-%d_%H-%M-%S")

# Check disk usage in each directory
df -h /archive/abc /archive/def /archive/ghi /archive/jkl /archive/mno 
/archive/pqr /archive/stu /archive/vwx /archive/yz > 
/tmp/disk_usage_report_$date.txt

# Convert the report to pdf format
enscript -E --color -p - /tmp/disk_usage_report_$date.txt
ps2pdf - /tmp/disk_usage_report_$date.pdf

# Email the pdf report
mail -s "Disk Usage Report" -a /tmp/disk_usage_report_$date.pdf -r 
dick@abc.com john@abc.com <<< "Attached is the disk usage report for the 
specified directories."

# Remove the temporary files
rm /tmp/disk_usage_report_$date.txt
rm /tmp/disk_usage_report_$date.pdf
