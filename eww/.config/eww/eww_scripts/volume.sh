#!/bin/bash

awk -F"[][]" '/Mono/ { print $2 }' <(amixer sget Master)
