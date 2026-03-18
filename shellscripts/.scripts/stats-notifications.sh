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
    VOL_VAL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | awk '{printf "%d", $2 * 100}')
    SINK_MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}')
    MIC_MUTE=$(pactl get-source-mute @DEFAULT_SOURCE@ 2>/dev/null | awk '{print $2}')
    [ "$SINK_MUTE" = "yes" ] && VOL="vol: ${VOL_VAL}% (muted)" || VOL="vol: ${VOL_VAL}%"
    [ "$MIC_MUTE" = "yes" ] && MIC="mic: off" || MIC="mic: on"
    VOL="$VOL, $MIC"
elif command -v pamixer >/dev/null 2>&1; then
    VOL_VAL=$(pamixer --get-volume)
    MIC_MUTE=$(pamixer --default-source --get-mute 2>/dev/null)
    [ "$(pamixer --get-mute)" = "true" ] && VOL="vol: ${VOL_VAL}% (muted)" || VOL="vol: ${VOL_VAL}%"
    [ "$MIC_MUTE" = "true" ] && MIC="mic: off" || MIC="mic: on"
    VOL="$VOL, $MIC"
else
    VOL="vol: n/a, mic: n/a"
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
makoctl dismiss -a 2>/dev/null
notify-send "System Status" "$TEXT"

