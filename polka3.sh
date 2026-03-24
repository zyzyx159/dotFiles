#!/bin/bash

# Define paths
TARGET="$PWD/house"
CONFIG_SOURCE="$TARGET/dot-config"
CONFIG_DEST="$HOME/.config"

# Enable hidden file matching and handle empty folders
shopt -s dotglob
shopt -s nullglob

echo "--- Starting Dotfile Sync ---"

# PART 1: Handle top-level files in 'house' (e.g., dot-bashrc -> .bashrc)
for item_path in "$TARGET"/*; do
    original_name=$(basename "$item_path")

    # Process if it starts with "dot-" but IS NOT the config folder
    if [[ "$original_name" == dot-* ]] && [[ "$original_name" != "dot-config" ]]; then
        clean_name=".${original_name#dot-}"
        HOME_PATH="$HOME/$clean_name"

        # Remove existing file/link in Home
        [ -e "$HOME_PATH" ] || [ -L "$HOME_PATH" ] && rm -rf "$HOME_PATH"

        echo "Linking: $HOME_PATH -> $item_path"
        ln -s "$item_path" "$HOME_PATH"
    fi
done

# PART 2: Handle .config specifically
echo "--- Syncing .config folder ---"

# Delete and recreate the .config directory to ensure it's clean
[ -e "$CONFIG_DEST" ] || [ -L "$CONFIG_DEST" ] && rm -rf "$CONFIG_DEST"
mkdir -p "$CONFIG_DEST"

# Loop through contents of 'dot-config' and link them into '$HOME/.config/'
for config_item in "$CONFIG_SOURCE"/*; do
    item_name=$(basename "$config_item")

    echo "Linking config: $CONFIG_DEST/$item_name -> $config_item"
    ln -s "$config_item" "$CONFIG_DEST/$item_name"
done

# Clean up
shopt -u dotglob
shopt -u nullglob

echo "--- All Done! ---"

