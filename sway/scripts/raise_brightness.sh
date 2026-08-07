#!/bin/bash

shift_strength="${1:-5}"
brightness=$(brightnessctl get -P)
if [[ "$brightness" -lt "$shift_strength" ]]; then
	brightnessctl set "$shift_strength"%
else
	brightnessctl set +"$shift_strength"%
fi
