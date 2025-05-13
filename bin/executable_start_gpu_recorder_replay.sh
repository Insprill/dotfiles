#!/bin/bash

if vulkaninfo | grep -q -i 'VK_KHR_video_encode_av1'; then
    codec="av1_10bit"
elif vulkaninfo | grep -q -i 'VK_KHR_video_encode_h265'; then
    codec="hevc_10bit"
else
    codec="h264"
fi

gpu-screen-recorder -w "$DEFAULT_MONITOR" -c mp4 -k "$codec" -f 60 -r 120 -restart-replay-on-save yes -a "default_input|default_output" -o "$HOME/Videos"
