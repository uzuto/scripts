#!/bin/bash

# Specify the directory containing the chapter files
CHAPTER_DIR="./chaps"

# Loop through each chapter file in the directory
for CHAPTER_FILE in "$CHAPTER_DIR"/*.xml; do
    # Extract the episode name from the chapter file name
    EPISODE_NAME=$(basename "$CHAPTER_FILE" .xml)
    
    # Specify the corresponding MKV file
    MKV_FILE="./${EPISODE_NAME}.mkv"

    # Check if the MKV file exists
    if [ -f "$MKV_FILE" ]; then
        # Run mkvmerge to add the chapter file to the MKV file
        mkvmerge -o ./with_chp/"${EPISODE_NAME}.mkv" --chapters "$CHAPTER_FILE" "$MKV_FILE"
        echo "Chapters added to ${EPISODE_NAME}.mkv"
    else
        echo "MKV file ${EPISODE_NAME}.mkv not found"
    fi
done
