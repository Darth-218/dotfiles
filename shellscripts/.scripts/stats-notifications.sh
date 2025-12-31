#!/bin/bash

# -------------------------
# Time / Date
# -------------------------
TIME="$(date '+%d-%m-%Y %H:%M')"

# -------------------------
# Battery
# -------------------------
BAT_PATH="/sys/class/power_supply/BAT1"
if [ -d "$BAT_PATH" ]; then
    BAT_CAP=$(cat "$BAT_PATH/capacity")
    BAT_STAT=$(cat "$BAT_PATH/status")
    BAT="bat:${BAT_CAP}% (${BAT_STAT})"
else
    BAT="bat:n/a"
fi

# -------------------------
# Volume (PipeWire / PulseAudio)
# -------------------------
if command -v wpctl >/dev/null 2>&1; then
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | awk '{printf "%d%%", $2 * 100}')
    MUTE=$(wpctl get-mute @DEFAULT_AUDIO_SINK@ 2>/dev/null)
    [ "$MUTE" = "yes" ] && VOL="vol:mute"
elif command -v pamixer >/dev/null 2>&1; then
    VOL=$(pamixer --get-volume-human)
else
    VOL="vol:n/a"
fi

# -------------------------
# Network
# -------------------------
IFACE=$(ip route | awk '/default/ {print $5; exit}')
IP=$(ip -4 addr show "$IFACE" 2>/dev/null | awk '/inet / {print $2}' | cut -d/ -f1)
[ -z "$IP" ] && NET="net:down" || NET="net:$IP"

# -------------------------
# CPU / Memory / Load
# -------------------------
CPU=$(top -bn1 | awk '/Cpu/ {printf "%d%%", $2 + $4}')
MEM=$(free -m | awk '/Mem/ {printf "%d%%", $3/$2*100}')
LOAD=$(uptime | awk -F'load average:' '{print $2}' | xargs)

# -------------------------
# Disk
# -------------------------
ROOT_DISK=$(df -h / | awk 'NR==2 {print $4 " free"}')
HOME_DISK=$(df -h $HOME | awk 'NR==2 {print $4 " free"}')

# -------------------------
# Brightness
# -------------------------
if [ -f /sys/class/backlight/*/brightness ]; then
    BRIGHT=$(cat /sys/class/backlight/*/brightness)
    MAX_BRIGHT=$(cat /sys/class/backlight/*/max_brightness)
    BRIGHT=$(( BRIGHT * 100 / MAX_BRIGHT ))
    BRIGHT="bright:${BRIGHT}%"
else
    BRIGHT="bright:n/a"
fi

# -------------------------
# Keyboard layout
# -------------------------
KBD=$(setxkbmap -query | awk '/layout/ {print $2}')

# -------------------------
# VPN status (optional)
# -------------------------
VPN=$(ip link show tun0 2>/dev/null | grep -q "state UP" && echo "vpn:up" || echo "vpn:down")

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

