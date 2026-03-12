#!/bin/bash

TOTAL_MEM=$(sysctl -n hw.memsize)
PAGE_SIZE=$(sysctl -n hw.pagesize)

RAM_PERCENT=$(vm_stat | awk -v total="$TOTAL_MEM" -v page="$PAGE_SIZE" '
    /Pages active:/ { sub(/\./, "", $NF); active = $NF }
    /Pages wired down:/ { sub(/\./, "", $NF); wired = $NF }
    /Pages occupied by compressor:/ { sub(/\./, "", $NF); compressed = $NF }
    END {
        used = (active + wired + compressed) * page
        printf "%.0f", (used / total) * 100
    }
')

sketchybar --set $NAME label="${RAM_PERCENT}%"
