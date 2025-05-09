#!/bin/sh
grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of the region taken" -t 5000 # screenshot of a region
