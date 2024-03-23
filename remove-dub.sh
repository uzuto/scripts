#!/bin/bash

# Create the "Muxed" subfolder
mkdir Muxed

# Loop through each MKV file in the current folder
for file in *.mkv; do
  # Use mkvmerge to remove the first audio and subtitle tracks
  mkvmerge -o "Muxed/${file}" -a \!1 -s \!3,4 "${file}"
done
