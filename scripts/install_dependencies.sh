#!/bin/bash

# Define the application directory
APP_DIR="/home/ec2-user/app"

# Ensure we are in the correct directory, though CodeDeploy runs from root of bundle
cd "$APP_DIR" || { echo "Failed to change directory to $APP_DIR"; exit 1; }

echo "Starting BeforeInstall cleanup and dependency installation..."

# --- CLEANUP (New additions) ---
echo "Attempting to remove previous application files (if they exist)..."
# Remove previous application files to prevent 'file already exists' errors
# Be careful with rm -rf. Ensure paths are correct.
rm -rf app.py || true
rm -rf scripts/install_dependencies.sh || true
rm -rf scripts/start_server.sh || true
# You might want to remove the entire app directory content if it's safe
# rm -rf "$APP_DIR"/* || true
# Alternatively, if you want to be very thorough before CodeDeploy copies
# It's better if CodeDeploy handles the primary copy, but for specific pre-existing files:
# sudo rm -rf /home/ec2-user/app/* # Use with extreme caution!

# Create the application directory if it doesn't exist
# This is usually handled by appspec.yml's 'files' section, but good for idempotency
mkdir -p "$APP_DIR" || { echo "Failed to create directory $APP_DIR"; exit 1; }
mkdir -p "$APP_DIR"/scripts || { echo "Failed to create directory $APP_DIR/scripts"; exit 1; }
# --- END CLEANUP ---


# Install Python if needed (for example)
echo "Installing Python3 if not already installed..."
sudo yum install -y python3 || { echo "Failed to install python3"; exit 1; }

# Install dependencies (none in your app now, but placeholder)
# pip3 install -r requirements.txt

echo "BeforeInstall cleanup and dependency installation complete."
