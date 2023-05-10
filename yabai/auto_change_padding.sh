#!/bin/bash

# Get the current top_padding value
CURRENT_PADDING=$(yabai -m query --spaces --space | jq -r '.windows[0].top_padding')

# Set the new top_padding value
if [ "$CURRENT_PADDING" -eq 10 ]; then
  yabai -m config top_padding 50
else
  yabai -m config top_padding 10
fi

