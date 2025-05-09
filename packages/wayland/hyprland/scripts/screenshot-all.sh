#!/bin/sh
grim - | wl-copy && wl-paste > ~/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of whole screen taken" -t 5000 # screenshot of the whole screen
