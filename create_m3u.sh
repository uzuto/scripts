#!/bin/bash

input_file="eplist"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file '$input_file' not found."
    exit 1
fi

# Create a directory to store the output files
output_dir="output"
mkdir -p "$output_dir"

# Read the input file line by line
while IFS= read -r link; do
    # Remove leading/trailing whitespace
    link=$(echo "$link" | awk '{$1=$1};1')

    # Generate the output file name based on the link
    output_file=$(basename "$link")

    # Create the M3U file with the link
    echo "#EXTM3U" > "$output_dir/$output_file"
    echo "#EXTINF:-1,$link" >> "$output_dir/$output_file"
    echo "$link" >> "$output_dir/$output_file"

done < "$input_file"

echo "M3U files created in the '$output_dir' directory."
