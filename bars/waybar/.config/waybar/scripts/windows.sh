#!/usr/bin/bash

# Get the active workspace ID
active_ws=$(hyprctl activeworkspace -j | jq -r '.id')

# Count the number of windows in that workspace
count=$(hyprctl clients -j | jq "[.[] | select(.workspace.id == $active_ws)] | length")

echo "$count"

