#!/bin/bash

convert_to_socket() {
    local service_name="$1"
    local socket_name="${service_name/.service/.socket}"

    echo "Checking $service_name service..."

    if systemctl is-enabled "$service_name" &>/dev/null; then
        echo "$service_name is enabled. Converting to socket activation..."

        if systemctl list-unit-files "$socket_name" &>/dev/null; then
            sudo systemctl disable "$service_name"
            echo "$service_name service disabled."

            sudo systemctl enable "$socket_name"
            sudo systemctl start "$socket_name"
            echo "$socket_name socket enabled and started."
        else
            echo "Error: $socket_name does not exist. Cannot convert."
        fi
    else
        echo "$service_name is not enabled. No action taken."
    fi
}

convert_to_socket "docker.service"
convert_to_socket "cups.service"
