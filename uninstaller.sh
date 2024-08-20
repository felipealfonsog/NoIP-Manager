#!/bin/bash

# Function to display the welcome message for uninstallation
welcome() {
    echo "
    ╔═══════════════════════════════════════╗
    ║                                       ║
    ║   ~ NoIP Manager Uninstaller ~        ║
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
    echo "Welcome to the NoIP Manager Uninstaller!"
    echo "---------------------------------------------------------------------"
}

# Function to display the finished message after uninstallation
finished() {
    echo "
    ╔═══════════════════════════════════════╗
    ║                                       ║
    ║   ~ Uninstallation Complete ~         ║
    ║   NoIP Manager has been successfully  ║
    ║   removed from your system.           ║
    ║                                       ║
    ╚═══════════════════════════════════════╝
    "
    echo "---------------------------------------------------------------------"
}

# Function to uninstall NoIP Manager
uninstall() {
    echo "Uninstalling NoIP Manager..."
    if [ -f /usr/local/bin/noip-admin ]; then
        sudo rm /usr/local/bin/noip-admin
        echo "NoIP Manager has been removed."
    else
        echo "NoIP Manager is not installed or already removed."
    fi
}

# Display the welcome message
welcome

# Perform the uninstallation
uninstall

# Display the finished message
finished
