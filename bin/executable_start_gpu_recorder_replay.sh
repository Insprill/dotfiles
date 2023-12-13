#!/bin/bash
gpu-screen-recorder -w DP-2 -c mp4 -k av1 -f 60 -r 120 -a "$(pactl get-default-sink).monitor|$(pactl get-default-source)" -o /home/insprill/Videos/
