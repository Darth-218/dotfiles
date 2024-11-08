#!/bin/bash

nmcli -t -f active,ssid dev wifi | grep 'yes' | awk -F ':' '{print ($2)}'
