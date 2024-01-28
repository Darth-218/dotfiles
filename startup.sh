#!/bin/bash

if pgrep -x "dunst" > /dev/null; then
  :
else
  dunst -conf ~/.config/dunst/dunstrc &
fi

if pgrep -x "emacs" > /dev/null; then
    notify-send "Emacs Daemon is Running"
else
    notify-send "Starting Emacs Daemon"
    emacs --daemon
    notify-send "Emacs Daemon is Started"
fi

if pgrep -x "picom" > /dev/null; then
    notify-send "Picom is Running"
else
    picom --config ~/.config/picom/picom.conf &
    notify-send "Picom is Started"
fi

feh --bg-scale ~/suckless/Wallpaper.jpg &

slstatus &

