#!/bin/bash

calendar=(
  width=200
  background.color=$BACKGROUND_1
  align=center
  icon=$CALENDAR
  icon.font="$FONT:Bold:18.0"
  icon.color=$BLUE
  icon.padding_right=2
  label.font="$FONT:Bold:14.0"
  label.color=$GREY
  update_freq=1
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
