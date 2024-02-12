

audiolvl=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))

did=$(notify-send -p "audio")

notify-send -i /usr/share/swcatalog/icons/archlinux-arch-extra/48x48/plasma-pa_audio-volume-high.png -a "Audio" "$audiolvl" -p -r "$did"
