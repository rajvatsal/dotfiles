#!/bin/bash

shift_strength="${1:-5}"
volume=$(pamixer --get-volume)

if [[ $(( "$volume" + "$shift_strength" )) -gt 100 ]]; then
  pactl set-sink-volume @DEFAULT_SINK@ 100%
else
  pactl set-sink-volume @DEFAULT_SINK@ +5% 
fi
