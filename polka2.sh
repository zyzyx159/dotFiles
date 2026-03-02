#!/bin/bash

# Define the paths
SOURCE_DIR="$PWD/dot-config"
DEST_DIR="$HOME/.config"

# 1. Delete the existing $HOME/.config directory and all its contents
if [ -e "$DEST_DIR" ] || [ -L "$DEST_DIR" ]; then
    echo "Removing existing directory: $DEST_DIR"
    rm -rf "$DEST_DIR"
fi

# 2. Re-create an empty $HOME/.config directory
mkdir -p "$DEST_DIR"

# 3. Handle hidden files and empty directories in the source
shopt -s dotglob
shopt -s nullglob

# 4. Loop through everything inside dot-config and symlink it
for item in "$SOURCE_DIR"/*; do
    # Get just the name of the file or folder (e.g., 'nvim' or 'kitty.conf')
    item_name=$(basename "$item")

    echo "Linking: $DEST_DIR/$item_name -> $item"
    ln -s "$item" "$DEST_DIR/$item_name"
done

# Clean up shell options
shopt -u dotglob
shopt -u nullglob

echo "Finished linking config files!"

