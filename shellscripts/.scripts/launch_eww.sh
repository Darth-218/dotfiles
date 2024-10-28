#!/bin/bash

WINDOW="TimeWindow"

if eww active-windows | grep -q $WINDOW; then
  eww close $WINDOW
else
  eww open $WINDOW
fi
