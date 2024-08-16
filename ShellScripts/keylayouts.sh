#!/bin/bash

# List of keyboard layouts
layouts=("us" "ara")

# Display menu with Rofi and capture the selected layout
selected_layout=$(printf "%s\n" "${layouts[@]}" | rofi -dmenu -i -p "Select Keyboard Layout:" -theme "~/.config/rofi/launchers/type-4/style-4.rasi")

# If a layout was selected, set it
if [[ -n "$selected_layout" ]]; then
    setxkbmap "$selected_layout"
    notify-send "Keyboard Layout" "Switched to $selected_layout"
else
    notify-send "Keyboard Layout" "No layout selected"
fi

