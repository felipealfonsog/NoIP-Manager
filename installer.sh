#!/bin/bash

# Function to display the welcome message
welcome() {
    echo "
    ╔═══════════════════════════════════════╗
    ║                                       ║
    ║   ~ NoIP Manager Installer ~          ║
    ║   Developed with ❤️ by                 ║
    ║   Felipe Alfonso González L.          ║
    ║   Computer Science Engineer           ║
    ║   Chile                               ║
    ║                                       ║
    ║   Contact: f.alfonso@res-ear.ch       ║
    ║   Licensed under BSD 3-clause         ║
    ║   GitHub: github.com/felipealfonsog   ║
    ║                                       ║
    ╚═══════════════════════════════════════╝
    "
    echo "Welcome to the NoIP Manager Installer!"
    echo "---------------------------------------------------------------------"
}

# Function to display the finished message
finished() {
    echo "
    ╔═══════════════════════════════════════╗
    ║                                       ║
    ║   ~ Installation Complete ~           ║
    ║   Thank you for installing NoIP       ║
    ║   Manager! The script has been        ║
    ║   successfully installed.             ║
    ║                                       ║
    ╚═══════════════════════════════════════╝
    "
    echo "You can now run the NoIP Manager using the command: noip-admin"
    echo "---------------------------------------------------------------------"
}

# Function to clean up temporary files
cleanup() {
    echo "Performing cleanup..."
    rm -rf NoIP-Manager-v.0.0.1
    rm -f v.0.0.1.tar.gz
    echo "Cleanup completed."
}

# Display the welcome message
welcome

# Download the package from GitHub
echo "Downloading NoIP Manager..."
curl -L -o v.0.0.1.tar.gz https://github.com/felipealfonsog/NoIP-Manager/archive/refs/tags/v.0.0.1.tar.gz

# Extract the package
echo "Extracting package..."
tar -xzf v.0.0.1.tar.gz

# Move to the src directory and install the script
echo "Installing NoIP Manager..."
sudo cp NoIP-Manager-v.0.0.1/src/noip-admin.sh /usr/local/bin/noip-admin
sudo chmod +x /usr/local/bin/noip-admin

# Perform cleanup
cleanup

# Display the finished message
finished
