#!/bin/bash

if ps | grep poly -q; then
  polybar-msg cmd toggle
else
  polybar example &
fi
