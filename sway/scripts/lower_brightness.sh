shift_strength="${1:-5}"
brightness=$(brightnessctl get -P)
if [[ "$brightness" -le "$shift_strength" ]]; then
	brightnessctl set 1%
else
	brightnessctl set "$shift_strength"%-
fi
