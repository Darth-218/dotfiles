#!/bin/bash

# Change Keymap 
xmodmap ~/.dotfiles/Keymap/switchedkeys

sudo systemctl start sddm &

# Set background
feh --bg-scale ~/suckless/Wallpaper.jpg &

# Set status bar
slstatus &

# Start dunst (Notification manager)
if pgrep -x "dunst" > /dev/null; then
  :
else
  dunst -conf ~/.dotfiles/dunst/dunstrc &
fi

# Start picom (Compositor)
if pgrep -x "picom" > /dev/null; then
    notify-send "Picom is Running"
else
    picom --config ~/.config/picom/picom.conf &
    notify-send "Picom is Started"
fi

# Start emacs' daemon
if pgrep -x "emacs" > /dev/null; then
    notify-send "Emacs Daemon is Running"
else
    notify-send "Starting Emacs Daemon"
    emacs --daemon &
    notify-send "Emacs Daemon is Started"
fi


