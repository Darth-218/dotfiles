# -------------------------
# Time / Date
# -------------------------
TIME="$(date '+%d-%m-%Y @ %H:%M')"

# -------------------------
# Battery
# -------------------------
BAT_PATH="/sys/class/power_supply/BAT1"
if [ -d "$BAT_PATH" ]; then
    BAT_CAP=$(cat "$BAT_PATH/capacity")
    BAT_STAT=$(cat "$BAT_PATH/status")
    BAT="bat: ${BAT_CAP}% (${BAT_STAT})"
else
    BAT="bat: n/a"
fi

# -------------------------
# Volume (PipeWire / PulseAudio)
# -------------------------
if command -v wpctl >/dev/null 2>&1; then
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | awk '{printf "vol: %d%%", $2 * 100}')
    MUTE=$(wpctl get-mute @DEFAULT_AUDIO_SINK@ 2>/dev/null)
    [ "$MUTE" = "yes" ] && VOL="vol: muted"
elif command -v pamixer >/dev/null 2>&1; then
    VOL="vol: $(pamixer --get-volume-human)"
else
    VOL="vol: n/a"
fi

# -------------------------
# Network
# -------------------------
IFACE=$(ip route | awk '/default/ {print $5; exit}')
if [ -d "/sys/class/net/$IFACE/wireless" ]; then
    NET=$(nmcli -t -f NAME,DEVICE connection show --active 2>/dev/null | grep ":$IFACE" | cut -d: -f1)
    if [ -z "$NET" ]; then
        NET="wifi: not connected"
    else
        SSID=$(nmcli -g 802-11-wireless.ssid connection show "$NET" 2>/dev/null)
        [ -z "$SSID" ] && NET="wifi: not connected" || NET="wifi: $SSID"
    fi
else
    IP=$(ip -4 addr show "$IFACE" 2>/dev/null | awk '/inet / {print $2}' | cut -d/ -f1)
    [ -z "$IP" ] && NET="net: down" || NET="ethernet: $IP"
fi

# -------------------------
# Compose notification text
# -------------------------
TEXT="$TIME
$NET
$BAT
$VOL
"

# -------------------------
# Send notification
# -------------------------
notify-send "System Status" "$TEXT"

