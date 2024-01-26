#!/bin/bash

if pgrep -x "emacs" > /dev/null; then
    echo "Emacs daemon is running."
else
    emacs --daemon
fi

if pgrep -x "picom" > /dev/null; then
    echo ""
else
    picom --config ~/.config/picom &
fi

feh --bg-scale ~/suckless/Wallpaper.jpg &

slstatus &

