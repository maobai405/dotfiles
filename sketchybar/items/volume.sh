#!/bin/bash

volume_slider=(
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color="$PUEPLE"
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color="$SIDER_BG"
  slider.knob="$SPACE_ACTIVATE"
  slider.knob.color="$BLUE"
  slider.knob.drawing=on
  script="$PLUGIN_DIR/volume.sh"
)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=10
  icon.align=left
  icon.color="$GREY"
  label.width=25
  label.align=left
  label.font="$FONT:Regular:20.0"
)

status_bracket=(
  background.color="$BACKGROUND_1"
  background.border_color="$BACKGROUND_1"
)

sketchybar --add slider volume right            \
           --set volume "${volume_slider[@]}"   \
           --subscribe volume volume_change     \
                              mouse.clicked     \
                                                \
           --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}"

sketchybar --add bracket status brew wifi volume_icon \
           --set status "${status_bracket[@]}"
