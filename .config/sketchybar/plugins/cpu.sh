#!/bin/bash

CPU_PERCENT=$(top -l 2 -n 0 | awk '/^CPU usage:/ {
    user=$3; 
    sys=$5; 
    sub("%", "", user); 
    sub("%", "", sys); 
    total = user + sys;
} END {
    printf "%.0f\n", total
}')

sketchybar --set $NAME label="${CPU_PERCENT}%"
