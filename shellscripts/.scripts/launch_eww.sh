#!/bin/bash

WINDOW="TimeWindow VolumeWindow SystemWindow WifiWindow"

if eww active-windows | grep -q "Window"; then
  eww close-all
else
  eww open-many $WINDOW
fi
