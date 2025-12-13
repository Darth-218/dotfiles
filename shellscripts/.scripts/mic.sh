#!/bin/bash

# Get default source mute status
status=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

if [ "$status" = "yes" ]; then
    echo "0"
else
    echo "1"
fi
