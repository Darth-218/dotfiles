#!/bin/bash

# Set background
feh --bg-scale ~/suckless/Wallpaper.jpg &

# Set status bar
slstatus &

# Start dunst (Notification manager)
if pgrep -x "dunst" >/dev/null; then
	:
else
	dunst -conf ~/.dotfiles/dunst/dunstrc &
fi

# # Start picom (Compositor)
# if pgrep -x "picom" > /dev/null; then
#     notify-send -a "Picom" "Picom is starting"
# else
#     picom --config ~/.config/picom/picom.conf &
#     notify-send -a "Picom" "Picom is Started"
# fi

# Start emacs' daemon
# if pgrep -x "emacs" > /dev/null; then
#     notify-send -a "Emacs" "Emacs Daemon is Running"
# else
#     notify-send -a "Emacs" "Starting Emacs Daemon"
#     emacs --daemon &
#     notify-send -a "Emacs" "Emacs Daemon is Started"
# fi

# Change Keymap
setxkbmap -option "caps:swapescape"
setxkbmap -option "ctrl:swap_lalt_lctl"
