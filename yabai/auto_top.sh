#!/bin/bash

# Get the number of connected displays
display_count=$(system_profiler SPDisplaysDataType | grep -c "Resolution:")

# If there is only one display, set top_padding to 10
if [ "$display_count" -eq "1" ]; then
    yabai -m config top_padding 10
# If there are multiple displays, set top_padding to 50
else
    yabai -m config top_padding 50
fi
