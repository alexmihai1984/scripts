#!/bin/bash

read -r _ user nice system idle iowait irq softirq steal _ < /proc/stat
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle=$((idle + iowait))

sleep 1

read -r _ user2 nice2 system2 idle2 iowait2 irq2 softirq2 steal2 _ < /proc/stat
total2=$((user2 + nice2 + system2 + idle2 + iowait2 + irq2 + softirq2 + steal2))
idle2=$((idle2 + iowait2))

usage=$(( (total2 - total - (idle2 - idle)) * 100 / (total2 - total) ))

printf "%3d%%\n" "$usage"
# printf "%d%%\n" "$usage"

# if (( usage >= 80 )); then
#     printf "#FF0000\n"
# elif (( usage >= 50 )); then
#     printf "#FFFC00\n"
# fi
