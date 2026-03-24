#!/bin/bash

TARGET="$PWD/house"

# Allow * to find hidden files and handle empty dirs
shopt -s dotglob
shopt -s nullglob

for file_path in "$TARGET"/*; do
    if [ -f "$file_path" ]; then

        # 1. Get the original filename (e.g., dot-bashrc)
        original_name=$(basename "$file_path")

        # 2. Check if it starts with "dot-"
        if [[ "$original_name" == dot-* ]]; then
            # Replace "dot-" with "." (e.g., .bashrc)
            clean_name=".${original_name#dot-}"
        else
            # If it doesn't have the prefix, keep it as is
            clean_name="$original_name"
        fi

        HOME_FILE="$HOME/$clean_name"

        # 3. Clean up existing file/link in Home
        if [ -e "$HOME_FILE" ] || [ -L "$HOME_FILE" ]; then
            echo "Removing existing: $HOME_FILE"
            rm -rf "$HOME_FILE"
        fi

        # 4. Create the symlink
        echo "Linking: $HOME_FILE -> $file_path"
        ln -s "$file_path" "$HOME_FILE"
    fi
done

shopt -u dotglob
shopt -u nullglob

