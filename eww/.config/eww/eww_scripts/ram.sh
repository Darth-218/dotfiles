#!/bin/bash

free -h | grep Mem | awk '{print ($3) * 100 / ($2)}' | awk -F '.' '{print ($1)}'
