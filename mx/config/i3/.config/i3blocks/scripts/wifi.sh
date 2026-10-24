
#!/bin/bash

INTERFACE="${BLOCK_INSTANCE:-wlan0}"

# Hide the block if the interface has no wireless connection
[[ ! -d "/sys/class/net/$INTERFACE/wireless" ]] ||
    [[ "$(cat "/sys/class/net/$INTERFACE/operstate")" = "down" ]] && exit

# Convert signal level (dBm) to a percentage:
# -30 dBm or stronger = 100%
# -90 dBm or weaker   = 0%
QUALITY=$(awk -v iface="$INTERFACE" '$1 == iface":" {
    q = int(($4 + 90) * 100 / 60)
    if (q < 0) q = 0
    if (q > 100) q = 100
    print q
}' /proc/net/wireless)

# Output full text and short text
printf "%3d%%\n" "$QUALITY"
# echo "$QUALITY%"

# Color based on signal strength
# if [[ "$QUALITY" -ge 80 ]]; then
#     echo "#00FF00"
# elif [[ "$QUALITY" -ge 60 ]]; then
#     echo "#FFF600"
# elif [[ "$QUALITY" -ge 40 ]]; then
#     echo "#FFAE00"
# else
#     echo "#FF0000"
# fi
