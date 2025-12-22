#!/bin/sh

# time
TIME="$(date '+%Y-%m-%d %H:%M')"

# battery
BAT_PATH="/sys/class/power_supply/BAT0"
if [ -d "$BAT_PATH" ]; then
  BAT="$(cat "$BAT_PATH/capacity")%"
else
  BAT="n/a"
fi

# volume (PipeWire or PulseAudio)
VOL="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null \
  | awk '{printf "%d%%", $2 * 100}')"
[ -z "$VOL" ] && VOL="n/a"

# network (safe: no nl80211)
IFACE="$(ip route | awk '/default/ {print $5; exit}')"
IP="$(ip -4 addr show "$IFACE" 2>/dev/null \
  | awk '/inet / {print $2}' | cut -d/ -f1)"

[ -z "$IP" ] && NET="net:down" || NET="net:$IP"

notify-send "Status" \
  " $NET\n bat:$BAT\n vol:$VOL\n $TIME"

