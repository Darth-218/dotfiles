#!/bin/bash

# Check if Bluetooth is powered on
status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$status" = "yes" ]; then
    echo "Turning Bluetooth OFF..."
    bluetoothctl power off
else
    echo "Turning Bluetooth ON..."
    bluetoothctl power on
fi

