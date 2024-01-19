#!/bin/bash

is_external_display() {
    display_type=$(system_profiler SPDisplaysDataType | awk '/Type:/ {print $2}')
    if [ "$display_type" == "External" ]; then
        echo "true"
    else
        echo "false"
    fi
}

resolution=$(system_profiler SPDisplaysDataType | awk '/Resolution:/ {print $2}')
if [ -n "$resolution" ]; then
    if [ "$(is_external_display)" == "false" ]; then
        yabai -m config top_padding 50
    else
        yabai -m config top_padding 10
    fi
    else
    yabai -m config top_padding 10
fi
