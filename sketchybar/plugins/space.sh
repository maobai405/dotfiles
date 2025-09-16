#!/usr/bin/env sh

source "$CONFIG_DIR/icons.sh"  # Loads all defined icons

args=()
if [ "$NAME" != "space_template" ]; then
  args+=(--set $NAME label=$NAME \
                     icon.highlight=$SELECTED)
fi

sketchybar -m --animate tanh 0 "${args[@]}"

if [ "$SELECTED" = "true" ]; then
  args+=(--set spaces_$DID.label label=${NAME#"spaces_$DID."} \
         --set $NAME icon.background.y_offset=0               )
fi

WIN=$(yabai -m query --spaces --space $SID | jq '.windows[0]')
HAS_WINDOWS_OR_IS_SELECTED="true"
if [ "$WIN" = "null" ] && [ "$SELECTED" = "false" ];then
  HAS_WINDOWS_OR_IS_SELECTED="false"
fi

if [ "$HAS_WINDOWS_OR_IS_SELECTED" = "true" ]; then
   icon=$SPACE_ACTIVATE
   iconfont="$FONT:Regular:18.0"
   offset="1"
   iconcolor=0xff7aa1f7
else
   icon=$SPACE_REGULAR
   iconfont="$FONT:Regular:20.0"
   iconcolor=0xff583794
fi

if [ "$SELECTED" = "true" ]; then
   icon=$SPACE_CURRENT
   iconfont="$FONT:Regular:22.0"
   offset="1"
fi


sketchybar --set $NAME icon=$icon icon.font="$iconfont" icon.highlight=$SELECTED icon.y_offset=$offset icon.color=$iconcolor 
