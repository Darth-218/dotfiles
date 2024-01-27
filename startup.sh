#!/bin/bash

if pgrep -x "emacs" > /dev/null; then
    :
else
    emacs --daemon
fi

if pgrep -x "picom" > /dev/null; then
    :
else
    picom --config ~/.config/picom/picom.conf &
fi

feh --bg-scale ~/suckless/Wallpaper.jpg &

# dunst &

slstatus &

