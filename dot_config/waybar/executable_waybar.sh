#!/bin/bash
killall -q waybar
while pgrep -x waybar >/dev/null; do sleep 0.25; done
waybar
