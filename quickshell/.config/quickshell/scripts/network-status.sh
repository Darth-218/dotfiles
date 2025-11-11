#!/bin/bash
TYPE=$(nmcli -t -f TYPE,STATE dev | grep ":connected" | cut -d: -f1)
[ -z "$TYPE" ] && TYPE="none"
echo "{\"type\":\"$TYPE\"}" > ~/.config/quickshell/network-status.json

