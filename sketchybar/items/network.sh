#!/usr/bin/env bash

network_down=(
  width=100
  y_offset=-7
	label.font="$FONT:Bold:12"
	label.color="$GREY"
  label.padding_right=10
	icon="$NETWORK_DOWN"
	icon.font="$FONT:Bold:16.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	update_freq=1
)

network_up=(
	background.padding_right=-90
	y_offset=7
	label.font="$FONT:Bold:12"
	label.color="$GREY"
	icon="$NETWORK_UP"
	icon.font="$FONT:Bold:16.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	update_freq=1
	script="$PLUGIN_DIR/network.sh"
)

sketchybar 	--add item network.down right 						\
						--set network.down "${network_down[@]}" 	\
						--add item network.up right 							\
						--set network.up "${network_up[@]}"
