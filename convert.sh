#!/bin/bash

tonum() {
  local INPUT_DIR="."
  local COUNTER=1

  for IMAGE in "$INPUT_DIR"/*.{jpg,jpeg,png}; do
    if [ -f "$IMAGE" ]; then
      EXTENSION="${IMAGE##*.}"
      OUTPUT_FILE="$COUNTER.$EXTENSION"
      mv "$IMAGE" "$OUTPUT_FILE"
      ((COUNTER++))
    fi
  done

  echo "Renaming completed. Files saved to $OUTPUT_DIR."
}

convert() {
  INPUT_DIR="."
  local PALLETE=$1
  if [ -z $PALLETE ]; then
    PALLETE="white"
  fi
  # Loop through each image file in the input directory
  for IMAGE in "$INPUT_DIR"/*.{jpg,jpeg,png}; do
    # Check if the file exists to avoid errors with wildcards
    if [ -f "$IMAGE" ]; then
      # Process the image (replace `convert` with your command)
      gruvbox-factory -p $PALLETE -i "$IMAGE"
    fi
  done
}
