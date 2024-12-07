#!/bin/bash

git pull && git add -A && git commit -a -m "quick backup: `date +'%d-%m-%Y %H-%M-%S'`" && git pull
