#!/usr/bin/env bash

# Ensure a terminal is used for TUI apps
TERMINAL="${TERMINAL:-alacritty}"

entries=(
  "CPU Usage"
  "Memory & Swap"
  "Disk Usage"
  "Disk I/O"
  "Network Usage"
  "Load Average"
  "GPU Usage"
  "Temperatures"
  "Processes"
  "Network Latency"
  "Containers"
  "Virtual Machines"
  "System Logs"
  "System Uptime"
)

choice=$(printf "%s\n" "${entries[@]}" | rofi -dmenu -i -p "Dev Stats")

case "$choice" in
  "CPU Usage")
    exec "$TERMINAL" -e missioncenter
    ;;
  "Memory & Swap")
    exec "$TERMINAL" -e missioncenter
    ;;
  "Disk Usage")
    exec "$TERMINAL" -e ncdu /
    ;;
  "Disk I/O")
    exec "$TERMINAL" -e sudo iotop
    ;;
  "Network Usage")
    exec "$TERMINAL" -e sudo iftop
    ;;
  "Load Average")
    exec "$TERMINAL" -e htop
    ;;
  "GPU Usage")
    if command -v nvtop >/dev/null; then
      exec "$TERMINAL" -e nvtop
    elif command -v nvidia-smi >/dev/null; then
      exec "$TERMINAL" -e watch nvidia-smi
    else
      exec notify-send "GPU stats unavailable"
    fi
    ;;
  "Temperatures")
    exec "$TERMINAL" -e watch sensors
    ;;
  "Processes")
    exec "$TERMINAL" -e htop
    ;;
  "Network Latency")
    exec "$TERMINAL" -e ping -c 100 8.8.8.8
    ;;
  "Containers")
    exec "$TERMINAL" -e lazydocker
    ;;
  "Virtual Machines")
    exec virt-manager
    ;;
  "System Logs")
    exec "$TERMINAL" -e journalctl -f
    ;;
  "System Uptime")
    exec "$TERMINAL" -e watch uptime
    ;;
esac

