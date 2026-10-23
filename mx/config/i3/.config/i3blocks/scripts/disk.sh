#!/bin/bash

DIR="${BLOCK_INSTANCE:-/}"

df -B1 -P "$DIR" | awk '
NR == 2 {
    total = $2
    used = $3
    percent = used / total * 100

    printf "%.0fG/%.0fG (%.0f%%)\n",
        used/1073741824,
        total/1073741824,
        percent
}'
