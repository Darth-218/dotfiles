#!/bin/bash

WINDOW="TimeWindow VolumeWindow SystemWindow WifiWindow EthWindow"

if eww active-windows | grep -q "Window"; then
  eww close-all
else
  eww open-many $WINDOW
fi
