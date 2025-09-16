#!/usr/bin/env sh

SPACE_ICONS=("1" "2" "3" "4" "5" "6")
SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  space=(
    associated_space=$sid
    drawing=on
    updates=on
    label.drawing=off
    ignore_association=on
    icon.color=0xff583794
    icon.highlight_color=0xffe0af68
    icon.padding_left=20
    icon.padding_right=60
    background.corner_radius=15
    background.color=$BACKGROUND_1
    background.height=30
    background.padding_left=-20
    background.padding_right=-20
    click_script="$SPACE_CLICK_SCRIPT"
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid center    \
             --set space.$sid "${space[@]}"   \
             --set space.6 "${space[@]}"      \
             icon.padding_right=20
done
