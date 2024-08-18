#!/bin/bash

CONFIG_FILE="$HOME/.noip_duc_config"
PID_FILE="/tmp/noip_duc.pid"

# Function to save configuration
save_config() {
    echo "USERNAME=\"$USERNAME\"" > "$CONFIG_FILE"
    echo "PASSWORD=\"$PASSWORD\"" >> "$CONFIG_FILE"
    echo "RUN_AS_DAEMON=\"$RUN_AS_DAEMON\"" >> "$CONFIG_FILE"
    echo "DOMAINS=\"$DOMAINS\"" >> "$CONFIG_FILE"
}

# Function to load configuration
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    else
        echo "No configuration file found. Starting setup."
        read -p "Enter your No-IP username: " USERNAME
        read -sp "Enter your No-IP password: " PASSWORD
        echo
        read -p "Do you want to run the No-IP client as a daemon? (y/n): " daemon_choice
        if [[ $daemon_choice == "y" || $daemon_choice == "Y" ]]; then
            RUN_AS_DAEMON="yes"
        else
            RUN_AS_DAEMON="no"
        fi
        read -p "Enter your domain(s) (separated by space): " DOMAINS
        save_config
        echo "Configuration saved to $CONFIG_FILE."
    fi
}

# Function to start the No-IP client
start_noip() {
    if [ -f "$PID_FILE" ]; then
        echo "No-IP client is already running."
    else
        if [ "$RUN_AS_DAEMON" == "yes" ]; then
            noip-duc --username "$USERNAME" --password "$PASSWORD" --daemonize --daemon-pid-file "$PID_FILE" --check-interval 5m --hostnames "$DOMAINS"
        else
            noip-duc --username "$USERNAME" --password "$PASSWORD" --check-interval 5m --hostnames "$DOMAINS" &
            echo $! > "$PID_FILE"
        fi
        if [ $? -eq 0 ]; then
            echo "No-IP client started successfully."
        else
            echo "Failed to start No-IP client."
        fi
    fi
}

# Function to stop the No-IP client
stop_noip() {
    if [ ! -f "$PID_FILE" ]; then
        echo "No-IP client is not running."
        return
    fi

    PID=$(cat "$PID_FILE")
    if [ -z "$PID" ]; then
        echo "PID file is empty. Cannot stop No-IP client."
        return
    fi

    if ! kill "$PID" > /dev/null 2>&1; then
        echo "Failed to stop No-IP client."
    else
        rm -f "$PID_FILE"
        echo "No-IP client stopped successfully."
    fi
}

# Function to check the status of the No-IP client
status_noip() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p "$PID" > /dev/null 2>&1; then
            echo "No-IP client is running."
        else
            echo "No-IP client is not running."
        fi
    else
        echo "No-IP client is not running."
    fi
}

# Function to update a specific domain
update_domain() {
    read -p "Enter the domain you want to update: " DOMAIN
    noip-duc --username "$USERNAME" --password "$PASSWORD" --hostnames "$DOMAIN" --once
    if [ $? -eq 0 ]; then
        echo "Domain $DOMAIN updated successfully."
    else
        echo "Failed to update domain $DOMAIN."
    fi
}

# Function to setup No-IP account
setup_account() {
    read -p "Enter your No-IP username: " USERNAME
    read -sp "Enter your No-IP password: " PASSWORD
    echo
    read -p "Do you want to run the No-IP client as a daemon? (y/n): " daemon_choice
    if [[ $daemon_choice == "y" || $daemon_choice == "Y" ]]; then
        RUN_AS_DAEMON="yes"
    else
        RUN_AS_DAEMON="no"
    fi
    read -p "Enter your domain(s) (separated by space): " DOMAINS
    save_config
    echo "Configuration updated and saved to $CONFIG_FILE."
}

# Function to toggle daemon mode
toggle_daemon_mode() {
    if [ "$RUN_AS_DAEMON" == "yes" ]; then
        echo "Currently running as daemon. Switching to non-daemon mode."
        RUN_AS_DAEMON="no"
    else
        echo "Currently running in non-daemon mode. Switching to daemon mode."
        RUN_AS_DAEMON="yes"
    fi
    save_config
    echo "Daemon mode toggled. Configuration updated and saved to $CONFIG_FILE."
}

# Function to get the current IP address
get_current_ip() {
    IP=$(curl -s ifconfig.me)
    if [ -n "$IP" ]; then
        echo "$IP"
    else
        echo "Unable to retrieve current IP address."
    fi
}

# Load configuration
load_config

# Main menu loop
while true; do
    echo "=============================="
    echo " No-IP Dynamic Update Client "
    echo "=============================="
    echo "1) Start No-IP Client"
    echo "2) Stop No-IP Client"
    echo "3) Check No-IP Client Status"
    echo "4) Update a Domain"
    echo "5) Setup No-IP Account"
    echo "6) Toggle Daemon Mode (Currently: $RUN_AS_DAEMON)"
    echo "7) Check IP Address"
    echo "8) Exit"
    echo "=============================="
    read -p "Choose an option: " OPTION

    case $OPTION in
        1) start_noip ;;
        2) stop_noip ;;
        3) status_noip ;;
        4) update_domain ;;
        5) setup_account ;;
        6) toggle_daemon_mode ;;
        7) get_current_ip ;;
        8) exit 0 ;;
        *) echo "Invalid option. Please choose a valid option." ;;
    esac
done

