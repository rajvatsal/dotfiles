#!/bin/bash

is_already_running=$(ps -fC 'grep' -N | grep 'battery.sh' | wc -l)
if [[ ${is_alread_running} -ge 1 ]]; then
  $(pkill -f --older 1 'battery.sh')
fi

while [[ 0 -eq 0 ]]; do
  bat_status=$(cat /sys/class/power_supply/BAT0/status)
  bat_capacity=$(cat /sys/class/power_supply/BAT0/capacity)

  if [[ ${bat_status} == 'Discharging' && ${bat_capacity} -le 75 ]]; then
    if [[ ${bat_capacity} -le 15 ]]; then
      notify-send --urgency=critical "Critically Low Charge!!! :(" "Charge: ${bat_capacity}%"
      sleep 120
    elif [[ ${bat_capacity} -le 20 ]]; then
      notify-send --urgency=critical "Very Low Charge!!" "Charge: ${bat_capacity}%"
      sleep 300
    elif [[ ${bat_capacity} -le 30 ]]; then
      notify-send --urgency=normal "Low Charge" "Charge: ${bat_capacity}%"
      sleep 300
    else
      notify-send --urgency=low "Charge: ${bat_capacity}%"
      sleep 600
    fi
  else
    sleep 600
  fi
done

