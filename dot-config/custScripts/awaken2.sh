#!/bin/bash

# Define the name of the 'pass' entry where the SSH key passphrase is stored
PASS_ENTRY="ssh/zyzyx@Walker"

# Define the path to your tomb file and mount point
TOMB_FILE="/home/zyzyx/.tomb/RIP.tomb"
TOMB_KEY="/home/zyzyx/.tomb/RIP.tomb.key"
TOMB_MOUNT_POINT="/media/RIP/"

# Define the path to your SSH private key file
SSH_KEY_PATH="/media/RIP/ssh/id_ed25519" # Adjust if your key is in a different location

# --- Function to handle errors ---
handle_error() {
    echo "Error: $1" >&2
    exit 1
}

# --- Prompt for the shared password securely ---
echo -n "Enter password for Tomb and Pass: "
# Read the password without echoing it to the screen
read -sp USER_PASSWORD
echo "" # Add a newline after the hidden input

# Ensure the password variable is not exported to the environment
export USER_PASSWORD

# --- 1. Unlock the tomb vault ---
echo "Attempting to unlock tomb vault..."
# Pass the password to tomb via stdin
echo "$USER_PASSWORD" | tomb open "$TOMB_FILE" -k "$TOMB_KEY" || handle_error "Tomb unlock failed."
echo "Tomb vault unlocked successfully."

# --- 2. Retrieve SSH key passphrase from pass using the same password ---
echo "Retrieving SSH key passphrase from pass..."
# Pass the password to gpg (used by pass) via a custom askpass script
export SSH_ASKPASS_SCRIPT=$(mktemp)
echo '#!/bin/bash' > "$SSH_ASKPASS_SCRIPT"
echo "echo \"$USER_PASSWORD\"" >> "$SSH_ASKPASS_SCRIPT"
chmod +x "$SSH_ASKPASS_SCRIPT"

# Set environment variables to force 'pass' to use the custom askpass script
export DISPLAY=:0 # Required for SSH_ASKPASS to work outside a graphical terminal
export SSH_ASKPASS="$SSH_ASKPASS_SCRIPT"

# Retrieve the passphrase using 'pass'
# 'pass' outputs the password to stdout
PASSPHRASE=$(pass "$PASS_ENTRY")

# Unset the temporary SSH_ASKPASS environment variables and remove the script immediately
unset DISPLAY
unset SSH_ASKPASS
rm "$SSH_ASKPASS_SCRIPT"

if [ -z "$PASSPHRASE" ]; then
    handle_error "Failed to retrieve passphrase from pass."
fi
echo "Passphrase retrieved."

# --- 3. Load the SSH key into the ssh-agent using the retrieved passphrase ---
echo "Loading SSH key into ssh-agent..."
# Check if ssh-agent is running, start it if not
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval $(ssh-agent -s)
fi

# Pass the passphrase to ssh-add via stdin
echo "$PASSPHRASE" | ssh-add "$SSH_KEY_PATH" || handle_error "Failed to add SSH key to ssh-agent."
echo "SSH key added to agent successfully."

# Unset the USER_PASSWORD variable to clear it from memory
unset USER_PASSWORD
unset PASSPHRASE

echo "Setup complete. The vault is open and the SSH key is in your agent."


