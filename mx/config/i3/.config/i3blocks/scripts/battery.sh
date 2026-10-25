#!/bin/bash

BAT=/sys/class/power_supply/BAT0

capacity=$(cat "$BAT/capacity")
status=$(cat "$BAT/status")
text="${capacity}%"

if [[ "$status" == "Discharging" ]]; then
    time=$(acpi -b | awk -F', ' '
        /^Battery 0:/ && /Discharging/ {
            if ($3 ~ /^[0-9]+:[0-9]+:[0-9]+ remaining/) {
                sub(/ remaining.*/, "", $3)
                split($3, t, ":")
                printf "%02d:%02d", t[1], t[2]
            }
            exit
        }
    ')

    [[ -n "$time" ]] && text+="  $time"

elif [[ "$status" == "Charging" ]]; then
    text+="      "
else
    text+="      "
fi

printf '%s\n' "$text"
printf '%s\n' "$text"

if [[ "$status" == "Discharging" ]]; then
    if (( capacity < 20 )); then
        printf '#fb4934\n'
    elif (( capacity < 40 )); then
        printf '#fe8019\n'
    elif (( capacity < 60 )); then
        printf '#fabd2f\n'
    elif (( capacity < 85 )); then
        printf '#8ec07c\n'
    fi

    if (( capacity < 5 )); then
        exit 33
    fi
fi
