#!/bin/bash
read -p "Enter a number for the brightness percentage: " brightness_percentage
sudo brightnessctl -d "intel_backlight" set $brightness_percentage%
