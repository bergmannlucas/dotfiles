#!/bin/bash

sketchybar --add item calendar center
sketchybar --set calendar icon=󰃭 update_freq=60 script="$PLUGIN_DIR/calendar.sh"

